# pragma OPENCL EXTENSION cl_khr_fp64 : enable

/* Inline function that calculates the normal CDF */
inline double NormCDF(
    double z) {

    double roottwo = sqrt((double)(2.0));
    double CDF = (double)(0.5)*(1.0 + erf(z/roottwo));
    return CDF;
}

/* Kernel for calculating transition probabilities among (discretized) continuous health states */
__kernel void makeTransPrbArray(
     __global double* TransPrbArray
    ,__global double* xGrid
    ,__global double* xCuts
    ,__global double* ExpHealthBase
    ,__global double* CorrVec
    ,__global double* Parameters
    ,__global int* IntegerInputs
    ) {

    /* Unpack the integer inputs */
    int xCount = IntegerInputs[7];       /* number of points in xGrid */
    int AgeCountA = IntegerInputs[2];    /* number of ages in most arrays */
    int ShockTypes = IntegerInputs[8];   /* number of normal shocks in mixed distribution */
    int ThreadCount = 2*AgeCountA*xCount*xCount; /* total number of transition probabilities */
    
    /* Initialize this thread's id and get this thread's identity */
    int Gid = get_global_id(0); /* global thread id */
    if (Gid >= ThreadCount) {
        return;
    }
    int temp;
    int Sex = Gid/(AgeCountA*xCount*xCount);
    temp = Gid - Sex*AgeCountA*xCount*xCount;
    int Age = temp/(xCount*xCount);
    temp = temp - Age*xCount*xCount;
    int i = temp/xCount;
    int j = temp - i*xCount;

    /* Get current health state and boundaries of next health state */
    double xNow = xGrid[i];
    double xBot = xCuts[j];
    double xTop = xCuts[j+1];

    /* Calculate expected health next period */
    double HealthSex = Parameters[0];
    double HealthAgeSex = Parameters[1];
    double age_incr = Parameters[2];
    double ExpHealthNext = ExpHealthBase[Age] + (double)Sex*HealthSex + (double)Sex*(double)Age*age_incr*HealthAgeSex;
    double Corr = CorrVec[Age];
    ExpHealthNext = Corr*xNow + (1.0 - Corr)*ExpHealthNext;

    /* Initialize transition probability to zero */
    double TransPrb = 0.0;
    double bot_dist;
    double top_dist;
    double avg_temp;
    double std_temp;
    double prb_temp;

    /* Calculate the probability of transitioning from this health state to the next one */
    int n = 0;
    while (n < ShockTypes) {
        avg_temp = Parameters[3+n];
        std_temp = Parameters[3+ShockTypes+n];
        prb_temp = Parameters[3+2*ShockTypes+n];

        bot_dist = (xBot - (ExpHealthNext + avg_temp)) / std_temp;
        top_dist = (xTop - (ExpHealthNext + avg_temp)) / std_temp;
        if (j == 0) { bot_dist -= 20.0; }
        if (j == (xCount-1)) { top_dist += 20.0; }

        if (bot_dist < 4.0) {
            TransPrb += (NormCDF(top_dist) - NormCDF(bot_dist))*prb_temp;
        }
        else {
            TransPrb += (NormCDF(-bot_dist) - NormCDF(-top_dist))*prb_temp;
        }
        n += 1;
    }
    TransPrbArray[Gid] = TransPrb;
}


/* Kernel for adjusting transition probabilities between continuous health states */
__kernel void adjustTransPrbArray(
     __global double* TransPrbArray
    ,__global int* IntegerInputs
    ) {

    /* Unpack the integer inputs */
    int xCount = IntegerInputs[7];       /* number of points in xGrid */
    int AgeCountA = IntegerInputs[2];    /* number of ages in most arrays */
    int ThreadCount = 2*AgeCountA*xCount;
    
    /* Initialize this thread's id and get this thread's identity */
    int Gid = get_global_id(0); /* global thread id */
    if (Gid >= ThreadCount) {
        return;
    }
    int Offset = xCount*Gid;

    /* Calculate the sum of probabilities */
    double SumPrb = 0.0;
    int x;
    for (x=0; x < xCount; x++) {
        SumPrb += TransPrbArray[Offset+x];
    }
    
    /* Adjust probabilities using the sum */
    double InvSumPrb = 1.0/SumPrb;
    for (x=0; x < xCount; x++) {
        TransPrbArray[Offset+x] *= InvSumPrb;
    }
}


/* Kernel for calculating log likelihood of each individual in the data */
__kernel void evalHiddenHealthLL(
     __global double* LivPrbArray
    ,__global double* TransPrbArray
    ,__global double* ReportPrbArray
    ,__global double* HealthInitDstn
    ,__global double* HealthDstnNow
    ,__global double* TempDstnNow
    ,__global double* LogLikelihood
    ,__global double* TypeProb
    ,__global int* AgeVec
    ,__global int* SexVec
    ,__global int* ReportVec
    ,__global int* StartVec
    ,__global int* LengthVec
    ,__global int* IntegerInputs
    ,__global int* MeasureStarts
    ) {

    /* Unpack the integer inputs */
    int MeasCount = IntegerInputs[0];    /* number of measures in data */
    int xCount = IntegerInputs[1];       /* number of points in xGrid */
    int AgeCountA = IntegerInputs[2];    /* number of ages in most arrays */
    int AgeCountB = IntegerInputs[3];    /* number of ages in HealthInitDstn */
    int ThreadCount = IntegerInputs[4];  /* number of threads in total */
    int DataStart = IntegerInputs[5];    /* first index in data to touch */
    int DataEnd = IntegerInputs[6];      /* ending index in data to touch */
    int xCountCond = IntegerInputs[7];   /* number of points in xGrid conditional on type */
    int TypeCount = xCount / xCountCond; /* number of heterogeneous types */

    /* Initialize this thread's id and get this thread's identity */
    int Gid = get_global_id(0); /* global thread id */
    if (Gid >= ThreadCount) {
        return;
    }
    int OffsetA = Gid*xCount;   /* starting point of private workspace */

    /* Initialize private working variables */
    int Age;                    /* individual's current "age", might not be in years */      
    int Sex;                    /* whether individual is male */
    int Start;                  /* starting point in HealthVec for this individual */
    int Length;                 /* number of periods in this individual's data */
    int OffsetB;                /* offset of array of interest at moment */
    int x;                      /* index of xGrid */
    int xa;                     /* alternate index of xGrid, needed for transitions */
    int xTop;                   /* temporary top index of the xGrid, used during transitions */
    int t;                      /* current period of individual's data */
    int m;                      /* index of current data measure */
    int j;                      /* index of overall report datum for this individual */
    int n;                      /* which type number is active (during transition calc only) */
    int hNow;                   /* individual's current reported value */
    int Died;                   /* indicator for whether individual has died */
    double CumLivPrb;           /* cumulative survival probability that has not been included in LL */
    double LL;                  /* this individual's log likelihood of observations */
    double hReportPrb;          /* probability of making report from this x */
    double LivPrb;              /* probability of surviving from this x */
    double SumPrb;              /* sum of probabilities, use varies */
    double TempPrb;             /* probability of being in some health state, temporary */
    double TransPrb;            /* transition probability from one x state to next */
    
    /* Loop over individuals in the data until the end is reached */
    int i = Gid + DataStart;
    while (i < DataEnd) {

        /* Get information about this individual and initialize variables*/
        Age = AgeVec[i];
        Sex = SexVec[i];
        Start = StartVec[i];
        Length = LengthVec[i];
        LL = 0.0;
        CumLivPrb = 1.0;
        Died = 0;

        /* Extract the initial distribution of health for this individual */
        OffsetB = Sex*xCount*AgeCountB + Age*xCount;
        for (x=0; x < xCount; x++) {
            HealthDstnNow[OffsetA+x] = HealthInitDstn[OffsetB+x];
        }

        /* Loop through each observed period for this individual */
        j = 0;
        for (t=0; t < Length; t++) {
 
            /* Loop through each measure within this period for this individual */
            for (m=0; m < MeasCount; m++) {
                hNow = ReportVec[Start + j];
                
                if (m == 0) { /* First measure is always SRHS, check survival */
                    if (hNow == 0) { /* individual has just died, put death in LL */
                        LL += log(1.0 - CumLivPrb);
                        Died = 1; /* mark as dead so that health dstn isn't updated */
                    }
                    if (hNow > 0) { /* individual observed alive */
                        LL += log(CumLivPrb);
                        CumLivPrb = 1.0;      /* incorporate survival into LL and reset */
                    }
                }

                if (hNow > 0) { /* If there was an observation for this measure... */
                    /* Get probability of making this report */
                    SumPrb = 0.0;
                    OffsetB = (MeasureStarts[m] + hNow - 1)*xCount;
                    for (x=0; x < xCount; x++) {
                        hReportPrb = HealthDstnNow[OffsetA+x]*ReportPrbArray[OffsetB+x];
                        TempDstnNow[OffsetA+x] = hReportPrb;
                        SumPrb += hReportPrb;
                    }
                    LL += log(SumPrb); /* incorporate observation probability into LL */

                    /* Update the current distribution of health with Bayes' rule */
                    for (x=0; x < xCount; x++) {
                        HealthDstnNow[OffsetA+x] = TempDstnNow[OffsetA+x]/SumPrb;
                    }
                }
                j++;
            }

            if (Died == 0) {
                /* Calculate survival to next period and update health distribution for it */
                SumPrb = 0.0;
                OffsetB = Sex*AgeCountA*xCount + Age*xCount;
                for (x=0; x < xCount; x++) {
                    LivPrb = HealthDstnNow[OffsetA+x]*LivPrbArray[OffsetB+x];
                    TempDstnNow[OffsetA+x] = LivPrb;
                    SumPrb += LivPrb;
                }
                CumLivPrb *= SumPrb;
                for (x=0; x < xCount; x++) {
                    HealthDstnNow[OffsetA+x] = TempDstnNow[OffsetA+x]/SumPrb;
                }

                /* Clear the temporary distribution to hold next period's health distribution */
                for (x=0; x < xCount; x++) {
                    TempDstnNow[OffsetA+x] = 0.0;
                }

                /* Update the health distribution to account for health shocks */
                for (xa=0; xa < xCount; xa++) {
                    OffsetB = Sex*AgeCountA*xCount*xCount + Age*xCount*xCount + xa*xCount;
                    TempPrb = HealthDstnNow[OffsetA+xa];
                    n = xa / xCountCond;
                    xTop = (n+1)*xCountCond;
                    for (x=(n*xCountCond); x < xTop; x++) {
                        TransPrb = TransPrbArray[OffsetB+x];
                        TempDstnNow[OffsetA+x] += TempPrb*TransPrb;
                    }
                }
                for (x=0; x < xCount; x++) { /* copy the distribution */
                    HealthDstnNow[OffsetA+x] = TempDstnNow[OffsetA+x];
                }
            }

            /* Advance the individual in age and move to the next period */
            Age += 1;
        }

        /* Store this individual's log likelihood in the output array */
        LogLikelihood[i] = LL;

        /* Calculate the ex post type probabilities */
       for (n=0; n < TypeCount ; n++) {
           TempPrb = 0.0;
           xTop = (n+1)*xCountCond;
           for (x=(n*xCountCond); x < xTop; x++) {
                TempPrb += HealthDstnNow[OffsetA+x];
           }
           TypeProb[i*TypeCount+n] = TempPrb;
        }

        /* Move to the next individual for this thread */
        i += ThreadCount;
    }
}

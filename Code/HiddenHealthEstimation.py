'''
This module estimates the "hidden health" model using maximum likelihood.
'''

# Import functions from other files
import numpy as np
from scipy.stats import norm
import csv
from copy import copy
from time import time
import matplotlib.pyplot as plt
import opencl4py as cl
from Utilities import getPercentiles, drawDiscrete, minimizeNelderMead, calcHessian
from MakeTables import saveParamsAndStdErrs, parameterTransformation, standardErrorsFromCovarMatrix
from ChangeCoefficients import changeTaylorToPoly, convertOldToNewParams
import EvalCount

# Import parameter information
from CrossDataWomenParams import data_file, sex_list, T_max, age_col, sex_col, weight_col, data_init_col,\
           measure_count, category_counts, measure_names, wave_length, current_param_vec,\
           age_min, age_max, age_incr, x_min, x_max, x_count, which_indices,\
           source_name, figure_label, param_file_name
report_count = np.sum(category_counts)
measure_starts = np.concatenate((np.array([0]),np.cumsum(category_counts)[:-1]))
h_count = category_counts[0] # Number of SRHS categories

# Set OpenCL environment variables
import os
os.environ["PYOPENCL_CTX"] = "0:1,2" # This is where you choose devices
D = 2     # Make sure this has the number of devices selected
d_opt = 1 # This should have the (relative) index of the fastest device
device_loads = [0.3,0.7] # These should sum to 1.0, specify load split across devices
thread_counts = [2**12,2**11] # Number of threads to spawn on each device

# Load in the panel data on health
t0 = time()
infile = open(data_file,'r') 
my_reader = csv.reader(infile,delimiter='\t')
all_data = list(my_reader)
infile.close()
obs = len(all_data)

# Unpack the data into arrays
weight_data = np.zeros(obs) + np.nan
age_data = np.zeros(obs) + np.nan
sex_data = np.zeros(obs,dtype=int)
report_data = -np.ones((obs,T_max,measure_count),dtype=int)
srhs_data = -np.ones((obs,T_max),dtype=int)
for i in range(obs):
    weight_data[i] = float(all_data[i][weight_col])
    age_data[i] = float(all_data[i][age_col])
    sex_data[i] = int(all_data[i][sex_col])
    j = 0
    for t in range(T_max):
        for k in range(measure_count):
            try:
                report_data[i,t,k] = int(all_data[i][data_init_col+j])
                if k == 0:
                    srhs_data[i,t] = report_data[i,t,k]
            except:
                pass
            j += 1
        
# Cut the data for which sexes and ages will be included
age_max_alt = age_max - (T_max-1)*age_incr # Maximum acceptable starting age
women = sex_data == 0
men = sex_data == 1
accept = np.zeros(age_data.size, dtype=bool)
if 0 in sex_list:
    accept = np.logical_or(accept, women)
if 1 in sex_list:
    accept = np.logical_or(accept, men)

# Determine number of periods data needs to be shifted in order to make young respondents qualify, and shift them
T_to_fix = np.minimum((np.ceil(np.maximum(((age_min - age_data)/age_incr),0.)/wave_length)*wave_length).astype(int),T_max)
for i in range(obs):
    T = T_to_fix[i]
    if T > 0:
        is_dead_at_end = (srhs_data[i,-1] == 0)
        report_data[i,:-T,:] = report_data[i,T:,:]
        report_data[i,T:,:] = -1
        srhs_data[i,:-T] = srhs_data[i,T:]
        if is_dead_at_end:
            srhs_data[i,T:] = 0
        else:
            srhs_data[i,T:] = -1
        age_data[i] += age_incr*T
print('Shifted the data for ' + str(np.sum(T_to_fix > 0)) + ' individuals to try to make their starting age at least ' + str(age_min) + '.')

# Remove respondents who are (still) too young, too old, not observed in the first period, or have zero weight
too_young = age_data < age_min
too_old = age_data > age_max_alt
obs_in_t0 = srhs_data[:,0] > 0
positive_weight = weight_data > 0
accept = np.logical_and(accept, np.logical_not(too_young))
accept = np.logical_and(accept, np.logical_not(too_old))
accept = np.logical_and(accept, obs_in_t0)
accept = np.logical_and(accept, positive_weight)
weight_data = weight_data[accept]
age_data = age_data[accept]
sex_data = sex_data[accept]
report_data = report_data[accept,:,:]
srhs_data = srhs_data[accept,:]
obs = np.sum(accept)

# Renormalize weights so that mean observation weight is 1.0
weight_data /= np.sum(weight_data)/obs
        
# Reorder the data by starting age (this makes the code much faster)
order = np.argsort(age_data)
weight_data = weight_data[order]
age_data = age_data[order]
sex_data = sex_data[order]
report_data = report_data[order,:,:]
srhs_data = srhs_data[order,:]
age_data_alt = np.round((age_data-age_min)/age_incr).astype(int)
        
# Find the "length" of observation period for each individual
lengths = np.zeros(obs,dtype=int)
alive = np.ones(obs,dtype=bool)
for t in range(T_max):
    j = t*measure_count
    observed = srhs_data[:,t] > 0
    just_died = np.logical_and(srhs_data[:,t] == 0, alive)
    these = np.logical_or(observed,just_died)
    lengths[these] = t+1
    alive[just_died] = False
    
# Make a "compressed" version of health data
total_length = np.sum(lengths)
report_compressed = -np.ones(total_length*measure_count,dtype=int)
weight_expanded = np.zeros(total_length)
age_expanded = np.zeros(total_length)
sex_expanded = np.zeros(total_length,dtype=int)
starts = np.zeros(obs,dtype=int)
posA = 0
posB = 0
for i in range(obs):
    T = lengths[i]
    L = T*measure_count
    starts[i] = posB
    report_compressed[posB:(posB+L)] = report_data[i,:T,:].flatten()
    weight_expanded[posA:(posA+T)] = weight_data[i]
    age_expanded[posA:(posA+T)] = age_data[i] + age_incr*np.arange(T)
    sex_expanded[posA:(posA+T)] = sex_data[i]
    posA += T
    posB += L

ind_count = starts.size
age_count_A = int((age_max - age_min)/age_incr + 1)
age_count_B = age_count_A - T_max + 1

t1 = time()
print('Loading the data file took ' + str(t1-t0) + ' seconds.')

# Define the cut points for the continuous health variable x, and the midpoints
x_cuts = np.linspace(x_min,x_max,num=x_count+1)
x_grid = (x_cuts[1:] + x_cuts[:-1])/2.
x_step = x_grid[1] - x_grid[0]

# Make an OpenCL context and a queue for each device
f = open('HiddenHealthLL.cl')
program_code = f.read()
f.close()
platforms = cl.Platforms()
ctx = platforms.create_some_context()
queue = []
for d in range(D):
    queue.append(ctx.create_queue(ctx.devices[d]))
program = ctx.create_program(program_code)

# Make kernels for each device
LLkernel = []
TransPrbKernel = []
TransPrbKernel2 = []
for d in range(D):
    LLkernel.append(program.get_kernel('evalHiddenHealthLL'))
    TransPrbKernel.append(program.get_kernel('makeTransPrbArray'))
    TransPrbKernel2.append(program.get_kernel('adjustTransPrbArray'))

# Initialize empty buffer lists
xCuts_buf = []
xGrid_buf = []
HealthDstnNow_buf = []
TempDstnNow_buf = []
LivPrbArray_buf = []
TransPrbArray_buf = []
ReportPrbArray_buf = []
HealthInitDstn_buf = []
AgeVec_buf = []
SexVec_buf = []
ReportVec_buf = []
StartVec_buf = []
LengthVec_buf = []
LogLikelihood_buf = []
IntegerInputs_buf = []
CorrVec_buf = []
ExpHealthBase_buf = []
Parameters_buf = []
MeasureStarts_buf = []

# Make buffers for each device
data_start = 0
for d in range(D):
    # Make the integer inputs vector for this device
    working_array_size = thread_counts[d]*x_count
    integer_inputs_this_device = np.array([measure_count,x_count,age_count_A,age_count_B,thread_counts[d],0,ind_count],dtype=int)
    if d == (D-1):
        data_end = ind_count
    else:
        data_end = data_start + int(device_loads[d]*ind_count)
    integer_inputs_this_device[5] = data_start
    integer_inputs_this_device[6] = data_end
    IntegerInputs_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, integer_inputs_this_device))
    data_start = data_end
    
    xCuts_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, x_cuts))
    xGrid_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, x_grid))
    HealthDstnNow_buf.append(ctx.create_buffer(cl.CL_MEM_READ_WRITE | cl.CL_MEM_COPY_HOST_PTR, np.zeros(working_array_size)))
    TempDstnNow_buf.append(ctx.create_buffer(cl.CL_MEM_READ_WRITE | cl.CL_MEM_COPY_HOST_PTR, np.zeros(working_array_size)))
    LivPrbArray_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(2*age_count_A*x_count)))
    TransPrbArray_buf.append(ctx.create_buffer(cl.CL_MEM_READ_WRITE | cl.CL_MEM_COPY_HOST_PTR, np.zeros(2*age_count_A*x_count*x_count)))
    ReportPrbArray_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(2*age_count_A*x_count*report_count)))
    HealthInitDstn_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(2*age_count_B*x_count)))
    AgeVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, age_data_alt))
    SexVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, sex_data))
    ReportVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, report_compressed))
    StartVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, starts))
    LengthVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, lengths))
    LogLikelihood_buf.append(ctx.create_buffer(cl.CL_MEM_WRITE_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(ind_count)))
    CorrVec_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(age_count_A)))
    ExpHealthBase_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(age_count_A)))
    Parameters_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, np.zeros(4)))
    MeasureStarts_buf.append(ctx.create_buffer(cl.CL_MEM_READ_ONLY | cl.CL_MEM_COPY_HOST_PTR, measure_starts))

# Load the buffers for each device into kernels
for d in range(D):
    TransPrbKernel[d].set_args(
            TransPrbArray_buf[d],
            xGrid_buf[d],
            xCuts_buf[d],
            ExpHealthBase_buf[d],
            CorrVec_buf[d],
            Parameters_buf[d],
            IntegerInputs_buf[d])
    TransPrbKernel2[d].set_args(
            TransPrbArray_buf[d],
            IntegerInputs_buf[d])
    LLkernel[d].set_args(
            LivPrbArray_buf[d],
            TransPrbArray_buf[d],
            ReportPrbArray_buf[d],
            HealthInitDstn_buf[d],
            HealthDstnNow_buf[d],
            TempDstnNow_buf[d],
            LogLikelihood_buf[d],
            AgeVec_buf[d],
            SexVec_buf[d],
            ReportVec_buf[d],
            StartVec_buf[d],
            LengthVec_buf[d],
            IntegerInputs_buf[d],
            MeasureStarts_buf[d])
    
t2 = time()
print('Setting up OpenCL took ' + str(t2-t1) + ' seconds.')


# Define a function that describes the data (after it's been trimmed)
def describeData():
    '''
    Produce a string that lists some basic facts about the dataset being used.
    
    Parameters
    ----------
    None
    
    Returns
    -------
    desc : str
        String with various useful facts about the data.
    '''
    died = np.any(srhs_data == 0, axis=1)
    ob_alive_T = np.sum(srhs_data > 0, axis=1)
    min_ob_T = int(np.min(ob_alive_T))
    max_ob_T = int(np.max(ob_alive_T))
    count_vec = np.zeros(max_ob_T+1, dtype=int)
    for n in range(1,max_ob_T+1):
        count_vec[n] = np.sum(ob_alive_T == n)
    
    desc = '\nThis is a description of the specification called ' + param_file_name +'.\n'
    desc += 'There are ' + str(obs) + ' individuals in the data, of whom ' + str(sum(died)) + ' died.\n'
    desc += 'When first observed, the youngest person was ' + str(np.min(age_data)) + ' and the oldest was ' + str(np.max(age_data)) + '.\n'
    desc += 'There are a total of ' + str(int(np.sum(ob_alive_T))) + ' person-wave observations of SRHS (min ' + str(min_ob_T) + ', max ' + str(max_ob_T) + ' within person).\n'
    cumpct = 0.
    for n in range(min_ob_T,max_ob_T+1):
        pct = float(count_vec[n])/obs
        cumpct += pct
        if count_vec[n] > 0:
            desc += str(count_vec[n]) + ' individuals are observed for ' + str(n) + ' waves (' + "{:.1f}".format(100*pct) + '%, ' + "{:.1f}".format(100*cumpct) + '% cumulative).\n'
    
    return desc    


# Define the function to produce survival probabilities
def makeLivPrbArray(age_min,age_max,age_incr,Mort0,MortSex,MortHealth1,MortHealth2,
                    MortHealth3,MortHealth4,MortAge1,MortAge2,MortAge3,MortAge4,
                    MortHealthAge,MortSexAge):
    '''
    Make a 3D array of survival probabilitities: sex X age X health.  Uses given
    parameters and boundaries for the age range.
    
    Parameters
    ----------
    age_min : float
        Minimum value that age takes on in model.
    age_max : float
        Maximum value that age takes on in model.
    age_incr : float
        Increment for age in the model.
    Mort0 : float
        Constant in mortality probit function.
    MortSex : float
        Shifter for being male in mortality probit function.
    MortHealth1 : float
        Linear coefficient on health in mortality probit function.
    MortHealth2 : float
        Quadratic coefficient on health in mortality probit function.
    MortHealth3 : float
        Cubic coefficient on health in mortality probit function.
    MortHealth4 : float
        Quartic coefficient on health in mortality probit function.
    MortAge1 : float
        Linear coefficient on age in mortality probit function.
    MortAge2 : float
        Quadratic coefficient on age in mortality probit function.
    MortAge3 : float
        Cubic coefficient on age in mortality probit function.
    MortAge4 : float
        Quartic coefficient on age in mortality probit function.
    MortHealthAge : float
        Interaction term between health and age in mortality probit function.
    MortSexAge : float
        Interaction term between health and sex in mortality probit function.
        
    Returns
    -------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    '''
    ThetaFunc = lambda s,j,x : Mort0 + MortSex*s + MortHealth1*x + MortHealth2*x**2 + MortHealth3*x**3 + MortHealth4*x**4 + MortAge1*j + MortAge2*j**2 + MortAge3*j**3 + MortAge4*j**4 + MortHealthAge*j*x + MortSexAge*s*j
    age_count = int(np.round((age_max - age_min)/age_incr)) + 1
    
    AgeVec = np.linspace(age_min,age_max,num=age_count)
    AgeArray = np.tile(np.reshape(AgeVec,(1,age_count,1)),(1,1,x_count))
    xArray = np.tile(np.reshape(x_grid,(1,1,x_count)),(1,age_count,1))
    
    thetaArray = np.zeros((2,age_count,x_count))
    thetaArray[0,:,:] = ThetaFunc(0,AgeArray,xArray)
    thetaArray[1,:,:] = ThetaFunc(1,AgeArray,xArray)

    LivPrbArray = norm.cdf(thetaArray)
    return LivPrbArray


# Define the function that constructs the array of transition probabilities
def makeTransProbArray(age_min,age_max,age_incr,Corr0,CorrAge1,CorrAge2,CorrAge3,
                       CorrAge4,Health0,HealthSex,HealthAge1,HealthAge2,HealthAge3,
                       HealthAge4,HealthAgeSex):
    '''
    Make a 4D array of health transition probabilities: sex X age X x_t X x_t+1.
    
    Parameters
    ----------
    age_min : float
        Minimum value that age takes on in model.
    age_max : float
        Maximum value that age takes on in model.
    age_incr : float
        Increment for age in the model.
    Corr0 : float
        Constant in correlation coefficient function.
    CorrAge1 : float
        Linear coefficient on age in correlation coefficient function.
    CorrAge2 : float
        Quadratic coefficient on age in correlation coefficient function.
    CorrAge3 : float
        Cubic coefficient on age in correlation coefficient function.
    CorrAge4 : float
        Quartic coefficient on age in correlation coefficient function.
    Health0 : float
        Constant in expected next health function.
    HealthSex : float
        Shifter for sex in expected next health function.
    HealthAge1 : float
        Linear coefficient in expected next health function.
    HealthAge2 : float
        Quadratic coefficient in expected next health function.
    HealthAge3 : float
        Cubic coefficient in expected next health function.
    HealthAge4 : float
        Quartic coefficient in expected next health function.
    HealthAgeSex : float
        Interaction between age and sex in expected next health function.
    
    Returns
    -------
    TransPrbArray : np.array
        Array of shape (2,age_count,x_count,x_count) with transition probabilities
        between health states at each sex and age.
    '''
    AgeVec = np.linspace(age_min,age_max,num=age_count_A)
    CorrVecBase = Corr0 + CorrAge1*AgeVec + CorrAge2*AgeVec**2 + CorrAge3*AgeVec**3 + CorrAge4*AgeVec**4
    CorrVec = np.exp(CorrVecBase)/(1. + np.exp(CorrVecBase))
    
    TransPrbArray = np.zeros((2,age_count_A,x_count,x_count))
    
    x_cuts_tiled = np.tile(np.reshape(x_cuts,(1,x_count+1)),(x_count,1))
    for s in range(2):
        for j in range(age_count_A):
            Age = AgeVec[j]
            Corr = CorrVec[j]
            ExpHealthBase = Health0 + HealthAge1*Age + HealthAge2*Age**2 + HealthAge3*Age**3 + HealthAge4*Age**4 + HealthSex*s + HealthAgeSex*s*Age
            ExpHealthNext = Corr*x_grid + (1.-Corr)*ExpHealthBase
            ExpHealthNext_tiled = np.tile(np.reshape(ExpHealthNext,(x_count,1)),(1,x_count+1))
            distance_array = x_cuts_tiled - ExpHealthNext_tiled
            CDF_array = norm.cdf(distance_array)
            SF_array  = norm.sf(distance_array)
            these = distance_array[:,:-1] < 4.0
            prob_array_base = np.zeros((x_count,x_count))
            prob_array_base[these] = CDF_array[:,1:][these] - CDF_array[:,:-1][these]
            these = np.logical_not(these)
            prob_array_base[these] = SF_array[:,:-1][these] - SF_array[:,1:][these]
            sum_array = np.tile(np.reshape(np.sum(prob_array_base,axis=1),(x_count,1)),(1,x_count))
            prob_array = prob_array_base/sum_array
            TransPrbArray[s,j,:,:] = np.reshape(prob_array,(1,1,x_count,x_count))

    return TransPrbArray


def makeTransProbArrayCL(age_min,age_max,age_incr,Corr0,CorrAge1,CorrAge2,CorrAge3,
                       CorrAge4,Health0,HealthSex,HealthAge1,HealthAge2,HealthAge3,
                       HealthAge4,HealthAgeSex):
    '''
    Make a 4D array of health transition probabilities: sex X age X x_t X x_t+1.
    
    Parameters
    ----------
    age_min : float
        Minimum value that age takes on in model.
    age_max : float
        Maximum value that age takes on in model.
    age_incr : float
        Increment for age in the model.
    Corr0 : float
        Constant in correlation coefficient function.
    CorrAge1 : float
        Linear coefficient on age in correlation coefficient function.
    CorrAge2 : float
        Quadratic coefficient on age in correlation coefficient function.
    CorrAge3 : float
        Cubic coefficient on age in correlation coefficient function.
    CorrAge4 : float
        Quartic coefficient on age in correlation coefficient function.
    Health0 : float
        Constant in expected next health function.
    HealthSex : float
        Shifter for sex in expected next health function.
    HealthAge1 : float
        Linear coefficient in expected next health function.
    HealthAge2 : float
        Quadratic coefficient in expected next health function.
    HealthAge3 : float
        Cubic coefficient in expected next health function.
    HealthAge4 : float
        Quartic coefficient in expected next health function.
    HealthAgeSex : float
        Interaction between age and sex in expected next health function.
    
    Returns
    -------
    None
    '''
    age_count = int(np.round((age_max - age_min)/age_incr)) + 1
    AgeVec = np.linspace(age_min,age_max,num=age_count)
    CorrVecBase = Corr0 + CorrAge1*AgeVec + CorrAge2*AgeVec**2 + CorrAge3*AgeVec**3 + CorrAge4*AgeVec**4
    CorrVec = np.exp(CorrVecBase)/(1. + np.exp(CorrVecBase))
    
    ExpHealthBase = Health0 + HealthAge1*AgeVec + HealthAge2*AgeVec**2 + HealthAge3*AgeVec**3 + HealthAge4*AgeVec**4
    parameters_temp = np.array([HealthSex,HealthAgeSex,age_incr,0.0])
    prob_size = 2*age_count_A*x_count*x_count
    prob_size_alt = 2*age_count_A*x_count
    temp_out = np.zeros(prob_size)
    
    d = d_opt
    queue[d].write_buffer(CorrVec_buf[d],CorrVec)
    queue[d].write_buffer(ExpHealthBase_buf[d],ExpHealthBase)
    queue[d].write_buffer(Parameters_buf[d],parameters_temp)
    queue[d].execute_kernel(TransPrbKernel[d], [(prob_size/32 + 1)*32], [32])
    queue[d].execute_kernel(TransPrbKernel2[d], [(prob_size_alt/32 + 1)*32], [32])
    queue[d].read_buffer(TransPrbArray_buf[d],temp_out)
    
    return np.reshape(temp_out,(2,age_count_A,x_count,x_count))


# Define the function that constructs categorical health observation probabilities
def makeReportPrbArray(Constants,Coeffs,CutLists):
    '''
    Make an array with the probability of reporting each categorical response
    from each value on the x_grid, for each measure.
    
    Parameters
    ----------
    Constants : np.array
        Level shifter for each measure in mapping from x to report probit.
    Coeffs : np.array
        Linear coefficient for each measure in mapping from x to report probit.
    CutLists : [np.array]
        List of arrays of size (category_count[j]-2) cutoff points in the space
        of x.  The lowest cut point for each measure is assumed to be zero.
        
    Returns
    -------
    ReportPrbArray : np.array
        Array of shape (report_count,x_count) with the probability of reporting
        each categorical answer for each measure when the individual's true health is x.
    '''
    ReportPrbArray = np.zeros((report_count,x_count)) + np.nan
    
    pos = 0
    for j in range(measure_count):
        Const = Constants[j]
        Coeff = Coeffs[j]
        CutList = np.cumsum(CutLists[j])
        c_count = category_counts[j]
    
        Cuts_plus = np.concatenate(([-np.inf,0.0],CutList,[np.inf]))
        Cuts_tiled = np.tile(np.reshape(Cuts_plus,(1,c_count+1)),(x_count,1))
        y_grid = Const + Coeff*x_grid
        y_grid_tiled = np.tile(np.reshape(y_grid,(x_count,1)),(1,c_count+1))
        distance_array = (Cuts_tiled - y_grid_tiled)
        CDF_array = norm.cdf(distance_array)
        ReportPrbArray[pos:(pos+c_count),:] = np.transpose(CDF_array[:,1:] - CDF_array[:,:-1])
        
        pos += c_count
        
    
    return ReportPrbArray


# Define the function that constructs the distribution of health for individuals
# when they are first observed in the data
def makeInitialHealthDstn(LivPrbArray,TransPrbArray,xInitMean,xInitStd):
    '''
    Make an array with the unconditional distribution of the continuous health
    state x for someone who has been observed for the first time.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Survival probabilities at each sex, age, and health state.
    TransPrbArray : np.array
        Transitions probabilities at each sex, age, and health state combination.
    xInitMean : float
        Mean of health at the earliest age in the model.
    xInitStd : float
        Standard devation of health at the earliest age in the model.
        
    Returns
    -------
    InitialHealthDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    '''
    T = LivPrbArray.shape[1]-T_max+1
    InitialHealthDstn = np.zeros((2,T,x_count))
    
    # Approximate the distribution of health at the earliest age in the model
    distances = (x_cuts - xInitMean)/xInitStd
    distances[0] = -20.
    distances[-1] = 20.
    CDFs = norm.cdf(distances)
    prob_base = CDFs[1:] - CDFs[:-1]
    HealthDstn0 = prob_base/np.sum(prob_base)
    
    # Loop over the two sexes
    for s in range(2):
        HealthDstnNow = copy(HealthDstn0)
        for j in range(T):
            InitialHealthDstn[s,j,:] = HealthDstnNow
            LivPrbs = LivPrbArray[s,j,:]
            TempDstn = HealthDstnNow*LivPrbs
            HealthDstnNow = TempDstn/np.sum(TempDstn)
            TransPrbs = TransPrbArray[s,j,:,:]
            HealthDstnNow = np.dot(np.transpose(TransPrbs),HealthDstnNow)
            
    return InitialHealthDstn
    

# Define the function that constructs arrays for the LL evaluation
def makeProbArrays(age_min,age_max,age_incr,Mort0,MortSex,MortHealth1,MortHealth2,
                   MortHealth3,MortHealth4,MortAge1,MortAge2,MortAge3,MortAge4,
                   MortHealthAge,MortSexAge,Corr0,CorrAge1,CorrAge2,CorrAge3,
                   CorrAge4,Health0,HealthSex,HealthAge1,HealthAge2,HealthAge3,
                   HealthAge4,HealthAgeSex,ReportConstants,ReportCoeffs,ReportCuts,
                   xInitMean,xInitStd):
    '''
    Construct LivPrbArray, TransPrbArray, ReportPrbArray, and HealthInitDstn
    from model paramaters.
    
    Parameters
    ----------
    age_min : float
        Minimum value that age takes on in model.
    age_max : float
        Maximum value that age takes on in model.
    age_incr : float
        Increment for age in the model.
    Mort0 : float
        Constant in mortality probit function.
    MortSex : float
        Shifter for being male in mortality probit function.
    MortHealth1 : float
        Linear coefficient on health in mortality probit function.
    MortHealth2 : float
        Quadratic coefficient on health in mortality probit function.
    MortHealth3 : float
        Cubic coefficient on health in mortality probit function.
    MortHealth4 : float
        Quartic coefficient on health in mortality probit function.
    MortAge1 : float
        Linear coefficient on age in mortality probit function.
    MortAge2 : float
        Quadratic coefficient on age in mortality probit function.
    MortAge3 : float
        Cubic coefficient on age in mortality probit function.
    MortAge4 : float
        Quartic coefficient on age in mortality probit function.
    MortHealthAge : float
        Interaction term between health and age in mortality probit function.
    MortSexAge : float
        Interaction term between health and sex in mortality probit function.
    Corr0 : float
        Constant in correlation coefficient function.
    CorrAge1 : float
        Linear coefficient on age in correlation coefficient function.
    CorrAge2 : float
        Quadratic coefficient on age in correlation coefficient function.
    CorrAge3 : float
        Cubic coefficient on age in correlation coefficient function.
    CorrAge4 : float
        Quartic coefficient on age in correlation coefficient function.
    Health0 : float
        Constant in expected next health function.
    HealthSex : float
        Shifter for sex in expected next health function.
    HealthAge1 : float
        Linear coefficient in expected next health function.
    HealthAge2 : float
        Quadratic coefficient in expected next health function.
    HealthAge3 : float
        Cubic coefficient in expected next health function.
    HealthAge4 : float
        Quartic coefficient in expected next health function.
    HealthAgeSex : float
        Interaction between age and sex in expected next health function.
    ReportConstants : [float]
         List of measure_count - 1 constant terms in report probit equations.
    ReportCoeffs : [float]
         List of measure_count linear coefficients on x in report probit equations.
    ReportCuts : [float]
        List of report_count-2*measure_count cutoff points in the space of x.
        The lowest cut point for each measure is assumed to be zero.
    xInitMean : float
        Mean of health at the earliest age in the model.
    xInitStd : float
        Standard devation of health at the earliest age in the model.
        
    Returns
    -------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    TransPrbArray : np.array
        Array of shape (2,age_count,x_count,x_count) with transition probabilities
        between health states at each sex and age.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    InitialHealthDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    '''
    LivPrbArray = makeLivPrbArray(
                    age_min,age_max,age_incr,Mort0,MortSex,MortHealth1,MortHealth2,
                    MortHealth3,MortHealth4,MortAge1,MortAge2,MortAge3,MortAge4,
                    MortHealthAge,MortSexAge)
    
    TransPrbArray = makeTransProbArrayCL(
                       age_min,age_max,age_incr,Corr0,CorrAge1,CorrAge2,CorrAge3,
                       CorrAge4,Health0,HealthSex,HealthAge1,HealthAge2,HealthAge3,
                       HealthAge4,HealthAgeSex)
    
    ReportCutLists = []
    pos = 0
    for j in range(measure_count):
        c_count = category_counts[j] - 2
        ReportCutLists.append(ReportCuts[pos:(pos+c_count)])
        pos += c_count
    ReportPrbArray = makeReportPrbArray(ReportConstants,ReportCoeffs,ReportCutLists)
    
    HealthInitDstn = makeInitialHealthDstn(LivPrbArray,TransPrbArray,xInitMean,xInitStd)
    
    return LivPrbArray, TransPrbArray, ReportPrbArray, HealthInitDstn


# Define a function that translates a vector of parameters into a dictionary
def makeParameterDict(param_vec):
    '''
    Transforms a vector of size 27 + h_count - 2 into a dictionary.
    
    Parameters
    ----------
    param_vec : np.array
        Array of model parameters; order is shown in code.
        
    Returns
    -------
    param_dict : dictionary
        Dictionary that can be used in makeProbArrays.
    '''
    a = 26
    constants = measure_count - 1
    coefficients = measure_count
    b = a + constants
    c = b + coefficients
    
    MortHealthTaylor = np.array([0., param_vec[2]*1e-1, param_vec[3]*1e-2, param_vec[4]*1e-3, param_vec[5]*1e-4])
    MortHealthCoeffs = changeTaylorToPoly(MortHealthTaylor, 0.)
    MortAgeTaylor = np.array([param_vec[0], param_vec[6]*1e-2, param_vec[7]*1e-4, param_vec[8]*1e-6, param_vec[9]*1e-8])
    MortAgeCoeffs = changeTaylorToPoly(MortAgeTaylor, age_min)
    CorrTaylor = np.array([param_vec[12], param_vec[13]*1e-2, param_vec[14]*1e-4, param_vec[15]*1e-6, param_vec[16]*1e-8])
    CorrCoeffs = changeTaylorToPoly(CorrTaylor, age_min)
    HealthAgeTaylor = np.array([param_vec[17], param_vec[19]*1e-1, param_vec[20]*1e-2, param_vec[21]*1e-3, param_vec[22]*1e-4])
    HealthAgeCoeffs = changeTaylorToPoly(HealthAgeTaylor, age_min)
    
    param_dict = {
            'age_min' : age_min,
            'age_max' : age_max,
            'age_incr' : age_incr,
            'Mort0' :         MortAgeCoeffs[0],
            'MortSex' :       param_vec[1],
            'MortHealth1' :   MortHealthCoeffs[1],
            'MortHealth2' :   MortHealthCoeffs[2],
            'MortHealth3' :   MortHealthCoeffs[3],
            'MortHealth4' :   MortHealthCoeffs[4],
            'MortAge1' :      MortAgeCoeffs[1],
            'MortAge2' :      MortAgeCoeffs[2],
            'MortAge3' :      MortAgeCoeffs[3],
            'MortAge4' :      MortAgeCoeffs[4],
            'MortHealthAge' : param_vec[10]*1e-4,
            'MortSexAge' :    param_vec[11]*1e-3,
            'Corr0' :         CorrCoeffs[0],
            'CorrAge1' :      CorrCoeffs[1],
            'CorrAge2' :      CorrCoeffs[2],
            'CorrAge3' :      CorrCoeffs[3],
            'CorrAge4' :      CorrCoeffs[4],
            'Health0' :       HealthAgeCoeffs[0],
            'HealthSex' :     param_vec[18],
            'HealthAge1' :    HealthAgeCoeffs[1],
            'HealthAge2' :    HealthAgeCoeffs[2], 
            'HealthAge3' :    HealthAgeCoeffs[3],
            'HealthAge4' :    HealthAgeCoeffs[4],
            'HealthAgeSex' :  param_vec[23]*1e-3,
            'xInitMean' :     param_vec[24],
            'xInitStd' :      param_vec[25],
            'ReportConstants' : np.concatenate(([0],param_vec[a:b])),
            'ReportCoeffs' :  param_vec[b:c],
            'ReportCuts' :    param_vec[c:],
            }
    return param_dict


# Define the log likelihood function
def LLfunction(param_vec):
    '''
    Calculates the log likelihood of the data at a given parameter vector.
    
    Parameters
    ----------
    param_vec : np.array
        Array of model parameters; order is shown in code.
        
    Returns
    -------
    LL : float
        Log likelihood of data at input parameter vector.
    '''
    # Calculate transition and initial probabilities
    my_dict = makeParameterDict(param_vec)
    LivPrbArray, TransPrbArray, ReportPrbArray, HealthInitDstn = makeProbArrays(**my_dict)
    
    # Write probability buffers and initialize log likelihood for each device
    for d in range(D):
        queue[d].write_buffer(LivPrbArray_buf[d],LivPrbArray.flatten())
        queue[d].write_buffer(TransPrbArray_buf[d],TransPrbArray.flatten())
        queue[d].write_buffer(ReportPrbArray_buf[d],ReportPrbArray.flatten())
        queue[d].write_buffer(HealthInitDstn_buf[d],HealthInitDstn.flatten())
        queue[d].write_buffer(LogLikelihood_buf[d],np.zeros(ind_count))
    
    # Run the log likelihood kernel on each device
    for d in range(D):
        queue[d].execute_kernel(LLkernel[d], [thread_counts[d]], [32])
    
    # Read the log likelihood of each observation from each device
    LLvec_out = np.zeros(ind_count)
    temp_out = np.zeros(ind_count)
    for d in range(D):
        queue[d].read_buffer(LogLikelihood_buf[d],temp_out)
        LLvec_out += temp_out
    
    # Sum across all individuals (and print result to screen)
    negLL = -np.dot(LLvec_out, weight_data)
    print(negLL)
    
    EvalCount.eval_count += 1
    if np.mod(EvalCount.eval_count,20) == 0:
        writeParamsToFile(param_vec,'EstimationProgress.txt')
    
    return negLL


def makeFigures(param_vec, save_bool):
    '''
    Make various figures fromthe model and data.
    '''
    my_dict = makeParameterDict(param_vec)
    LivPrbArray, TransPrbArray, ReportPrbArray, HealthInitDstn = makeProbArrays(**my_dict)
    
#    # Overall data vs model vs SSA mortality plots
#    makeMortFigure(LivPrbArray,HealthInitDstn,False,save_bool)
#    
#    # Mortality by health and age plots
#    makeMortByHealthFigure(LivPrbArray,ReportPrbArray,HealthInitDstn,save_bool)
#    
#    # Health distribution by age plots
#    makeReportFigure(ReportPrbArray,HealthInitDstn,True,False,save_bool)
#    
#    # T-ahead health transition plots
#    for h in range(1,h_count+1):
#        makeTransFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,h,12,'model',False,save_bool)
#    for t in range(1,2):
#        makeTransFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,3,t,'model',False,save_bool)
#    
#    # Probability of changing answer plot
#    makeChangeAnswerFigure(LivPrbArray,ReportPrbArray,HealthInitDstn,save_bool)
#    
#    # Duration dependence figures
#    makeDurationDependenceFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,4,save_bool)
#    
    # Make frequency of future unhealthy periods figures
    age_lo = [25,35,45,55,65,75]
    age_hi = [34,44,54,64,74,84]
    for i in range(len(age_lo)):
        makeStateCountFigure(param_vec, age_lo[i], age_hi[i], 6, save_bool)
#    
#    # Make health distribution by age figures
#    makeHealthDstnByAgeFigure(HealthInitDstn,save_bool)
#    
#    # Make health correlation by age figure
#    makeCorrFigure(my_dict['Corr0'],my_dict['CorrAge1'],my_dict['CorrAge2'],my_dict['CorrAge3'],my_dict['CorrAge4'], True, save_bool)
#    
#    # Make same SRHS in every wave figure
#    makeConstantSRHSfigure(param_vec, save_bool)
#    
#    # Make animation for health transition
#    already_done = []
#    s = sex_list[0]
#    j = 30
#    h = 2
#    xVec_temp = np.copy(HealthInitDstn[s,j,:])
#    if h > 0:
#        xVec_temp *= ReportPrbArray[h-1,:]
#        xVec_temp /= np.sum(xVec_temp)
#    Order = np.flip(np.argsort(xVec_temp),axis=0)
#    makeTransitionDemoFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,s,j,h,0,already_done,0,0, pdf_bool=True)
#    for i in range(25):
#        k = Order[i]
#        for f in range(4):
#            makeTransitionDemoFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,s,j,h,k,already_done,f,i*4)
#        already_done.append(k)
#    makeTransitionDemoFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,s,j,h,k,already_done,0,x_count*4)
#    makeTransitionDemoFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,s,j,h,0,already_done,0,x_count*4+1, use_orig=True, pdf_bool=True)
    
#    # Make demonstration of mortality
#    for f in range(4):
#        makeMortalityDemoFigure(LivPrbArray,HealthInitDstn,0,72,f)
#    
#    # Make demonstration of observing SRHS
#    for f in range(4):
#        makeReportDemoFigure(ReportPrbArray,HealthInitDstn,0,30,2,f)
    

def makeMortFigure(LivPrbArray, HealthInitDstn, show_legend, save_fig):
    '''
    Make a figure plotting simulated and actual mortality.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    InitialHealthDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    show_legend : bool
        Indicator for whether the legend should be plotted.
    save_fig : bool
        Indicator for whether the figure should be saved to /Figures. Filename
        will be constructed automatically.
        
    Returns
    -------
    None
    '''
    LivPrb_model = np.zeros((2,age_count_B))
    for s in sex_list:
        for j in range(age_count_B):
            LivPrb_model[s,j] = np.dot(HealthInitDstn[s,j,:],LivPrbArray[s,j,:])
    LogDiePrb_model = np.log(1.0-LivPrb_model)
    age_vec = age_min + age_incr*np.arange(age_count_B)
    
    # Calculate death probabilities from dataset
    temp = np.tile(np.reshape(np.arange(T_max-wave_length)*age_incr,(1,T_max-wave_length)),(obs,1))
    age_tiled = np.tile(np.reshape(age_data,(obs,1)),(1,T_max-wave_length)) + temp
    sex_tiled = np.tile(np.reshape(sex_data,(obs,1)),(1,T_max-wave_length))
    weight_tiled = np.tile(np.reshape(weight_data,(obs,1)),(1,T_max-wave_length))
    these = srhs_data[:,:-wave_length] > 0
    age_long = age_tiled[these]
    sex_long = sex_tiled[these]
    weight_long = weight_tiled[these]
    health_next_long = srhs_data[:,wave_length:][these]
    survivors = health_next_long > 0
    deceased = health_next_long == 0
    DiePrb_data = np.zeros((2,age_count_B))
    age_tol = 2
    for s in sex_list:
        right_sex = sex_long == s
        for j in range(age_count_B):
            age = age_min + age_incr*j
            right_age = np.logical_and(age_long >= age-age_tol, age_long <= age+age_tol)
            right_sex_age = np.logical_and(right_sex,right_age)
            S = float(np.dot(survivors[right_sex_age],weight_long[right_sex_age]))
            D = float(np.dot(deceased[right_sex_age],weight_long[right_sex_age]))
            try:
                DiePrb_data[s,j] = D/(S+D)
            except:
                DiePrb_data[s,j] = np.nan
                
    # Adjust for the look ahead length
    DiePrb_data = 1. - (1. - DiePrb_data)**(1./float(wave_length))
    
    # Import actual probabilities from SSA data, from age 0 to age 119
    f = open('../Data/USactuarial.txt','r')
    actuarial_reader = csv.reader(f,delimiter='\t')
    raw_actuarial = list(actuarial_reader)
    DiePrb_SSA_m = np.zeros(120)
    DiePrb_SSA_f = np.zeros(120)
    for j in range(len(raw_actuarial)):
        DiePrb_SSA_m[j] = float(raw_actuarial[j][1]) # male death probabilities
        DiePrb_SSA_f[j] = float(raw_actuarial[j][4]) # male death probabilities
    f.close
    DiePrb_SSA_m = 1.-(1.-DiePrb_SSA_m[:120])**age_incr
    DiePrb_SSA_f = 1.-(1.-DiePrb_SSA_f[:120])**age_incr
    AgeVec_SSA = np.arange(120)
    
    if 0 in sex_list:
        plt.plot(age_vec, LogDiePrb_model[0,:],'--r')
        plt.plot(AgeVec_SSA, np.log(DiePrb_SSA_f),'-r')
        plt.plot(age_vec, np.log(DiePrb_data[0,:]),'-.r')
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.ylim(-10,-2)
        plt.xlabel('Age')
        plt.ylabel('Log death probability')
        plt.title('Death probability, women in ' + source_name)
        if show_legend:
            plt.legend(['Model', 'SSA table', source_name + ' data'])
        if save_fig:
            filename = '../Figures/' + figure_label + 'WomenMortByAge.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    if 1 in sex_list:
        plt.plot(age_vec, LogDiePrb_model[1,:],'--b')
        plt.plot(AgeVec_SSA, np.log(DiePrb_SSA_m),'-b')
        plt.plot(age_vec, np.log(DiePrb_data[1,:]),'-.b')
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.ylim(-10,-2)
        plt.xlabel('Age')
        plt.ylabel('Log death probability')
        plt.title('Death probability, men in ' + source_name)
        if show_legend:
            plt.legend(['Model','SSA table', source_name + ' data'])
        if save_fig:
            filename = '../Figures/' + figure_label + 'MenMortByAge.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    
def makeReportFigure(ReportPrbArray, HealthInitDstn, add_labels, save_data, save_fig):
    '''
    Make a figure plotting simulated and actual reported health status.
    
    Parameters
    ----------
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    InitialHealthDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    add_labels : bool
        Indicator for whether to add text labels for SRHS areas.
    save_data : bool
        Indicator for whether the calculated data series should be saved to a
        tab-delimited text file.
    save_fig: bool
        Indicator for whether the figures should be saved to /Figures.
        Filename will be constructed automatically.
        
    Returns
    -------
    None
    '''
    HealthStatus_model = np.zeros((2,age_count_B,h_count))
    for s in sex_list:
        for j in range(age_count_B):
            for h in range(h_count):
                HealthStatus_model[s,j,h] = np.dot(HealthInitDstn[s,j,:],ReportPrbArray[h,:])
    age_vec = age_min + age_incr*np.arange(age_count_B)
    
    # Create a compressed version of SRHS data
    srhs_compressed = np.reshape(report_compressed,(total_length,measure_count))[:,0]
    
    # Calculate health status shares for each age
    HealthStatus_data = np.zeros((2,age_count_B,h_count))
    for s in sex_list:
        right_sex = sex_expanded == s
        for j in range(age_count_B):
            age = age_min + j*age_incr
            right_sex_age = np.logical_and(np.logical_and(right_sex, age_expanded >= age-1),age_expanded <= age+1)
            temp_h = srhs_compressed[right_sex_age]
            temp_w = weight_expanded[right_sex_age]
            for h in range(h_count):
                HealthStatus_data[s,j,h] = np.dot(temp_h == h+1, temp_w)
            temp_sum = np.sum(HealthStatus_data[s,j,:])
            HealthStatus_data[s,j,:] *= 1./temp_sum
    
    HealthStatus_data = np.cumsum(HealthStatus_data,axis=2)
    HealthStatus_model = np.cumsum(HealthStatus_model,axis=2)
    HealthStatus_data_plus = np.concatenate((np.zeros((2,age_count_B,1)),HealthStatus_data),axis=2)
            
    colors = ['b','r','g','m','c'] # Need to make this longer if h_count > 5
    
    if 0 in sex_list:
        for h in range(h_count):
            plt.plot(age_vec,HealthStatus_data[0,:,h],'-'+colors[h])
            plt.plot(age_vec,HealthStatus_model[0,:,h],'--'+colors[h])
        plt.ylim([-0.001,1.001])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, women in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'WomenSRHSbyAge.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    if 1 in sex_list:
        for h in range(h_count):
            plt.plot(age_vec,HealthStatus_data[1,:,h],'-'+colors[h])
            plt.plot(age_vec,HealthStatus_model[1,:,h],'--'+colors[h])
        plt.ylim([-0.01,1.01])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, men in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'MenSRHSbyAge.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
    if 0 in sex_list:
        for h in range(h_count):
            plt.plot(age_vec,HealthStatus_data[0,:,h],'-'+colors[h])
        if add_labels:
            plt.text(0.9*np.max(age_vec)+0.1*np.min(age_vec), 0.03, 'Poor', ha='center', va='center', fontsize=14)
            plt.text(0.7*np.max(age_vec)+0.3*np.min(age_vec), 0.12, 'Fair', ha='center', va='center', fontsize=14)
            plt.text(0.55*np.max(age_vec)+0.45*np.min(age_vec), 0.3, 'Good', ha='center', va='center', fontsize=14)
            plt.text(0.35*np.max(age_vec)+0.65*np.min(age_vec), 0.55, 'Very good', ha='center', va='center', fontsize=14)
            plt.text(0.2*np.max(age_vec)+0.8*np.min(age_vec), 0.85, 'Excellent', ha='center', va='center', fontsize=14)
        plt.ylim([-0.001,1.001])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, women in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'WomenSRHSbyAgeDataOnly.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    if 1 in sex_list:
        for h in range(h_count):
            plt.plot(age_vec,HealthStatus_data[1,:,h],'-'+colors[h])
        if add_labels:
            plt.text(0.9*np.max(age_vec)+0.1*np.min(age_vec), 0.03, 'Poor', ha='center', va='center', fontsize=14)
            plt.text(0.7*np.max(age_vec)+0.3*np.min(age_vec), 0.12, 'Fair', ha='center', va='center', fontsize=14)
            plt.text(0.55*np.max(age_vec)+0.45*np.min(age_vec), 0.3, 'Good', ha='center', va='center', fontsize=14)
            plt.text(0.35*np.max(age_vec)+0.65*np.min(age_vec), 0.55, 'Very good', ha='center', va='center', fontsize=14)
            plt.text(0.2*np.max(age_vec)+0.8*np.min(age_vec), 0.85, 'Excellent', ha='center', va='center', fontsize=14)
        plt.ylim([-0.001,1.001])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, men in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'MenSRHSbyAgeDataOnly.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    if 0 in sex_list:
        for h in range(h_count):
            plt.fill_between(age_vec,HealthStatus_data_plus[0,:,h+1],y2=HealthStatus_data_plus[0,:,h],color=colors[h])
        if add_labels:
            plt.text(0.9*np.max(age_vec)+0.1*np.min(age_vec), 0.03, 'Poor', ha='center', va='center', fontsize=14, color='w')
            plt.text(0.7*np.max(age_vec)+0.3*np.min(age_vec), 0.12, 'Fair', ha='center', va='center', fontsize=14, color='w')
            plt.text(0.55*np.max(age_vec)+0.45*np.min(age_vec), 0.3, 'Good', ha='center', va='center', fontsize=14, color='w')
            plt.text(0.35*np.max(age_vec)+0.65*np.min(age_vec), 0.55, 'Very good', ha='center', va='center', fontsize=14, color='w')
            plt.text(0.2*np.max(age_vec)+0.8*np.min(age_vec), 0.85, 'Excellent', ha='center', va='center', fontsize=14, color='w')
        plt.ylim([-0.001,1.001])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, women in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'WomenSRHSbyAgeFill.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
    
    if 1 in sex_list:
        for h in range(h_count):
            plt.fill_between(age_vec,HealthStatus_data_plus[1,:,h+1],y2=HealthStatus_data_plus[1,:,h],color=colors[h])
        plt.ylim([-0.001,1.001])
        plt.xlim(np.min(age_vec),np.max(age_vec))
        plt.title('Self reported health status by age, men in ' + source_name)
        plt.xlabel('Age')
        plt.ylabel('Cumulative SRHS share')
        if save_fig:
            filename = '../Figures/' + figure_label + 'MenSRHSbyAgeFill.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
    if save_data:
        if 0 in sex_list:
            filename = '../Data/Figures/' + figure_label + 'womenSRHS.txt'
            outfile = open(filename,'w') 
            my_writer = csv.writer(outfile,delimiter='\t',lineterminator='\n')
            for j in range(age_count_B):
                my_writer.writerow(np.concatenate([[age_vec[j]],HealthStatus_data[0,j,:]]))
            outfile.close()
            print('Wrote data to ' + filename)
        if 1 in sex_list:
            filename = '../Data/Figures/' + figure_label + 'menSRHS.txt'
            outfile = open(filename,'w') 
            my_writer = csv.writer(outfile,delimiter='\t',lineterminator='\n')
            for j in range(age_count_B):
                my_writer.writerow(np.concatenate([[age_vec[j]],HealthStatus_data[1,j,:]]))
            outfile.close()
            print('Wrote data to ' + filename)
    
    
def makeTransFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,
                    hNow, T_ahead, which, show_legend, save_fig):
    '''
    Make a figure that plots the distribution of categorical health states T
    periods in the future, conditional on being in health state h at age j.
    Shows model vs data or naive vs data.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    TransPrbArray : np.array
        Array of shape (2,age_count,x_count,x_count) with transition probabilities
        between health states at each sex and age.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    hNow : int
        Categorical health state from which transitions happen.
    T_ahead : int
        Number of periods ahead to look for future health distribution.
    which : str
        Indicator for whether to show model or naive probabilities vs data. Can
        be 'model', 'naive', or 'both'.
    save_fig : bool
        Indicator for whether the figure should be saved to /Figures.
        Filename will be constructed automatically.
    
    Returns
    -------
    None
    '''
    show_naive = (which is 'naive') or (which is 'both')
    show_model = (which is 'model') or (which is 'both')
    
    # Get cumulative survival probabilities for men and women up to age j
    LivPrb_model = np.zeros((2,age_count_B))
    for s in sex_list:
        for j in range(age_count_B):
            LivPrb_model[s,j] = np.dot(HealthInitDstn[s,j,:],LivPrbArray[s,j,:])
    CumLivPrb_model = np.cumprod(np.concatenate((np.array([[1.],[1.]]),LivPrb_model),axis=1),axis=1)[:,:-1]
    
    # Initialize arrays to hold computed T-ahead probabilities
    age_vec = age_min + age_incr*np.arange(age_count_B)
    FutureHealthDstn_model = np.zeros((age_count_B,h_count))
    FutureHealthDstn_naive = np.zeros((age_count_B,h_count))
    FutureHealthDstn_data = np.zeros((age_count_B,h_count))
    
    if show_naive: # Use naive probabilities straight from the data
        LivPrbNaiveArray, TransPrbNaiveArray, HealthInitDstnNaive = calcNaiveTransProbs()
        
        for j in range(age_count_B):
            HealthDstnNow = np.zeros((2,h_count))
            for s in sex_list:
                HealthDstnNow[s,hNow-1] = 1.0 # HealthInitDstnNaive[:,j,hNow-1]
            for t in range(T_ahead):
                for s in sex_list:
                    HealthDstnNow[s,:] *= LivPrbNaiveArray[s,j+t,:]
                    HealthDstnNow[s,:] = np.dot(TransPrbNaiveArray[s,j+t,:,:].transpose(),HealthDstnNow[s,:])
            FutureHealthDstn_naive[j,:] = np.sum(HealthDstnNow,axis=0)/np.sum(HealthDstnNow)
        CumHealthDstn_naive = np.cumsum(FutureHealthDstn_naive,axis=1)
    
    if show_model: # Use hidden health model probabilities
        # For each initial age j, get the current distribution of male and female
        # continuous health, adjust it for the categorical health report at this age,
        # then "simulate" the distribution of health for T_ahead periods.  Then
        # calculate the report probabilities at age j + T_ahead.
        for j in range(age_count_B):
            # Get initial distribution of health for women and men
            HealthDstnNow = copy(HealthInitDstn[:,j,:])
            
            # Adjust for health report and cumulative survival to this age
            for s in sex_list:
                HealthDstnNow[s,:] *= ReportPrbArray[hNow-1,:]
                HealthDstnNow[s,:] /= np.sum(HealthDstnNow[s,:])
                HealthDstnNow[s,:] *= CumLivPrb_model[s,j]
            
            # Simulate T_ahead periods in the model
            for t in range(T_ahead):
                HealthDstnNow *= LivPrbArray[:,j+t,:]
                for s in sex_list:
                    TransPrbs = TransPrbArray[s,j+t,:,:]
                    HealthDstnNow[s,:] = np.dot(np.transpose(TransPrbs),HealthDstnNow[s,:])
                    
            # Calculate the probability of reporting each categorical health state
            # conditional on surviving to age j+T_ahead
            TempPrbs = np.zeros(h_count)
            for s in sex_list:
                TempPrbs += np.sum(np.tile(np.reshape(HealthDstnNow[s,:],(1,x_count)),(h_count,1))*ReportPrbArray[:h_count,:],axis=1)
            FutureHealthDstn_model[j,:] = TempPrbs/np.sum(TempPrbs)
        CumHealthDstn_model = np.cumsum(FutureHealthDstn_model,axis=1)
        
    # Loop through ages in the data, generating empirical "T periods ahead" health distribution
    age_tol = 2.
    for t in range(T_max-T_ahead):
        right_health = srhs_data[:,t] == hNow
        for j in range(age_count_B):
            age = age_min + age_incr*j
            age_data_temp = age_data + t*age_incr
            right_age = np.logical_and(age_data_temp >= (age - age_tol), age_data_temp <= (age + age_tol))
            these = np.logical_and(right_health, right_age)
            hFuture = srhs_data[these,t+T_ahead]
            weight_temp = weight_data[these]
            for h in range(h_count):
                FutureHealthDstn_data[j,h] += np.dot(hFuture==(h+1), weight_temp)
    SumArray = np.tile(np.sum(FutureHealthDstn_data,axis=1,keepdims=True),(1,h_count))
    FutureHealthDstn_data /= SumArray
    CumHealthDstn_data = np.cumsum(FutureHealthDstn_data,axis=1)
    
    colors = ['b','r','g','m','c'] # Need to make this longer if h_count > 5
    health_words = ['poor','fair','good','very good','excellent']
    h_word = health_words[hNow-1]
    t_future = age_incr*T_ahead
    if int(t_future) == t_future:
        t_future = int(t_future)
    future_text = ' ' + str(t_future) + ' year'
    if t_future != 1:
        future_text += 's'
    
    if 0 in sex_list:
        who_text = 'women in '
        sex_word = 'Women'
        if 1 in sex_list:
            who_text = 'people in '
            sex_word = 'All'
    elif 1 in sex_list:
        who_text = 'men in '
        sex_word = 'Men'
    who_text += source_name    
    
    label_list = []
    for h in range(h_count):
        plt.plot(age_vec,CumHealthDstn_data[:,h],'-'+colors[h])
        if h == 0:
            label_list.append(source_name + ' data')
        if show_model:
            plt.plot(age_vec,CumHealthDstn_model[:,h],'--'+colors[h])
            if h == 0:
                label_list.append('Latent health model')
        if show_naive:
            plt.plot(age_vec,CumHealthDstn_naive[:,h],'-.'+colors[h])
            if h == 0:
                label_list.append('Naive model')
    plt.ylim([-0.001,1.001])
    plt.xlim(np.min(age_vec),np.max(age_vec))
    plt.xlabel('Age in "before" period')
    plt.ylabel('Cumulative SRHS share in "after" period')
    plt.title('SRHS' + future_text + ' after saying "' + h_word + '", ' + who_text)
    if show_legend:
        plt.legend(label_list, loc=9, bbox_to_anchor=(0.5,-0.15), ncol=len(label_list))
        legend_text = ''
        plt.tight_layout(pad=2.5)
    else:
        legend_text = 'NoLeg'
        plt.tight_layout()
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'TransH' + str(hNow) + 'T' + str(T_ahead) + which + legend_text + '.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)
    
    
def makeMortByHealthFigure(LivPrbArray,ReportPrbArray,HealthInitDstn, save_fig):
    '''
    Make a figure plotting (log) mortality probability by age-health in the data
    and the model.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    save_fig : bool
        Indicator for whether to save figures to /Figures.  Filename will be
        constructed automatically.
    
    Returns
    -------
    None
    '''
    h_group_minmax = [[1,1],[2,2],[3,5]]
    
    # Calculate model mortality probabilities by sex-age-health
    DiePrb_model = np.zeros((2,age_count_B,3)) + np.nan
    for s in sex_list:
        for a in range(age_count_B):
            HealthDstn_uncond = np.tile(np.reshape(HealthInitDstn[s,a,:],(1,x_count)),(h_count,1))
            HealthDstn_cond_temp = ReportPrbArray[:h_count,:]*HealthDstn_uncond
            HealthDstn_cond = HealthDstn_cond_temp[:3,:]
            HealthDstn_cond[2,:] = np.sum(HealthDstn_cond_temp[2:,:],axis=0)
            temp_sum = np.tile(np.reshape(np.sum(HealthDstn_cond,axis=1),(3,1)),(1,x_count))
            HealthDstn_cond[:2,:] /= temp_sum[:2,:]
            temp_sum_good = np.sum(HealthDstn_cond[2:,:])
            HealthDstn_cond[2,:] /= temp_sum_good
            LivProb = np.sum(HealthDstn_cond*np.tile(np.reshape(LivPrbArray[s,a,:],(1,x_count)),(3,1)),axis=1)
            DiePrb_model[s,a,:] = 1. - LivProb
            
    # Calculate data mortality probabilities by sex-age-health
    temp = np.tile(np.reshape(np.arange(T_max-wave_length)*age_incr,(1,T_max-wave_length)),(obs,1))
    age_tiled = np.tile(np.reshape(age_data,(obs,1)),(1,T_max-wave_length)) + temp
    sex_tiled = np.tile(np.reshape(sex_data,(obs,1)),(1,T_max-wave_length))
    weight_tiled = np.tile(np.reshape(weight_data,(obs,1)),(1,T_max-wave_length))
    these = srhs_data[:,:-wave_length] > 0
    age_long = age_tiled[these]
    sex_long = sex_tiled[these]
    weight_long = weight_tiled[these]
    health_long = srhs_data[:,:-wave_length][these]
    health_next_long = srhs_data[:,wave_length:][these]
    survivors = health_next_long > 0
    deceased = health_next_long == 0
    DiePrb_data = np.zeros((2,age_count_B,h_count))
    age_tol = 2
    for s in sex_list:
        right_sex = sex_long == s
        for h in range(len(h_group_minmax)):
            right_health = np.logical_and(health_long >= h_group_minmax[h][0], health_long <= h_group_minmax[h][1])
            for j in range(age_count_B):
                age = age_min + age_incr*j
                right_age = np.logical_and(age_long >= age-age_tol, age_long <= age+age_tol)
                right_sex_age = np.logical_and(right_sex,right_age)
                right_sex_age_health = np.logical_and(right_sex_age,right_health)
                S = float(np.dot(survivors[right_sex_age_health], weight_long[right_sex_age_health]))
                D = float(np.dot(deceased[right_sex_age_health], weight_long[right_sex_age_health]))
                try:
                    DiePrb_data[s,j,h] = D/(S+D)
                except:
                    DiePrb_data[s,j,h] = np.nan
                    
    # Adjust for the look ahead length
    DiePrb_data = 1. - (1. - DiePrb_data)**(1./float(wave_length))
    
    AgeVec = age_min + age_incr*np.arange(age_count_B)
    colors = ['b','r','k']
    
    if 0 in sex_list:
        for h in range(3):
            plt.plot(AgeVec,np.log(DiePrb_model[0,:,h]),'--'+colors[h])
        for h in range(3):
            plt.plot(AgeVec,np.log(DiePrb_data[0,:,h]),'-'+colors[h])
        plt.xlim([AgeVec[0],AgeVec[-1]])
        plt.ylim(-10,0)
        plt.xlabel('Age')
        plt.ylabel('Log death probability')
        plt.legend(['Poor','Fair','Other'])
        plt.title('Mortality by age and SRHS, women in ' + source_name)
        if save_fig:
            filename = '../Figures/' + figure_label + 'WomenMortByAgeHealth.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
    if 1 in sex_list:
        for h in range(3):
            plt.plot(AgeVec,np.log(DiePrb_model[1,:,h]),'--'+colors[h])
        for h in range(3):
            plt.plot(AgeVec,np.log(DiePrb_data[1,:,h]),'-'+colors[h])
        plt.xlim([AgeVec[0],AgeVec[-1]])
        plt.ylim(-10,0)
        plt.xlabel('Age')
        plt.ylabel('Log death probability')
        plt.legend(['Poor','Fair','Other'])
        plt.title('Mortality by age and SRHS, men in ' + source_name)
        if save_fig:
            filename = '../Figures/' + figure_label + 'MenMortByAgeHealth.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
        
def makeChangeAnswerFigure(LivPrbArray, ReportPrbArray, HealthInitDstn, save_fig):
    '''
    Make a figure that plots the model probability of changing SRHS if asked again
    in the same time period if the model is *literally* true.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    save_fig : bool
        Indicator for whether to save figure to /Figures.  Filename will be
        constructed automatically.
    
    Returns
    -------
    None
    '''
    ChangeProbArray = np.zeros((h_count,age_count_B))
    
    # Get cumulative survival probabilities for men and women up to age j
    LivPrb_model = np.zeros((2,age_count_B))
    for s in sex_list:
        for j in range(age_count_B):
            LivPrb_model[s,j] = np.dot(HealthInitDstn[s,j,:],LivPrbArray[s,j,:])
    CumLivPrb_model = np.cumprod(np.concatenate((np.array([[1.],[1.]]),LivPrb_model),axis=1),axis=1)[:,:-1]

    # Loop through each categorical health and age, calculating the probability
    # of not saying the same SRHS if asked again
    for h in range(h_count):
        for j in range(age_count_B):
            # Get initial distribution of health for women and men
            HealthDstnNow = copy(HealthInitDstn[:,j,:])
            
            # Adjust for actual SRHS
            for s in sex_list:
                HealthDstnNow[s,:] *= ReportPrbArray[h,:]
                HealthDstnNow[s,:] /= np.sum(HealthDstnNow[s,:])
                
            # Calculate the probability of saying the same SRHS if asked again
            PopMass = 0.
            SameMass = 0.
            for s in sex_list:
                PopMass += CumLivPrb_model[s,j]
                SameMass += CumLivPrb_model[s,j]*np.dot(HealthDstnNow[s,:],ReportPrbArray[h,:])
            SameProb = SameMass/PopMass
            ChangeProbArray[h,j] = 1.0 - SameProb
    
    # Generate model distribution of SRHS by age-sex       
    HealthStatus_model = np.zeros((2,age_count_B,h_count))
    for s in sex_list:
        for j in range(age_count_B):
            for h in range(h_count):
                HealthStatus_model[s,j,h] = np.dot(HealthInitDstn[s,j,:],ReportPrbArray[h,:])
                
    # Calculate overall probability of changing SRHS if asked twice, weighting across categories
    ChangeProbOverall = np.zeros((2,age_count_B))
    for s in sex_list:
        for j in range(age_count_B):
            ChangeProbOverall[s,j] = np.dot(HealthStatus_model[s,j,:], ChangeProbArray[:,j])
            
    # Plot the probability of changing SRHS status answer if asked again
    colors = ['b','r','g','m','c'] # Need to make this longer if h_count > 5
    if 0 in sex_list:
        sex_word_A = 'women'
        sex_word_B = 'Women'
        if 1 in sex_list:
            sex_word_A = 'people'
            sex_word_B = 'All'
    elif 1 in sex_list:
        sex_word_A = 'men'
        sex_word_B = 'Men'
    age_vec = age_min + age_incr*np.arange(age_count_B)
    
    for h in range(h_count):
        plt.plot(age_vec, ChangeProbArray[h,:], '-' + colors[h])
    for s in sex_list:
        plt.plot(age_vec, ChangeProbOverall[s,:], '--k')
    plt.xlim(np.min(age_vec),np.max(age_vec))
    plt.ylim([-0.001,1.001])
    plt.xlabel('Age')
    plt.ylabel('Predicted probability of changing SRHS')
    plt.title('Probability of changing SRHS, ' + sex_word_A + ' in ' + source_name)
    plt.legend(['Poor','Fair','Good','Very good','Excellent'])
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word_B + 'ChangeSRHS.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)
    
    
def makeDurationDependenceFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,T_back,save_fig):
    '''
    Make a figure showing how the probability of switching between "good" and "bad"
    health states depends on how many consecutive periods the individual has been
    observed in their current binary health state.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    TransPrbArray : np.array
        Array of shape (2,age_count,x_count,x_count) with transition probabilities
        between health states at each sex and age.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    T_back : int
        Maximum length of lookback period (for consecutive periods in same binary
        health state).
    save_fig : bool
        Indicator for whether figures should be saved to /Figures.  Filenames
        will be constructed automatically.
    
    Returns
    -------
    None
    '''
    age_tol = 5
    
    # Make a simplified report array with only two health states
    SRHS_bad = [0,1]
    SRHS_good = [2,3,4]
    BinaryPrbArray = np.zeros((2,ReportPrbArray.shape[1]))
    for h in SRHS_bad:
        BinaryPrbArray[0,:] += ReportPrbArray[h,:]
    for h in SRHS_good:
        BinaryPrbArray[1,:] += ReportPrbArray[h,:]
        
    # Get cumulative survival probabilities for men and women up to age j
    LivPrb_model = np.zeros((2,age_count_B))
    for s in sex_list:
        for j in range(age_count_B):
            LivPrb_model[s,j] = np.dot(HealthInitDstn[s,j,:],LivPrbArray[s,j,:])
    CumLivPrb_model = np.cumprod(np.concatenate((np.array([[1.],[1.]]),LivPrb_model),axis=1),axis=1)[:,:-1]
    
    # Initialize bad to good duration dependence array for the model
    Bad2GoodArray_model = np.zeros((T_back,age_count_B+T_back*wave_length)) + np.nan
    
    # Loop through each age, simulating T_back*wave_length periods
    for j in range(age_count_B):
        # Get initial distribution of health for women and men
        HealthDstnNow = copy(HealthInitDstn[:,j,:])
        Mass = CumLivPrb_model[:,j]
        
        # Adjust for observing the agents in bad health
        for s in sex_list:
            HealthDstnNow[s,:] *= BinaryPrbArray[0,:]
            temp_sum = np.sum(HealthDstnNow[s,:])
            Mass[s] *= temp_sum
            HealthDstnNow[s,:] /= temp_sum
            
        # Simulate T_back*wave_length periods in the model
        bad_labels = []
        for t in range(T_back*wave_length):
            # Adjust the distribution of health for survival and health shocks
            HealthDstnNow *= LivPrbArray[:,j+t,:]
            for s in sex_list:
                TransPrbs = TransPrbArray[s,j+t,:,:]
                HealthDstnNow[s,:] = np.dot(np.transpose(TransPrbs),HealthDstnNow[s,:])
                temp_sum = np.sum(HealthDstnNow[s,:])
                Mass[s] *= temp_sum
                HealthDstnNow[s,:] /= temp_sum
                
            # If this is actually a data wave, find the probability of still being
            # in bad health and record transition probability
            if np.mod(t+1,wave_length) == 0:
                StillBadMass = 0.
                PopMass = 0.
                for s in sex_list:
                    HealthDstnNow[s,:] *= BinaryPrbArray[0,:]
                    temp_sum = np.sum(HealthDstnNow[s,:])
                    StillBadMass += temp_sum*Mass[s]
                    PopMass += Mass[s]
                    HealthDstnNow[s,:] /= temp_sum
            
                tau = (t+1)/wave_length - 1
                Bad2GoodArray_model[tau,j+t] = 1.0 - StillBadMass/PopMass
                
                # Add another label to the legend
                label = '"Unhealthy" for >=' + str(tau+1) + ' wave'
                if tau > 0:
                    label += 's'
                bad_labels.append(label)
            
    # Initialize good to bad duration dependence array for the model
    Good2BadArray_model = np.zeros((T_back,age_count_B+T_back*wave_length)) + np.nan
    
    # Loop through each age, simulating T_back*wave_length periods
    for j in range(age_count_B):
        # Get initial distribution of health for women and men
        HealthDstnNow = copy(HealthInitDstn[:,j,:])
        Mass = CumLivPrb_model[:,j]
        
        # Adjust for observing the agents in bad health
        for s in sex_list:
            HealthDstnNow[s,:] *= BinaryPrbArray[1,:]
            HealthDstnNow[s,:] /= np.sum(HealthDstnNow[s,:])
            
        # Simulate T_back*wave_length periods in the model
        good_labels = []
        for t in range(T_back*wave_length):
            # Adjust the distribution of health for survival and health shocks
            HealthDstnNow *= LivPrbArray[:,j+t,:]
            for s in sex_list:
                TransPrbs = TransPrbArray[s,j+t,:,:]
                HealthDstnNow[s,:] = np.dot(np.transpose(TransPrbs),HealthDstnNow[s,:])
                temp_sum = np.sum(HealthDstnNow[s,:])
                Mass[s] *= temp_sum
                HealthDstnNow[s,:] /= temp_sum
            
            # If this is actually a data wave, find the probability of still being
            # in good health and record transition probability
            if np.mod(t+1,wave_length) == 0:
                StillGoodMass = 0.
                PopMass = 0.
                for s in sex_list:
                    HealthDstnNow[s,:] *= BinaryPrbArray[1,:]
                    temp_sum = np.sum(HealthDstnNow[s,:])
                    StillGoodMass += temp_sum*Mass[s]
                    PopMass += Mass[s]
                    HealthDstnNow[s,:] /= temp_sum
            
                tau = (t+1)/wave_length - 1
                Good2BadArray_model[tau,j+t] = 1.0 - StillGoodMass/PopMass
                
                # Add another label to the legend
                label = '"Healthy" for >=' + str(tau+1) + ' wave'
                if tau > 0:
                    label += 's'
                good_labels.append(label)
            
    # Make arrays that represent being in "good health" vs "bad health"
    observed = srhs_data > 0
    good_health = np.logical_and(srhs_data >= 3, observed)
    bad_health = np.logical_and(srhs_data < 3, observed)
            
    # Initialize bad to good duration dependence array for the data
    Bad2GoodArray_data = np.zeros((T_back,age_count_B+T_back*wave_length)) + np.nan
    
    # Loop over each duration
    for T in range(wave_length,(T_back+1)*wave_length,wave_length):
        age_temp = np.array([])
        switch_temp = np.array([])
        weight_temp = np.array([])
        
        # Loop over each valid starting period
        for t in range(T_max - T):
            these = np.ones(obs,dtype=bool) # Start with all observations
            for s in range(0,T,wave_length): # Keep only the ones that are bad for T waves straight
                these = np.logical_and(these, bad_health[:,t+s])
            these = np.logical_and(these,observed[:,t+T])
            age_temp = np.append(age_temp, age_data[these] + t*age_incr)
            switch_temp = np.append(switch_temp, good_health[these,t+T])
            weight_temp = np.append(weight_temp, weight_data[these])
            
        # Loop over each age to find qualifying observations within age tolerance
        for j in range(age_count_B):
            age = age_min + age_incr*j
            age_lo = age - age_tol
            age_hi = age + age_tol
            those = np.logical_and(age_temp >= age_lo, age_temp <= age_hi)
            Bad2GoodArray_data[T/wave_length-1,j+T-1] = np.dot(switch_temp[those],weight_temp[those])/np.sum(weight_temp[those])
            
    # Initialize good to bad duration dependence array for the data
    Good2BadArray_data = np.zeros((T_back,age_count_B+T_back*wave_length)) + np.nan
    
    # Loop over each duration
    for T in range(wave_length,(T_back+1)*wave_length,wave_length):
        age_temp = np.array([])
        switch_temp = np.array([])
        weight_temp = np.array([])
        
        # Loop over each valid starting period
        for t in range(T_max - T):
            these = np.ones(obs,dtype=bool) # Start with all observations
            for s in range(0,T,wave_length): # Keep only the ones that are good for T waves straight
                these = np.logical_and(these, good_health[:,t+s])
            these = np.logical_and(these,observed[:,t+T])
            age_temp = np.append(age_temp, age_data[these] + t*age_incr)
            switch_temp = np.append(switch_temp, bad_health[these,t+T])
            weight_temp = np.append(weight_temp, weight_data[these])
            
        # Loop over each age to find qualifying observations within age tolerance
        for j in range(age_count_B):
            age = age_min + age_incr*j
            age_lo = age - age_tol
            age_hi = age + age_tol
            those = np.logical_and(age_temp >= age_lo, age_temp <= age_hi)
            Good2BadArray_data[T/wave_length-1,j+T-1] = np.dot(switch_temp[those],weight_temp[those])/np.sum(weight_temp[those])
            
    colors = ['b','r','g','m','c']
    if 0 in sex_list:
        sex_word = 'Women'
        who_text = 'women in '
        if 1 in sex_list:
            sex_word = 'All'
            who_text = 'people in '
    elif 1 in sex_list:
        sex_word = 'Men'
        who_text = 'men in '
    who_text += source_name
            
    # Plot bad to good duration dependence on a figure
    age_vec = age_min + age_incr*np.arange(age_count_B + T_back*wave_length)
    for t in range(T_back):
        plt.plot(age_vec,Bad2GoodArray_model[t,:],'--' + colors[t])
    for t in range(T_back):
        plt.plot(age_vec,Bad2GoodArray_data[t,:],'-' + colors[t])
    plt.xlabel('Age')
    plt.ylabel('Probability of becoming "healthy"')
    plt.title('Duration dependence when "unhealthy", ' + who_text)
    plt.xlim([age_min,age_max - T_max*age_incr])
    plt.ylim([0.0,0.7])
    plt.legend(bad_labels, loc=1)
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'DurDepT' + str(T_back) + 'B2G.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)
    
    # Plot good to bad duration dependence on a figure
    age_vec = age_min + age_incr*np.arange(age_count_B + T_back*wave_length)
    for t in range(T_back):
        plt.plot(age_vec,Good2BadArray_model[t,:],'--' + colors[t])
    for t in range(T_back):
        plt.plot(age_vec,Good2BadArray_data[t,:],'-' + colors[t])
    plt.xlabel('Age')
    plt.ylabel('Probability of becoming "unhealthy"')
    plt.title('Duration dependence when "healthy", ' + who_text)
    plt.xlim([age_min,age_max - T_max*age_incr])
    plt.ylim([0.0,0.25])
    plt.legend(good_labels, loc=2)
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'DurDepT' + str(T_back) + 'G2B.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)
    
    
def makeHealthDstnByAgeFigure(HealthInitDstn, save_fig):
    '''
    Make figures plotting quantiles of latent health index x_t by age.
    
    Parameters
    ----------
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    save_fig : bool
        Indicator for whether the figures should be saved to disk.
        
    Returns
    -------
    '''
    pctiles = [0.05,0.25,0.50,0.75,0.95]
    age_vec = age_min + age_incr*np.arange(age_count_B)
    
    if 0 in sex_list:
        xPercentiles = np.zeros((age_count_B,5)) + np.nan
        for j in range(age_count_B):
            xPercentiles[j,:] = getPercentiles(x_grid, weights=HealthInitDstn[0,j,:], percentiles=pctiles, presorted=True)
            
        line_styles = ['-.r','--r','-r','--r','-.r']
        for p in range(5):
            plt.plot(age_vec,xPercentiles[:,p],line_styles[p])
        plt.xlabel('Age')
        plt.ylabel(r'Latent health index $x_t$')
        plt.legend(['5th & 95th pctiles', '25th & 50th pctiles', '50th pctile'], loc=9, bbox_to_anchor=(0.5,-0.15), ncol=3)
        plt.title('Distribution of latent health by age, women in ' + source_name)
        plt.xlim(age_vec[0], age_vec[-1])
        plt.tight_layout()
        if save_fig:
            filename = '../Figures/' + figure_label + 'HealthDstnWomen.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
    if 1 in sex_list:
        xPercentiles = np.zeros((age_count_B,5)) + np.nan
        for j in range(age_count_B):
            xPercentiles[j,:] = getPercentiles(x_grid, weights=HealthInitDstn[1,j,:], percentiles=pctiles, presorted=True)
        
        line_styles = ['-.b','--b','-b','--b','-.b']
        for p in range(5):
            plt.plot(age_vec,xPercentiles[:,p],line_styles[p])
        plt.xlabel('Age')
        plt.ylabel(r'Latent health index $x_t$')
        plt.legend(['5th & 95th pctiles', '25th & 50th pctiles', '50th pctile'], loc=9, bbox_to_anchor=(0.5,-0.15), ncol=3)
        plt.title('Distribution of latent health by age, men in ' + source_name)
        plt.xlim(age_vec[0], age_vec[-1])
        plt.tight_layout(hpad=1.2)
        if save_fig:
            filename = '../Figures/' + figure_label + 'HealthDstnMen.pdf'
            plt.savefig(filename)
        plt.show()
        if save_fig:
            print('Saved figure to ' + filename)
        
        
def makeCorrFigure(Corr0,CorrAge1,CorrAge2,CorrAge3,CorrAge4,save_data,save_fig):
    '''
    Make a figure showing the correlation coefficient on x_t by age.
    
    Parameters
    ----------
    Corr0 : float
        Constant in correlation coefficient function.
    CorrAge1 : float
        Linear coefficient on age in correlation coefficient function.
    CorrAge2 : float
        Quadratic coefficient on age in correlation coefficient function.
    CorrAge3 : float
        Cubic coefficient on age in correlation coefficient function.
    CorrAge4 : float
        Quartic coefficient on age in correlation coefficient function.
    save_data : bool
        Indicator for whether the data should be saved to disk.
    save_fig : bool
        Indicator for whether the figure should be saved to disk.
    
    Returns
    -------
    None
    '''
    AgeVec = age_min + age_incr*np.arange(age_count_B)
    CorrVecBase = Corr0 + CorrAge1*AgeVec + CorrAge2*AgeVec**2 + CorrAge3*AgeVec**3 + CorrAge4*AgeVec**4
    CorrVec = np.exp(CorrVecBase)/(1. + np.exp(CorrVecBase))
    
    if 0 in sex_list:
        sex_word = 'Women'
        who_text = 'women in '
        if 1 in sex_list:
            sex_word = 'All'
            who_text = 'people in '
    elif 1 in sex_list:
        sex_word = 'Men'
        who_text = 'men in '
    who_text += source_name
    
    plt.plot(AgeVec,CorrVec,'-b')
    plt.xlabel('Age')
    plt.ylabel(r'Correlation on latent health $x_t$')
    plt.title('Correlation coefficient by age, ' + who_text)
    plt.xlim(AgeVec[0],AgeVec[-1])
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'Corr.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)
    
    if save_data:
        if 0 in sex_list:
            filename = '../Data/Figures/' + figure_label + 'womenCorr.txt'
        elif 1 in sex_list:
            filename = '../Data/Figures/' + figure_label + 'menCorr.txt'
        if (0 in sex_list) and (1 in sex_list):
            print("makeCorrFigure() can't handle specifications with both sexes!")
        outfile = open(filename,'w') 
        my_writer = csv.writer(outfile,delimiter='\t',lineterminator='\n')
        for j in range(age_count_B):
            my_writer.writerow(np.array([AgeVec[j],CorrVec[j]]))
        outfile.close()
        print('Wrote data to ' + filename)
    
    
def makeStateCountFigure(param_vec, age_bot, age_top, T_ahead, save_fig):
    '''
    Make a figure plotting the number of observed "unhealthy" periods conditional
    on being healthy or unhealthy at t=0, counting T_ahead waves forward.  Compares
    empirical data counts (using balanced panel only) vs model prediction.
    
    Parameters
    ----------
    param_vec : np.array
        Array of parameters that could be used in the objective function.
    age_bot : float
        Minimum age of respondents to include in sample.
    age_top : float
        Maximum age of respondents to include in sample.
    T_ahead : int
        Number of waves of data ahead to look for unhealthy periods.
    save_fig : bool
        Indicator for whether the figure should be saved to ../Figures.
        
    Returns
    -------
    None
    '''
    UnhealthyFreq_data = np.zeros((2,T_ahead+1))
    
    # Loop through starting waves in the data, looking for valid observations.
    # An observation is valid if it is observed in this wave *and* the next T_ahead waves.
    for t in range(T_max - wave_length*T_ahead):
        age_temp = age_data + t*age_incr
        right_age = np.logical_and(age_temp >= age_bot, age_temp <= age_top)
        srhs_temp = srhs_data[:,t+np.arange(0, wave_length*(T_ahead+1), step=wave_length)]
        srhs_obs = np.sum(srhs_temp > 0, axis=1) == (T_ahead+1)
        these = np.logical_and(right_age, srhs_obs) # flag for valid observations
        
        # Count the number of times each respondent reports "unhealthy" SRHS in future
        # periods, and whether they were healthy or unhealthy at the start
        unhealthy_counts = np.sum(srhs_temp[these,1:] < 3, axis=1)
        unhealthy_init = srhs_temp[these,0] < 3
        healthy_init = np.logical_not(unhealthy_init)
        
        # Add (weighted) frequencies to our running tally of balanced panel counts
        for n in range(T_ahead+1):
            UnhealthyFreq_data[0,n] += np.dot(weight_data[these]*unhealthy_init, unhealthy_counts==n)
            UnhealthyFreq_data[1,n] += np.dot(weight_data[these]*healthy_init, unhealthy_counts==n)
        
    # Normalize by sum of observations to turn frequencies into probabilities
    row_sum = np.sum(UnhealthyFreq_data, axis=1)
    UnhealthyFreq_data[0,:] /= row_sum[0]
    UnhealthyFreq_data[1,:] /= row_sum[1]
    
    # Initialize objects to make simulated SRHS data
    UnhealthyFreq_sim = np.zeros((2,T_ahead+1))
    age_vec = np.arange(age_bot, age_top+age_incr, step=age_incr)
    sex = sex_list[0]
    AgentCount = 100000
    
    # Loop through each age in the selected range, simulating data and adding it to frequencies
    for age in age_vec:
        # Make simulated data and a population weight for this age
        srhs_sim = makeSimulatedSRHSdata(param_vec, sex, age, wave_length*T_ahead+1, AgentCount)
        srhs_temp = srhs_sim[:,np.arange(0, wave_length*(T_ahead+1), step=wave_length)]
        weight_temp = np.dot(age == age_data, weight_data) # Sum of all weights in data for this age
        these = srhs_temp[:,-1] > 0 # Only use simulated agents that survive all periods
        
        # Count the number of times each respondent reports "unhealthy" SRHS in future
        # periods, and whether they were healthy or unhealthy at the start
        unhealthy_counts = np.sum(srhs_temp[these,1:] < 3, axis=1)
        unhealthy_init = srhs_temp[these,0] < 3
        healthy_init = np.logical_not(unhealthy_init)
        
        # Add (weighted) frequencies to our running tally of balanced panel counts
        for n in range(T_ahead+1):
            UnhealthyFreq_sim[0,n] += weight_temp*np.sum(unhealthy_init*(unhealthy_counts==n))
            UnhealthyFreq_sim[1,n] += weight_temp*np.sum(healthy_init*(unhealthy_counts==n))
            #UnhealthyFreq_sim[1,n] += np.dot(healthy_init, unhealthy_counts==n)
            #UnhealthyFreq_sim[0,n] += np.sum(unhealthy_counts==n)
            
    # Normalize by sum of observations to turn frequencies into probabilities
    row_sum = np.sum(UnhealthyFreq_sim, axis=1)
    UnhealthyFreq_sim[0,:] /= row_sum[0]
    UnhealthyFreq_sim[1,:] /= row_sum[1]
    
    if sex == 0:
        sex_word = 'Women'
    else:
        sex_word = 'Men'
    
    # Plot data vs simulated distribution of unhealthy periods conditional on being unhealthy
    for t in range(T_ahead+1):
        y = UnhealthyFreq_data[0,t]
        z = UnhealthyFreq_sim[0,t]
        plt.fill([t-0.33,t,t,t-0.33], [0.,0.,y,y], color='b')
        plt.fill([t+0.35,t+0.02,t+0.02,t+0.35], [0.,0.,z,z], color='r')
    plt.xlim(-0.75, T_ahead+0.75)
    plt.ylim(0., 0.80)
    plt.xlabel('Number of subsequent waves reporting "unhealthy"')
    plt.ylabel('Fraction of respondents')
    plt.title(sex_word + ' ' + str(age_bot) + '-' + str(age_top) + ' in ' + source_name + ' who report being "unhealthy"')
    plt.legend(['Data','Model'])
    plt.tight_layout()
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'SRHSfreqU' + str(age_bot) + 'to' + str(age_top) + '.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to '+ filename)
    
    # Plot data vs simulated distribution of unhealthy periods conditional on being healthy
    for t in range(T_ahead+1):
        y = UnhealthyFreq_data[1,t]
        z = UnhealthyFreq_sim[1,t]
        plt.fill([t-0.33,t,t,t-0.33], [0.,0.,y,y], color='b')
        plt.fill([t+0.35,t+0.02,t+0.02,t+0.35], [0.,0.,z,z], color='r')
    plt.xlim(-0.75, T_ahead+0.75)
    plt.ylim(0., 0.80)
    plt.xlabel('Number of subsequent waves reporting "unhealthy"')
    plt.ylabel('Fraction of respondents')
    plt.title(sex_word + ' ' + str(age_bot) + '-' + str(age_top) + ' in ' + source_name + ' who report being "healthy"')
    plt.legend(['Data','Model'])
    plt.tight_layout()
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'SRHSfreqH' + str(age_bot) + 'to' + str(age_top) + '.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to '+ filename)
    
    
def makeConstantSRHSfigure(param_vec, save_fig):
    '''
    Make a figure plotting the proportion of respondents who report the same SRHS
    in every single data wave across ages, model vs data.
    
    Parameters
    ----------
    param_vec : np.array
        Array of parameters for the model.
    save_fig : bool
        Indicator for whether the figure should be saved to ../Figures.
        
    Returns
    -------
    None
    '''
    age_vec = age_min + age_incr*np.arange(age_count_B)
    age_tol = 2.
    
    sex = sex_list[0]
    if sex == 0:
        sex_word = 'women'
        color = 'r'
    else:
        sex_word = 'men'
        color = 'b'
    
    # Make age plot for data
    all_match_data = np.all(srhs_data==np.tile(np.reshape(srhs_data[:,0],(obs,1)),(1,T_max)), axis=1)
    same_frac_data = np.zeros_like(age_vec) + np.nan
    for j in range(age_vec.size):
        age = age_vec[j]
        these = np.logical_and(age_data >= age-age_tol, age_data <= age+age_tol)
        num = np.dot(weight_data[these], all_match_data[these])
        denom = np.dot(np.all(srhs_data[these,:] > 0, axis=1), weight_data[these])
        same_frac_data[j] = num/denom
        
    # Make age plot for estimated model
    sim_obs = 100000
    same_frac_model = np.zeros_like(age_vec) + np.nan
    for j in range(age_vec.size):
        age = age_vec[j]
        sim_data = makeSimulatedSRHSdata(param_vec, sex_list[0], age, T_max, sim_obs)
        all_match_sim = np.all(sim_data==np.tile(np.reshape(sim_data[:,0],(sim_obs,1)),(1,T_max)), axis=1)
        num = float(np.sum(all_match_sim))
        denom = float(np.sum(np.all(sim_data > 0., axis=1)))
        same_frac_model[j] = num/denom
        print(age,same_frac_model[j])
    
    # Make and save the figure
    plt.plot(age_vec, same_frac_data,'-' + color)
    plt.plot(age_vec, same_frac_model,'--' + color)
    plt.xlabel('Age')
    plt.ylabel('Proportion with sane SRHS in all waves')
    plt.title('Probability of same SRHS in all ' + str(T_max) + ' waves, ' + sex_word + ' in ' + source_name)
    plt.legend(['Data','Model'],loc=3)
    plt.xlim(age_vec[0],age_vec[-1])
    plt.ylim(0., 0.25)
    if save_fig:
        filename = '../Figures/' + figure_label + sex_word + 'SameSRHS.pdf'
        plt.savefig(filename)
    plt.show()
    if save_fig:
        print('Saved figure to ' + filename)



def makeSimulatedSRHSdata(param_vec, sex, age_0, T_sim, N_agents):
    '''
    Make simulated SRHS data using the latent health model.  Agents all have same
    sex and start at same age and are simulated for T_sim periods.
    
    Parameters
    ----------
    param_vec : np.array
        Array of parameters for the model.
    sex : int
        0 or 1 indicating female or male.
    age_0 : float
        Age in years at which simulated agents begin.
    T_sim : int
        Number of waves of data to simulate, including the initial wave.
    N_agents : int
        Number of respondents to simulate.
        
    Returns
    -------
    srhs_sim : np.array
        Integer array of shape (N_agents, T_sim) with simulated SRHS data.
    '''
    # Initialize RNG and output, and calculate index of starting age
    RNG = np.random.RandomState(138)
    srhs_sim = -np.ones((N_agents, T_sim), dtype=int)
    t0 = int(np.round((age_0 - age_min)/age_incr))
    X = np.arange(x_count)
    H = np.arange(1, h_count+1)
    
    def drawSeed():
        return int(np.floor((2**32-1)*RNG.rand()))
    
    # Calculate transition and initial probabilities
    my_dict = makeParameterDict(param_vec)
    LivPrbArray, TransPrbArray, ReportPrbArray, HealthInitDstn = makeProbArrays(**my_dict)
    
    # Draw initial latent health states for the agents
    s = sex
    t = t0
    P = HealthInitDstn[s,t,:]
    xIdxNow = drawDiscrete(N_agents, P, X, seed=drawSeed())
    
    # For each of the next T_sim periods, simulate SRHS draws, mortality, and health shocks
    for i in range(T_sim):
        # Simulate SRHS draws using ReportPrbArray
        for j in range(x_count):
            these = xIdxNow == j
            num = np.sum(these)
            P = ReportPrbArray[:,j]
            srhs_sim[these,i] = drawDiscrete(num, P, H, seed=drawSeed())
        these = xIdxNow == -1
        srhs_sim[these,i] = 0 # Mark dead agents
            
        # Simulate mortality using LivPrbArray
        pLiv = np.zeros(N_agents)
        these = xIdxNow >= 0
        pLiv[these] = LivPrbArray[s,t,xIdxNow[these]]
        mort_draws = RNG.rand(N_agents)
        xIdxNow[mort_draws > pLiv] = -1 # These agents are dead
            
        # Simulate health shocks using TransPrbArray
        xIdxNext = np.copy(xIdxNow)
        for j in range(x_count):
            these = xIdxNow == j
            num = np.sum(these)
            P = TransPrbArray[s,t,j,:]
            xIdxNext[these] = drawDiscrete(num, P, X, seed=drawSeed())
        
        # Move to the next age
        xIdxNow = xIdxNext
        t += 1
        
    return srhs_sim
    

def calcNaiveTransProbs():
    '''
    Calculate one period transition probabilities directly from the data.
    
    Parameters
    ----------
    None
    
    Returns
    -------
    LivPrbNaiveArray : np.array
        Array of shape (2,age_count,h_count) with one period survival probabilities
        taken directly from the data.
    TransPrbNaiveArray : np.array
        Array of shape (2,age_count,h_count,h_count) with one period transition
        probabilities taken directly from the data.
    HealthInitDstnNaive : np.array
        Array of shape (2,age_count,h_count) with the distribution of self-reported
        health status by sex and age, directly from the data.
    '''
    temp = np.tile(np.reshape(np.arange(T_max-wave_length)*age_incr,(1,T_max-wave_length)),(obs,1))
    age_tiled = np.tile(np.reshape(age_data,(obs,1)),(1,T_max-wave_length)) + temp
    sex_tiled = np.tile(np.reshape(sex_data,(obs,1)),(1,T_max-wave_length))
    weight_tiled = np.tile(np.reshape(weight_data,(obs,1)),(1,T_max-wave_length))
    these = srhs_data[:,:-wave_length] > 0
    age_long = age_tiled[these]
    sex_long = sex_tiled[these]
    weight_long = weight_tiled[these]
    health_long = srhs_data[:,:-wave_length][these]
    health_next_long = srhs_data[:,wave_length:][these]
    
    LivPrbNaiveArray = np.zeros((2,age_count_A,h_count))
    TransPrbNaiveArray = np.zeros((2,age_count_A,h_count,h_count))
    HealthInitDstnNaive = np.zeros((2,age_count_A,h_count))
    age_tol = 2
    for s in sex_list:
        right_sex = sex_long == s
        for h in range(h_count):
            right_health = h+1 == health_long
            for j in range(age_count_A):
                age = age_min + age_incr*j
                right_age = np.logical_and(age_long >= age-age_tol, age_long <= age+age_tol)
                right_sex_age = np.logical_and(right_sex,right_age)
                right_sex_age_health = np.logical_and(right_sex_age,right_health)
                HealthInitDstnNaive[s,j,h] = np.dot(right_sex_age_health, weight_long)
                outcomes_temp = np.zeros(h_count+1)
                for i in range(h_count+1):
                    outcomes_temp[i] = np.dot(health_next_long[right_sex_age_health] == i, weight_long[right_sex_age_health])
                survivor_N = np.sum(outcomes_temp[1:])
                deceased_N = outcomes_temp[0]
                LivPrbNaiveArray[s,j,h] = survivor_N/(survivor_N + deceased_N)
                TransPrbNaiveArray[s,j,h,:] = outcomes_temp[1:]/survivor_N
    
    HealthInitDstnNaive = HealthInitDstnNaive / np.tile(np.reshape(np.sum(HealthInitDstnNaive,axis=2),(2,age_count_A,1)),(1,1,h_count))
    HealthInitDstnNaive[np.isnan(HealthInitDstnNaive)] = 0.0
    return LivPrbNaiveArray, TransPrbNaiveArray, HealthInitDstnNaive


def makeTransitionDemoFigure(LivPrbArray,TransPrbArray,ReportPrbArray,HealthInitDstn,
                             s,j,hPrev,iNow,iAlready,frame,offset,use_orig=False,pdf_bool=False):
    '''
    Make a three panel figure demonstrating how latent health state transitions
    are calculated.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    TransPrbArray : np.array
        Array of shape (2,age_count,x_count,x_count) with transition probabilities
        between health states at each sex and age.
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    s : int
        Index of sex to plot (0 women, 1 men).
    j : int
        Index of age to plot.
    hPrev : int
        SRHS observed at age j.  If -1, no SRHS was observed.
    iNow : int or None
        Index of latent health state to highlight / focus on in this frame.
    iAlready : [int]
        Indices of latent health states that have already transitioned to j+1.
    frame : int
        Indicator for which "frame" of the animation this is.
    offset : int
        Frame offset for saving animation frames.
    use_orig : bool
        Indicator for whether to use the original x distribution for the before
        period (default is to show transferred mass).
    pdf_bool : bool
        Indicator for whether to save the figure as a PDF (default False --> PNG).    
        
    Returns
    -------
    None
    '''
    # Get initial health distribution
    xVecNow = np.copy(HealthInitDstn[s,j,:])
    
    # If SRHS was observed, adjust the posterior distribution of health
    if hPrev > 0:
        h = hPrev-1
        xVecNow *= ReportPrbArray[h,:]
        temp_sum = np.sum(xVecNow)
        xVecNow /= temp_sum
    
    xVecOrig = np.copy(xVecNow)
    xVecNow *= LivPrbArray[s,j,:] # Account for surviving to next period
    xVecNow /= np.sum(xVecNow)
    pTop = np.max(xVecNow*1.05)
    pBot = 0.
    
    AgeNow = int(age_min + age_incr*j)
    AgeNext = int(AgeNow + age_incr)
    
    # Initialize next period's health distribution
    xVecNext = np.zeros(x_count) 
    
    # Loop through iAlready and transfer probability mass to age j+1
    for i in iAlready:
        mass_temp = xVecNow[i]
        xVecNow[i] = 0
        xVecNext += mass_temp*TransPrbArray[s,j,i,:]
        
    # Calculate the new mass to add on from iNow
    xVecNew = xVecNow[iNow]*TransPrbArray[s,j,iNow,:]
        
    # Plot age distribution at age j
    plt.subplot(2,1,1)
    for i in range(x_count):
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        if use_orig:
            temp = xVecOrig[i]
        else:
            temp = xVecNow[i]
        my_y = [0., temp, temp, 0.]
        if (i == iNow) and (frame > 0) and (frame < 3):
            color = (0.,1.,0.)
        else:
            color = 'b'
        if (frame < 3) or (i != iNow):
            plt.fill(my_x, my_y, color=color)
    plt.xlabel('Latent health at age ' + str(AgeNow) + ' (after survival)')
    plt.ylabel('At age ' + str(AgeNow))
    plt.xlim(x_min,x_max)
    plt.ylim(pBot,pTop)
    
    # Plot age distribution at age j+1
    plt.subplot(2,1,2)
    for i in range(x_count):
        if frame > 1:
            my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
            my_y = [xVecNext[i], xVecNext[i]+xVecNew[i], xVecNext[i]+xVecNew[i], xVecNext[i]]
            plt.fill(my_x, my_y, color=(0.,1.,0.))
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        my_y = [0., xVecNext[i], xVecNext[i], 0.]
        plt.fill(my_x, my_y,'r')
    plt.xlabel('Latent health index')
    plt.ylabel('At age ' + str(AgeNext))
    plt.xlim(x_min,x_max)
    plt.ylim(pBot,pTop)
    
    plt.suptitle('Probability distribution of latent health from age ' + str(AgeNow) + ' to ' + str(AgeNext))
    
    fig_title = 'frame' + str(offset+frame)
    if pdf_bool:
        fig_title += '.pdf' 
    else:
        fig_title += '.png'
    filename = '../Figures/HealthTransAnimation/' + fig_title
    plt.savefig(filename)
    plt.show()
    print('Saved figure to ' + filename)
    
    
def makeMortalityDemoFigure(LivPrbArray,HealthInitDstn,s,j,frame):
    '''
    Make a figure showing how mortality affects the distribution of health.
    
    Parameters
    ----------
    LivPrbArray : np.array
        Array of shape (2,age_count,x_count) with survival probabilities.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    s : int
        Index of sex to plot (0 women, 1 men).
    j : int
        Index of age to plot.
    frame : int
        Index of the animation "frame"
    '''
    xVec0 = HealthInitDstn[s,j,:]
    LivPrb = LivPrbArray[s,j,:]
    xVec1 = xVec0*LivPrb
    xVec2 = xVec1/np.sum(xVec1)
    AgeNow = int(age_min + j*age_incr)
    
    # Plot survival probability
    plt.subplot(2,1,1)
    for i in range(x_count):
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        my_y = [0., LivPrb[i], LivPrb[i], 0.]
        plt.fill(my_x, my_y, 'b')
    plt.xlim(x_min,x_max)
    plt.ylim(0.,1.)
    plt.ylabel('Survival probability')
    
    # Plot distribution of latent health
    plt.subplot(2,1,2)
    for i in range(x_count):
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        if frame == 0:
            top = xVec0[i]
        elif frame < 3:
            top = xVec1[i]
        else:
            top = xVec2[i]
        my_y = [0., top, top, 0.]
        plt.fill(my_x, my_y, 'r')
        if frame == 1:
            bot = top
            top = top = xVec0[i]
            my_y = [bot, top, top, bot]
            plt.fill(my_x, my_y, 'k')
    plt.xlim(x_min,x_max)
    plt.ylim(0.,1.05*np.max(xVec0))
    plt.xlabel('Latent health index')
    plt.ylabel('Probability mass')
    
    if frame == 0:
        plt.suptitle('Latent health: distribution at age ' + str(AgeNow))
    elif frame == 1:
        plt.suptitle('Latent health: who dies at age ' + str(AgeNow))
    elif frame == 2:
        plt.suptitle('Latent health: after mortality at age ' + str(AgeNow))
    elif frame == 3:
        plt.suptitle('Latent health: survival adjustment at age ' + str(AgeNow))
    
    filename = '../Figures/MortalityDemo' + str(frame) + '.pdf'
    plt.savefig(filename)
    plt.show()
    print('Saved figure to ' + filename)
    
    
def makeReportDemoFigure(ReportPrbArray,HealthInitDstn,s,j,h,frame):
    '''
    Make a figure showing how observing SRHS affects the distribution of health.
    
    Parameters
    ----------
    ReportPrbArray : np.array
        Array of shape (h_count,x_count) with the probability of reporting health
        status h when the individual's true health is x.
    HealthInitDstn : np.array
        Array of shape (2,age_count,x_count) with the unconditional distribution
        of continuous health x at age j and sex s.
    s : int
        Index of sex to plot (0 women, 1 men).
    j : int
        Index of age to plot.
    h : int
        Observed categorical health status, from 1 to 5.
    frame : int
        Index of the animation "frame"
    '''
    xVec0 = HealthInitDstn[s,j,:]
    ReportPrb = ReportPrbArray[h-1,:]
    xVec1 = xVec0*ReportPrb
    xVec2 = xVec1/np.sum(xVec1)
    AgeNow = int(age_min + j*age_incr)
    
    # Plot report probability
    plt.subplot(2,1,1)
    for i in range(x_count):
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        my_y = [0., ReportPrb[i], ReportPrb[i], 0.]
        plt.fill(my_x, my_y, 'b')
    plt.xlim(x_min,x_max)
    plt.ylim(0.,1.)
    plt.xlabel('Latent health index')
    plt.ylabel('Prob(h = ' + str(h) + ' | x)')
    
    # Plot distribution of latent health
    plt.subplot(2,1,2)
    for i in range(x_count):
        my_x = [x_cuts[i], x_cuts[i], x_cuts[i+1], x_cuts[i+1]]
        if frame == 0:
            top = xVec0[i]
        elif frame < 3:
            top = xVec1[i]
        else:
            top = xVec2[i]
        my_y = [0., top, top, 0.]
        plt.fill(my_x, my_y, 'r')
        if frame == 1:
            bot = top
            top = top = xVec0[i]
            my_y = [bot, top, top, bot]
            plt.fill(my_x, my_y, 'k')
    plt.xlim(x_min,x_max)
    y_max = np.maximum(1.05*np.max(xVec0), 1.05*np.max(xVec2))
    plt.ylim(0.,1.05*y_max)
    plt.xlabel('Latent health index')
    plt.ylabel('Probability mass')
    
    if frame == 0:
        plt.suptitle('Latent health: distribution at age ' + str(AgeNow))
    elif frame == 1:
        plt.suptitle('Latent health: observing h=' + str(h) + ' at age ' + str(AgeNow))
    elif frame == 2:
        plt.suptitle('Latent health: after observing h=' + str(h) + ' age ' + str(AgeNow))
    elif frame == 3:
        plt.suptitle('Latent health: SRHS adjustment at age ' + str(AgeNow))
    
    filename = '../Figures/ReportDemo' + str(frame) + '.pdf'
    plt.savefig(filename)
    plt.show()
    print('Saved figure to ' + filename)
    

def writeParamsToFile(param_vec, filename):
    '''
    Store the current parameter files in a txt file so they can be recovered in
    case of a computer crash (etc).
    
    Parameters
    ----------
    param_vec : np.array
        Size 30 array of structural parameters.
    filename : str
        Name of file in which to write the current parameters.
        
    Returns
    -------
    None
    '''
    write_str = 'current_param_vec = np.array([ \n'
    for i in range(param_vec.size):
        write_str += '    ' + str(param_vec[i]) + ',  # ' + str(i) + ' ' + param_names[i] + '\n'
    write_str += ']) \n'
    with open('../Data/' + filename,'w') as f:
        f.write(write_str)
        f.close()           
    
# Make list parameter names that don't depend on measures
param_names_base = [
        'Mort0',
        'MortSex',
        'MortHealth1',
        'MortHealth2',
        'MortHealth3',
        'MortHealth4',
        'MortAge1',
        'MortAge2',
        'MortAge3',
        'MortAge4',
        'MortHealthAge',
        'MortSexAge',
        'Corr0',
        'CorrAge1',
        'CorrAge2',
        'CorrAge3',
        'CorrAge4',
        'Health0',
        'HealthSex',
        'HealthAge1',
        'HealthAge2',
        'HealthAge3',
        'HealthAge4',
        'HealthAgeSex',
        'xInitMean',
        'xInitStd']

# Construct measure-specific parameter names
to_add = []
for j in range(measure_count):
    this_name = measure_names[j] + '_'
    if j > 0:
        to_add.append(this_name + 'Const')
for j in range(measure_count):
    this_name = measure_names[j] + '_'
    to_add.append(this_name + 'Coeff')
for j in range(measure_count):
    this_name = measure_names[j] + '_'
    c_count = category_counts[j]
    for c in range(c_count-2):
        k = c+2
        to_add.append(this_name + 'Cut' + str(k))

# Combine the parameter name lists
param_names = param_names_base + to_add


if __name__ == '__main__':
    
    # Choose what kind of work to do
    describe_data = False              # Print a description of the data to screen
    test_function = False              # Run the LL function once and report timing
    make_figs = False                  # Produce selected figures and display on screen
    save_figs = False                  # Save those figures to disk (only relevant if ^^ is True)
    vary_one_param = False             # Produce a simple plot of LL function vs one model parameter
    estimate_model = True              # Estimate structural model parameters
    calc_std_errs = True               # Calculate standard errors by inverting the Hessian of the LL func
    make_predicted_health_data = False # Make a file with predicted latent health (squared) by age and SRHS sequence
    est_age_group_params = False       # DEPRECATED: Estimate model on a small range of ages from the MEPS
    convert_param_format = False       # DEPRECATED: Convert between parameter formats, only needed in past
    
    # Choose which parameters to estimate (which_indices is defined in parameters file)
    test_param_vec = copy(current_param_vec)
    which_bool = np.zeros(test_param_vec.size,dtype=bool)
    which_bool[which_indices] = True
    
    if describe_data: # Print a description of the data to screen
        print(describeData())
    
    if test_function: # Run and time one log likelihood evaluation
        t0 = time()
        LL = LLfunction(test_param_vec)
        t1 = time()
        print('Running the log likelihood function took ' + str(t1-t0) + ' seconds.')
    
    if make_figs: # Produce a whole bunch of figures
        t0 = time()
        makeFigures(test_param_vec, save_figs)
        t1 = time()
        print('Making post-estimation figures took ' + str(t1-t0) + ' seconds.')
    
    if vary_one_param: # Vary one parameter and plot (negative) log likelihood function
        N = 41
        i = 22
        X = np.linspace(-1,1,num=N)
        Y = np.zeros_like(X)
        my_params = copy(test_param_vec)
        t0 = time()
        for j in range(X.size):
            my_params[i] = X[j]
            Y[j] = LLfunction(my_params)
        t1 = time()
        print('Evaluating the LL function ' + str(N) + ' times took ' + str(t1-t0) + ' seconds.')
        plt.plot(X,Y)
        plt.xlabel(param_names[i])
        plt.ylabel('negative LL')
        plt.show()
    
    if estimate_model: # Estimate some (or all) of the model parameters
        estimated_params = minimizeNelderMead(LLfunction,test_param_vec,verbose=True,which_vars=which_bool, maxiter=200000, maxfun=1000000, xtol=1e-6)
        print('Original function value = ' + str(LLfunction(test_param_vec)))
        writeParamsToFile(estimated_params,'EstimationProgress.txt')
        if not calc_std_errs:
            for j in np.arange(which_indices.size):
                i = which_indices[j]
                print(param_names[i] + ' = ' + str(estimated_params[i]))
        
    if calc_std_errs: # Calculate standard errors using just-estimated parameters
        if estimate_model:
            these_params = estimated_params
        else:
            these_params = test_param_vec
        hessian = calcHessian(LLfunction,these_params,0.00001,which_bool)
        covar = np.linalg.inv(hessian)
        std_errs = np.sqrt(np.diag(covar))
        std_errs_alt = np.reshape(std_errs,(std_errs.size,1))
        se_prime = np.transpose(std_errs_alt)
        corr = covar/np.dot(std_errs_alt,se_prime)
        for j in np.arange(which_indices.size):
            i = which_indices[j]
            print(param_names[i] + ' = ' + str(these_params[i]) + ' (' + str(std_errs[j]) + ')')
        print('Optimized function value = ' + str(LLfunction(these_params)))
        if estimate_model:
            writeParamsToFile(estimated_params,'EstimationProgress.txt')
        std_errs_long = np.zeros_like(these_params) + np.nan
        std_errs_long[which_bool] = std_errs
        
        N_params = these_params.size
        covar_big = np.zeros((N_params,N_params))
        n = 0
        for i in range(N_params):
            if which_bool[i]:
                covar_big[i,which_bool] = covar[n,:]
                n += 1
        saveParamsAndStdErrs(parameterTransformation(these_params), standardErrorsFromCovarMatrix(covar_big), param_file_name)
        
    if make_predicted_health_data: # Make a data file with model prediction of latent health based on 2-3 observations of SRHS
        h3_vec = np.concatenate([h*np.ones(h_count**2, dtype=int) for h in range(1,h_count+1)])
        h2_vec = np.concatenate(h_count*[h*np.ones(h_count, dtype=int) for h in range(1,h_count+1)])
        h1_vec = np.tile(np.arange(1,h_count+1, dtype=int), h_count**2)
        h_array = np.tile(np.stack([h1_vec,h2_vec,h3_vec],axis=1),(age_count_B,1))
        j_vec = np.arange(age_count_B, dtype=int)
        j_array = np.tile(np.reshape(j_vec,(age_count_B,1)),(1,h_count**3)).flatten()
        a_vec = age_min + np.arange(age_count_B)*age_incr
        a_array = np.tile(np.reshape(a_vec,(age_count_B,1)),(1,h_count**3)).flatten()
        xsq_grid = x_grid**2
        
        my_dict = makeParameterDict(test_param_vec)
        LivPrbArray, TransPrbArray, ReportPrbArray, HealthInitDstn = makeProbArrays(**my_dict)
        if 0 in sex_list:
            s = 0
        else:
            s = 1
        
        T_predict = 2
        J = j_array.size
        x_hat_array = np.zeros(J) + np.nan
        xsq_hat_array = np.zeros(J) + np.nan
        for i in range(J):
            j = j_array[i]
            x_vec = np.copy(HealthInitDstn[s,j,:])
            for t in range(T_predict):
                x_vec *= ReportPrbArray[h_array[i,t]-1,:]
                x_vec /= np.sum(x_vec)
                x_vec *= LivPrbArray[s,j+t,:]
                x_vec /= np.sum(x_vec)
                x_vec = np.dot(np.transpose(TransPrbArray[s,j+t,:,:]),x_vec)
                x_vec /= np.sum(x_vec)
            x_hat_array[i] = np.dot(x_grid, x_vec)
            xsq_hat_array[i] = np.dot(xsq_grid, x_vec)
            
        outfile = '../Data/Results/' + param_file_name + 'Xhat.txt'
        f = open(outfile,'w')
        for i in range(x_hat_array.size):
            this_line = str(a_array[i]) + '\t'
            for t in range(T_predict):
                this_line += str(h_array[i,t]) + '\t'
            this_line += str(x_hat_array[i])  + '\t' + str(xsq_hat_array[i]) + '\n'
            f.write(this_line)
        f.close()
        print('Wrote predicted latent health by age and ' + str(T_predict) + 'x SRHS to ' + outfile)
    
    ###############################################################################
    ### CODE BEYOND THIS POINT SHOULD NOT BE RUN, HAS NOT BEEN TESTED IN A WHILE ##
    ###############################################################################
    
    if est_age_group_params:
        A = int(age_min)
        my_string = str(A) + '\t'
        for j in range(which_indices.size):
            i = which_indices[j]
            my_string += str(these_params[i]) + '\t'
        for j in range(which_indices.size):
            my_string += str(std_errs[j]) + '\t'
        my_string = my_string[:-2] + '\n'
        f = open('../Data/AgeGroupParams.txt','a')
        f.write(my_string)
        f.close()
        print('Finished estimating age ' + str(A))
        A += 2
        f = open('LoadAge.py','w')
        f.write('A = ' + str(float(A)))
        f.close()
        
    if convert_param_format:
        new_params = convertOldToNewParams(current_param_vec, age_min)
        writeParamsToFile(new_params,'ConvertedParams.txt')
        print('Converted parameter format!')

'''
Load parameters for estimating the model women across datasets, treating a period as a year.
This version has three reporting types and mixed normal health shocks.
'''
import numpy as np
import os
file_name = os.path.basename(__file__)
dot_i = file_name.find('.')
param_file_name = file_name[:dot_i]
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -12.
x_max = 28.
x_count = 360

# Define parameters for loading in the data file
data_file = '../Data/Estimation/CrossStudyDataAlt.txt'
source_name = 'mixed data' # Name of dataset
figure_label = 'CrossData' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 21        # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 110.0   # Maximum age in the data
age_incr = 1.0    # Age increment in years
wave_length = 2   # Number of periods between actual data collection waves
report_type_count = 3 # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = True # Whether the health shock distribution is a mixed normal


# Define a test parameter vector
current_param_vec = np.array([ 
    2.3940324572933376,  # 0 Mort0
    0.0,  # 1 MortSex
    1.5150366062364349,  # 2 MortHealth1
    -0.03888362551352723,  # 3 MortHealth2
    -1.1932697959902019,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.720340645377359,  # 6 MortAge1
    1.2806677562057873,  # 7 MortAge2
    -24.43486611679958,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -4.571838477752799,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.6152397064160247,  # 12 Corr0
    10.841717692804268,  # 13 CorrAge1
    -57.398414727608056,  # 14 CorrAge2
    145.4442944142704,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    11.282369389657582,  # 17 Health0
    0.0,  # 18 HealthSex
    -2.876202940892558,  # 19 HealthAge1
    -1.2303210331872494,  # 20 HealthAge2
    2.544991884764661,  # 21 HealthAge3
    -1.2863394590943924,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    10.902168281213811,  # 24 xInitMean
    3.7180436066892426,  # 25 xInitStd
    -1.329284299971215,  # 26 HealthShockAvg1
    1.2299549898469417,  # 27 HealthShockLogStd1
    -2.8393937659616784,  # 28 HealthShockLogit1
    -0.7267763767830494,  # 29 SRHSlogStd1
    0.6801048919556842,  # 30 SRHSlogStd2
    0.061362349532688806,  # 31 TypeLogit1
    -1.557080515300411,  # 32 TypeLogit2
    0.43545605262872195,  # 33 SRHS_Coeff
    1.9504624036088691,  # 34 SRHS_Cut2
    1.955314116049769,  # 35 SRHS_Cut3
    1.947775833017649,  # 36 SRHS_Cut4
]) 
# 404599.0472396882

'''
# These are copy-pasted from the all respondent parameter estimates
current_param_vec = np.array([ 
    2.385760227608618,  # 0 Mort0
    -0.2140516617462477,  # 1 MortSex
    1.371857545222534,  # 2 MortHealth1
    0.22977589528850234,  # 3 MortHealth2
    -1.3913733454941635,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.6444378388172455,  # 6 MortAge1
    0.36990758791494077,  # 7 MortAge2
    -21.38240209130287,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -3.6550819203167912,  # 10 MortHealthAge
    0.36373818735733604,  # 11 MortSexAge
    2.5101366283968405,  # 12 Corr0
    10.729101281718572,  # 13 CorrAge1
    -53.70510561419577,  # 14 CorrAge2
    136.59273124005628,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.19317472427272,  # 17 Health0
    1.3049831238451635,  # 18 HealthSex
    -1.013385533687766,  # 19 HealthAge1
    -3.4870293911826655,  # 20 HealthAge2
    4.254105372658194,  # 21 HealthAge3
    -1.9078438891330398,  # 22 HealthAge4
    -58.57399931827321,  # 23 HealthAgeSex
    11.445467401911623,  # 24 xInitMean
    3.7786571135644946,  # 25 xInitStd
    -1.3939776312635952,  # 26 HealthShockAvg1
    1.2015140412251413,  # 27 HealthShockLogStd1
    -2.7470396739454914,  # 28 HealthShockLogit1
    -0.7229110575604851,  # 29 SRHSlogStd1
    0.7014377950350477,  # 30 SRHSlogStd2
    0.047007924837949376,  # 31 TypeLogit1
    -1.6100703586282719,  # 32 TypeLogit2
    0.4254610049104175,  # 33 SRHS_Coeff
    1.9202021922984807,  # 34 SRHS_Cut2
    1.9156408488476895,  # 35 SRHS_Cut3
    1.8475288976708932,  # 36 SRHS_Cut4
])
404728.47013725823
'''

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29,30,31,32,33,34,35,36])
#which_indices = np.array([29,30,31,32,33,34,35,36])
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15])
#which_indices = np.array([17,19,20,21])
#which_indices = np.array([26,27,28])

'''
These parameters turn off HealthAge4. From the LL, it looks like the restricted
model fails a LR test, but the stderrs on HealthAge coefficients are large in
the other specification due to covariance.

# 417624.0859024444
current_param_vec = np.array([ 
    2.391660673522014,  # 0 Mort0
    0.0,  # 1 MortSex
    1.508017209383774,  # 2 MortHealth1
    -0.026129723280316406,  # 3 MortHealth2
    -1.1931082734602747,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.6827916941117042,  # 6 MortAge1
    1.0759867734309712,  # 7 MortAge2
    -23.98556788401005,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -4.560479309984304,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.744722185782921,  # 12 Corr0
    8.825640699696706,  # 13 CorrAge1
    -42.2256488976443,  # 14 CorrAge2
    97.21854164369162,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    12.346022926870647,  # 17 Health0
    0.0,  # 18 HealthSex
    -5.979056107624555,  # 19 HealthAge1
    3.4672696242810064,  # 20 HealthAge2
    -1.2102367204226683,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    10.752547959190123,  # 24 xInitMean
    3.6285854936713884,  # 25 xInitStd
    -1.3166190625443566,  # 26 HealthShockAvg1
    1.2293385468646452,  # 27 HealthShockLogStd1
    -2.834452196562902,  # 28 HealthShockLogit1
    -0.7262881006327067,  # 29 SRHSlogStd1
    0.679756429201945,  # 30 SRHSlogStd2
    0.06261525780249395,  # 31 TypeLogit1
    -1.5554720076625022,  # 32 TypeLogit2
    0.43601676223587055,  # 33 SRHS_Coeff
    1.9494794412271235,  # 34 SRHS_Cut2
    1.954871626724684,  # 35 SRHS_Cut3
    1.9490913926584448,  # 36 SRHS_Cut4
]) 
'''
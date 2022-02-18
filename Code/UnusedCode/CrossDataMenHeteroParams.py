'''
Load parameters for estimating the model men across datasets, treating a period as a year.
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
sex_list = [1]    # Only men in this dataset
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
    2.1303431007634974,  # 0 Mort0
    0.0,  # 1 MortSex
    1.2439573192488271,  # 2 MortHealth1
    0.5529937447734173,  # 3 MortHealth2
    -1.702424776764205,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.21348641632584353,  # 6 MortAge1
    -2.167430199531783,  # 7 MortAge2
    -14.438029126485032,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -2.988713465842799,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.606188704832221,  # 12 Corr0
    8.095794192576866,  # 13 CorrAge1
    -33.811150025186095,  # 14 CorrAge2
    84.18012676693421,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.398540297001855,  # 17 Health0
    0.0,  # 18 HealthSex
    -0.2662257362247007,  # 19 HealthAge1
    -4.5429374881373965,  # 20 HealthAge2
    4.909005522405505,  # 21 HealthAge3
    -2.195453641951934,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    11.96045278601929,  # 24 xInitMean
    3.630852286251507,  # 25 xInitStd
    -1.4292922417167582,  # 26 HealthShockAvg1
    1.1819958330555624,  # 27 HealthShockLogStd1
    -2.6705329883072513,  # 28 HealthShockLogit1
    -0.7250296407170483,  # 29 SRHSlogStd1
    0.7104869547876863,  # 30 SRHSlogStd2
    0.006445503872571852,  # 31 TypeLogit1
    -1.6155589459642998,  # 32 TypeLogit2
    0.41536217844770384,  # 33 SRHS_Coeff
    1.8827000852621192,  # 34 SRHS_Cut2
    1.872545712820183,  # 35 SRHS_Cut3
    1.7501673319978799,  # 36 SRHS_Cut4
]) 
# 359534.0638965875

'''
# These are copy-pasted from the all respondent estimated parameters
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
# 359668.90724763554
'''


which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29,30,31,32,33,34,35,36])
#which_indices = np.array([29,30,31,32,33,34,35,36])
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15])
#which_indices = np.array([17,19,20,21])
#which_indices = np.array([26,27,28])

'''
Load parameters for estimating the model only on men over 23 from the PSID,
treating each period as a year. This version has three reporting types and no
mixed normal health shocks
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
data_file = '../Data/Estimation/PSIDallAnnual.txt'
source_name = 'PSID' # Name of dataset
figure_label = 'PSIDover23a' # Text string to use as prefix for figure filenames
sex_list = [1]    # Only men in this dataset
T_max = 21        # Maximum number of periods for each individual
weight_col = 1    # Column of the data with observation weight
age_col = 3       # Column of the data with age
sex_col = 2       # Column of the data with male dummy
data_init_col = 4 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 23.0    # Minimum age in the data
age_max = 110.0   # Maximum age in the data
age_incr = 1.0    # Age increment in years
wave_length = 2   # Number of periods between actual data collection waves
report_type_count = 3       # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = False # Whether health shocks are a mixed normal

# Define a test parameter vector
current_param_vec = np.array([ 
    2.2772535091062918,  # 0 Mort0
    0.0,  # 1 MortSex
    0.8793322540639562,  # 2 MortHealth1
    0.1800573567699188,  # 3 MortHealth2
    -0.6672702057378348,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.9943001915207157,  # 6 MortAge1
    -0.7838556755112284,  # 7 MortAge2
    -16.89971862843597,  # 8 MortAge3
    0.0,  # 9 MortAge4
    0.07122749174678841,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    3.0898633504585846,  # 12 Corr0
    8.862488378402125,  # 13 CorrAge1
    -24.172671348003295,  # 14 CorrAge2
    0.0,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    13.453949309278412,  # 17 Health0
    0.0,  # 18 HealthSex
    -8.391166544123491,  # 19 HealthAge1
    1.1775862155277204,  # 20 HealthAge2
    0.0,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    13.043480097496179,  # 24 xInitMean
    4.362243078474615,  # 25 xInitStd
    -1.0177887069654128,  # 26 SRHSlogStd1
    -0.10797106859642894,  # 27 SRHSlogStd2
    0.7637615470230444,  # 28 TypeLogit1
    1.365362561878282,  # 29 TypeLogit2
    0.32778838613021366,  # 30 SRHS_Coeff
    1.5253325001407556,  # 31 SRHS_Cut2
    1.6733364578158079,  # 32 SRHS_Cut3
    1.6908732663409631,  # 33 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,17,19,20,24,25,26,27,28,29,30,31,32,33]) 
#which_indices = np.array([26,27,28,29])

# 73377.4763427672
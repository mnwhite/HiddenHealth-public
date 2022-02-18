'''
Load parameters for estimating the model only on women over 50 from the HRS,
treating each period as a year.  This version has three reporting types and no
mixed normal reporting errors.
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
data_file = '../Data/Estimation/HRSallAnnual.txt'
source_name = 'HRS' # Name of dataset
figure_label = 'HRSover50a' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 21        # Maximum number of periods for each individual
weight_col = 1    # Column of the data with observation weight
age_col = 3       # Column of the data with age
sex_col = 2       # Column of the data with male dummy
data_init_col = 4 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 50.0    # Minimum age in the data
age_max = 115.0   # Maximum age in the data
age_incr = 1.0    # Age increment in years
wave_length = 2   # Number of periods between actual data collection waves
report_type_count = 3 # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = False # Whether health shocks are a mixed normal

# Define a test parameter vector
current_param_vec = np.array([ 
    2.4585244288945667,  # 0 Mort0
    0.0,  # 1 MortSex
    0.8388198904604174,  # 2 MortHealth1
    -0.25442561893838245,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -5.932326663307013,  # 6 MortAge1
    27.955089343257026,  # 7 MortAge2
    -150.3012076233978,  # 8 MortAge3
    0.0,  # 9 MortAge4
    1.0265717811025419,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    3.831975870913636,  # 12 Corr0
    -0.377795120442459,  # 13 CorrAge1
    0.0,  # 14 CorrAge2
    0.0,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    1.5220134055234438,  # 17 Health0
    0.0,  # 18 HealthSex
    5.602281750436323,  # 19 HealthAge1
    -9.058940281654813,  # 20 HealthAge2
    3.949717808133078,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    9.482707585377772,  # 24 xInitMean
    5.47180544251537,  # 25 xInitStd
    -0.9927585553405528,  # 26 SRHSlogStd1
    0.6335906635312402,  # 27 SRHSlogStd2
    -0.40119763098337474,  # 28 TypeLogit1
    -1.3923843027774514,  # 29 TypeLogit2
    0.3532530870363979,  # 30 SRHS_Coeff
    1.6042937334584173,  # 31 SRHS_Cut2
    1.6295163106541115,  # 32 SRHS_Cut3
    1.9845398288782996,  # 33 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,6,7,8,10,12,13,17,19,20,21,24,25,26,27,28,29,30,31,32,33]) 
#which_indices = np.array([26,27,28,29,30,31,32,33,34,35,36])
#which_indices = np.array([0,2,3])
#which_indices = np.array([17,19,20,21])

# 129793.70346047575
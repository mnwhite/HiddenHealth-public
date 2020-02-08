'''
Load parameters for estimating the model only on women in the MEPS, using both
physical and mental categorical health.
'''
import numpy as np
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -5.
x_max = 20.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/MEPSallPhysAndMent.txt'
source_name = 'MEPS' # Name of dataset
figure_label = 'MEPSphysAndMent' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 5         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 2 # Number of measures in data per period
category_counts = [5,5] # Number of categorical responses for each measure (list)
measure_names = ['SRHS','Mntl'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 87.0    # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.89233435967,  # 0 Mort0
    0.0,  # 1 MortSex
    1.82786772957,  # 2 MortHealth1
    -0.125672774204,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    1.69622915896,  # 6 MortAge1
    -21.8811292156,  # 7 MortAge2
    -0.570009739562,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -0.844234265927,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    1.30339865641,  # 12 Corr0
    5.10141597112,  # 13 CorrAge1
    -56.6053187915,  # 14 CorrAge2
    126.423545885,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    -0.723434385852,  # 17 Health0
    0.0,  # 18 HealthSex
    7.33611914817,  # 19 HealthAge1
    -27.5121427899,  # 20 HealthAge2
    40.4567813434,  # 21 HealthAge3
    -20.979105077,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    6.87463828273,  # 24 xInitMean
    2.61496812415,  # 25 xInitStd
    0.937810562824,  # 26 Mntl_Const
    0.645619784957,  # 27 SRHS_Coeff
    0.463961782565,  # 28 Mntl_Coeff
    1.55431190037,  # 29 SRHS_Cut2
    1.72065037317,  # 30 SRHS_Cut3
    1.64736269463,  # 31 SRHS_Cut4
    1.2387140333,  # 32 Mntl_Cut2
    1.58796241004,  # 33 Mntl_Cut3
    1.18138641397,  # 34 Mntl_Cut4
]) 

which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29,30,31,32,33,34])

# 1352100.132566
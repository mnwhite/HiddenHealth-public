'''
Load parameters for estimating the model only on men over 50 from the HRS,
treating each period as six months.
'''
import numpy as np
import os
file_name = os.path.basename(__file__)
dot_i = file_name.find('.')
param_file_name = file_name[:dot_i]
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -5.
x_max = 20.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/HRSallSemiannual.txt'
source_name = 'HRS' # Name of dataset
figure_label = 'HRSover50b' # Text string to use as prefix for figure filenames
sex_list = [1]    # Only men in this dataset
T_max = 41        # Maximum number of periods for each individual
weight_col = 1    # Column of the data with observation weight
age_col = 3       # Column of the data with age
sex_col = 2       # Column of the data with male dummy
data_init_col = 4 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 50.0    # Minimum age in the data
age_max = 115.0   # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 4   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.38263277659,  # 0 Mort0
    0.0,  # 1 MortSex
    1.36317242202,  # 2 MortHealth1
    -0.135153594655,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    31.314781575,  # 6 MortAge1
    -70.0715891571,  # 7 MortAge2
    24.117769553,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -0.383851788018,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    1.38013326143,  # 12 Corr0
    6.81470313878,  # 13 CorrAge1
    -68.9273384624,  # 14 CorrAge2
    116.254966033,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    0.649489435707,  # 17 Health0
    0.0,  # 18 HealthSex
    8.02652791605,  # 19 HealthAge1
    -30.8332686826,  # 20 HealthAge2
    45.3654471547,  # 21 HealthAge3
    -23.4938214654,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    8.81017749787,  # 24 xInitMean
    2.98485641541,  # 25 xInitStd
    0.50796043287,  # 26 SRHS_Coeff
    1.66414259758,  # 27 SRHS_Cut2
    1.76274256755,  # 28 SRHS_Cut3
    1.60813080814,  # 29 SRHS_Cut4
]) 

#which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29]) 
which_indices = np.array([0,2,3,6,7,8,10])

# 709546.780285
'''
Load parameters for estimating the model only on men over 23 from the PSID,
treating each period as a year.
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
x_count = 200

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

# Define a test parameter vector
current_param_vec = np.array([ 
    2.27859100764,  # 0 Mort0
    0.0,  # 1 MortSex
    0.983168673981,  # 2 MortHealth1
    0.394715119141,  # 3 MortHealth2
    -1.26660113474,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.997141542813,  # 6 MortAge1
    -0.811525355046,  # 7 MortAge2
    -16.8252375827,  # 8 MortAge3
    0.0,  # 9 MortAge4
    0.405673239636,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.98485867135,  # 12 Corr0
    7.2665962234,  # 13 CorrAge1
    -20.2740959735,  # 14 CorrAge2
    0.0,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.8335629828,  # 17 Health0
    0.0,  # 18 HealthSex
    -4.86478942,  # 19 HealthAge1
    0.539666326728,  # 20 HealthAge2
    0.0,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    11.4683193916,  # 24 xInitMean
    3.98217259132,  # 25 xInitStd
    0.41136756023,  # 26 SRHS_Coeff
    1.59703327611,  # 27 SRHS_Cut2
    1.86266878214,  # 28 SRHS_Cut3
    1.92331363067,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,17,19,20,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14])
#which_indices = np.array([17,19,20])
#which_indices = np.array([10])

# 74772.8093046
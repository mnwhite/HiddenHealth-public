'''
Load parameters for estimating the model only on women over 23 from the PSID,
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
data_file = '../Data/Estimation/PSIDallSemiannual.txt'
source_name = 'PSID' # Name of dataset
figure_label = 'PSIDover23b' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 41        # Maximum number of periods for each individual
weight_col = 1    # Column of the data with observation weight
age_col = 3       # Column of the data with age
sex_col = 2       # Column of the data with male dummy
data_init_col = 4 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 23.0    # Minimum age in the data
age_max = 110.0   # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 4   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    0.732712286477,  # 0 Mort0
    0.0,  # 1 MortSex
    1.38337996465,  # 2 MortHealth1
    -0.22680204847,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    59.1708871429,  # 6 MortAge1
    -65.8832895862,  # 7 MortAge2
    0.0,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -3.5073010806,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    4.38417657006,  # 12 Corr0
    -1.65025107398,  # 13 CorrAge1
    6.87033680755,  # 14 CorrAge2
    0.0,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    -185.956277657,  # 17 Health0
    0.0,  # 18 HealthSex
    82.3164841597,  # 19 HealthAge1
    -115.874019005,  # 20 HealthAge2
    52.0363483534,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    7.61531280144,  # 24 xInitMean
    4.92785545356,  # 25 xInitStd
    0.442218697285,  # 26 SRHS_Coeff
    1.73449164948,  # 27 SRHS_Cut2
    1.76790122203,  # 28 SRHS_Cut3
    2.06896335452,  # 29 SRHS_Cut4
]) 

#which_indices = np.array([0,2,3,6,7,10,12,13,14,17,19,20,21,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,6,7,10])
which_indices = np.array([12,13,14])
#which_indices = np.array([12,13,14,17,19,20,21,24,25])

# 91352.6371302
'''
Load in an age-restricted set of parameters for the MEPS.
'''
import numpy as np
import os
file_name = os.path.basename(__file__)
dot_i = file_name.find('.')
param_file_name = file_name[:dot_i]
eval_count = 0
from LoadAge import A

# Specify parameters for the grids
h_count = 5
x_min = -5.
x_max = 20.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/MEPSall.txt'
source_name = 'MEPS' # Name of dataset
figure_label = 'MEPSaboutAge' + str(int(A)) # Text string to use as prefix for figure filenames
sex_list = [0,1] # Both sexes in these files
T_max = 5         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = A-0.0   # Minimum age in the data
age_max = A+2.5   # Maximum age in the data
age_incr = 0.5    # Age increment
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    3.0,             # 0 Mort0
    0.0,             # 1 MortSex
    0.0,             # 2 MortHealth1
    0.0,             # 3 MortHealth2
    0.0,             # 4 MortHealth3
    0.0,             # 5 MortHealth4
    0.0,             # 6 MortAge1
    0.0,             # 7 MortAge2
    0.0,             # 8 MortAge3
    0.0,             # 9 MortAge4
    0.0,             # 10 MortHealthAge
    0.0,             # 11 MortSexAge
    2.3,             # 12 Corr0
    0.0,             # 13 CorrAge1
    0.0,             # 14 CorrAge2
    0.0,             # 15 CorrAge3
    0.0,             # 16 CorrAge4
    8.0,             # 17 Health0
    0.0,             # 18 HealthSex
    0.0,             # 19 HealthAge1
    0.0,             # 20 HealthAge2
    0.0,             # 21 HealthAge3
    0.0,             # 22 HealthAge4
    0.0,             # 23 HealthAgeSex
    1.9,             # 24 ErrorMag
    8.1,             # 25 xInitMean
    2.9,             # 26 xInitStd
    3.0,             # 27 Cut2
    3.0,             # 28 Cut3
    3.0,             # 29 Cut4
])

which_indices = np.array([0,12,17,24,25,26,27,28,29])

# 1802492.70332
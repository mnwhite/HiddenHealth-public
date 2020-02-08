'''
Load parameters for estimating the model only on women over 23 from the PSID,
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
sex_list = [0]    # Only women in this dataset
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
    2.62232046148,  # 0 Mort0
    0.0,  # 1 MortSex
    1.38017733104,  # 2 MortHealth1
    -0.24081260277,  # 3 MortHealth2
    -0.832343250628,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -3.11858864103,  # 6 MortAge1
    13.5819051221,  # 7 MortAge2
    -57.0533267937,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -2.58717725014,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    3.13695528573,  # 12 Corr0
    5.28995925539,  # 13 CorrAge1
    -20.6952192202,  # 14 CorrAge2
    38.3876117431,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.5432808279,  # 17 Health0
    0.0,  # 18 HealthSex
    -6.22471909603,  # 19 HealthAge1
    3.70378431556,  # 20 HealthAge2
    -1.41888459928,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    10.5151295771,  # 24 xInitMean
    3.75074827732,  # 25 xInitStd
    0.437535379951,  # 26 SRHS_Coeff
    1.66699237988,  # 27 SRHS_Cut2
    1.96286985971,  # 28 SRHS_Cut3
    2.05434855578,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15,17,19,20,21,24,25])
#which_indices = np.array([17,19,20,21])

# 87903.2690315
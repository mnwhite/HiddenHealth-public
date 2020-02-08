'''
Load parameters for estimating the model on men across datasets, treating a period as a year.
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
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.33781186461,  # 0 Mort0
    0.0,  # 1 MortSex
    1.00523016393,  # 2 MortHealth1
    1.05714318272,  # 3 MortHealth2
    -2.59715695332,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -1.09726603514,  # 6 MortAge1
    0.140970231064,  # 7 MortAge2
    -17.5166151331,  # 8 MortAge3
    0.0,  # 9 MortAge4
    0.487630496308,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.6782939312,  # 12 Corr0
    7.05964060737,  # 13 CorrAge1
    -32.2487280145,  # 14 CorrAge2
    72.6330851846,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.1895582595,  # 17 Health0
    0.0,  # 18 HealthSex
    -2.01819515709,  # 19 HealthAge1
    -0.9549792391,  # 20 HealthAge2
    1.68077650143,  # 21 HealthAge3
    -0.850727531583,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    11.22033445,  # 24 xInitMean
    3.74261790922,  # 25 xInitStd
    0.439580362481,  # 26 SRHS_Coeff
    1.68217975819,  # 27 SRHS_Cut2
    1.8972059014,  # 28 SRHS_Cut3
    1.96935055959,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([17,19,20,21,22,24,25])

# 333314.654105
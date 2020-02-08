'''
Load parameters for estimating the model women across datasets, treating a period as a year.
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
sex_list = [0]    # Only women in this dataset
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
    2.79341000958,  # 0 Mort0
    0.0,  # 1 MortSex
    1.27048679332,  # 2 MortHealth1
    0.584887552041,  # 3 MortHealth2
    -2.17392266834,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -3.21052878334,  # 6 MortAge1
    10.8327505481,  # 7 MortAge2
    -42.1206620384,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -1.8130928845,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.62163605483,  # 12 Corr0
    9.27558323609,  # 13 CorrAge1
    -50.3209973309,  # 14 CorrAge2
    120.757782047,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.8115302124,  # 17 Health0
    0.0,  # 18 HealthSex
    -3.41270360772,  # 19 HealthAge1
    0.600906738014,  # 20 HealthAge2
    0.773201355296,  # 21 HealthAge3
    -0.553779608667,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    9.99461016415,  # 24 xInitMean
    3.60668440901,  # 25 xInitStd
    0.472119650325,  # 26 SRHS_Coeff
    1.80230794892,  # 27 SRHS_Cut2
    1.99955904225,  # 28 SRHS_Cut3
    2.15235914351,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15])
#which_indices = np.array([17,19,20,21,22])
#which_indices = np.array([24,25])

# 401410.992722
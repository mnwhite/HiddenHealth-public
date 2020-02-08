'''
Load parameters for estimating the model only on men in the MEPS, using both
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
sex_list = [1]    # Only men in this dataset
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
    1.76755307187,  # 0 Mort0
    0.0,  # 1 MortSex
    0.702364030155,  # 2 MortHealth1
    -0.0312713550499,# 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    64.6721449935,  # 6 MortAge1
    -135.532689751, # 7 MortAge2
    62.0765435788,  # 8 MortAge3
    0.0,  # 9 MortAge4
    9.02738709318,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.13171263906,  # 12 Corr0
    1.03359964123,  # 13 CorrAge1
    48.2230230566,  # 14 CorrAge2
    -584.228032112, # 15 CorrAge3
    0.0,  # 16 CorrAge4
    -1.92561833188, # 17 Health0
    0.0,  # 18 HealthSex
    10.7055538341,  # 19 HealthAge1
    -39.1407945496, # 20 HealthAge2
    55.7070187444,  # 21 HealthAge3
    -28.2317410175, # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    9.3143248354,   # 24 xInitMean
    2.87151451341,  # 25 xInitStd
    0.767384583225, # 26 Mntl_Const
    0.51115313685,  # 27 SRHS_Coeff
    0.378553327159, # 28 Mntl_Coeff
    1.57928494832,  # 29 SRHS_Cut2
    1.76327391370,  # 30 SRHS_Cut3
    1.54434733723,  # 31 SRHS_Cut4
    1.17628211883,  # 32 Mntl_Cut2
    1.60947761655,  # 33 Mntl_Cut3
    1.17181571636,  # 34 Mntl_Cut4
])

# Still need to do full estimation on this
which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29,30,31,32,33,34])

# 1135102.89705
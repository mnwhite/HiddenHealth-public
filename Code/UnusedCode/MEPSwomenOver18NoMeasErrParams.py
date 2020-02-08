'''
Load parameters for estimating the model only on women in the MEPS, with effectively
no measurement error associated with SRHS.
'''
import numpy as np
import os
file_name = os.path.basename(__file__)
dot_i = file_name.find('.')
param_file_name = file_name[:dot_i]
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -8.
x_max = 23.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/MEPSall.txt'
source_name = 'MEPS' # Name of dataset
figure_label = 'MEPSover18' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 5         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 87.0    # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 1   # Number of periods between actual data collection waves

# ESTIMATED PARAMETERS FOR T_max=2, FITTING ONLY 1 PERIOD TRANSITIONS
#current_param_vec = np.array([ 
#    3.02094216953,  # 0 Mort0
#    0.0,  # 1 MortSex
#    2.72819251388,  # 2 MortHealth1
#    -4.28856787311,  # 3 MortHealth2
#    0.0,  # 4 MortHealth3
#    0.0,  # 5 MortHealth4
#    -2.77223939446,  # 6 MortAge1
#    -7.57586845785,  # 7 MortAge2
#    -11.813334073,  # 8 MortAge3
#    0.0,  # 9 MortAge4
#    21.6616134378,  # 10 MortHealthAge
#    0.0,  # 11 MortSexAge
#    0.000395076070632,  # 12 Corr0
#    0.878475599889,  # 13 CorrAge1
#    58.5041779438,  # 14 CorrAge2
#    -716.322080472,  # 15 CorrAge3
#    0.0,  # 16 CorrAge4
#    3.35131880619,  # 17 Health0
#    0.0,  # 18 HealthSex
#    -0.161300569245,  # 19 HealthAge1
#    -0.0400385686701,  # 20 HealthAge2
#    0.0663574685289,  # 21 HealthAge3
#    -0.0422170805504,  # 22 HealthAge4
#    0.0,  # 23 HealthAgeSex
#    3.4167723331,  # 24 xInitMean
#    1.49424861268,  # 25 xInitStd
#    50.0,  # 26 SRHS_Coeff
#    58.8698543027,  # 27 SRHS_Cut2
#    61.3548947781,  # 28 SRHS_Cut3
#    54.7918468333,  # 29 SRHS_Cut4
#])

# 315473.592232

# ESTIMATED PARAMETERS FOR T_max=5, TRYING TO FIT FULL DATASET
current_param_vec = np.array([ 
    2.91817616546,  # 0 Mort0
    0.0,  # 1 MortSex
    3.81956775032,  # 2 MortHealth1
    -3.09798494141,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    7.25351450703,  # 6 MortAge1
    -28.0166391032,  # 7 MortAge2
    1.20121504,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -2.70119532421,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    0.17810821989,  # 12 Corr0
    0.878901301895,  # 13 CorrAge1
    57.0802023041,  # 14 CorrAge2
    -701.072205965,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    3.72692490371,  # 17 Health0
    0.0,  # 18 HealthSex
    -0.262292852098,  # 19 HealthAge1
    0.0400660312685,  # 20 HealthAge2
    0.213016329636,  # 21 HealthAge3
    -0.225506348139,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    3.56278924518,  # 24 xInitMean
    1.47786533671,  # 25 xInitStd
    50.0,  # 26 SRHS_Coeff
    59.5321073682,  # 27 SRHS_Cut2
    62.9347288766,  # 28 SRHS_Cut3
    62.5849904164,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,27,28,29]) 
#which_indices = np.array([0,2,3,6,7,8,10])
#which_indices = np.array([17,19,20,21,22])
#which_indices = np.array([12,13,14,15])
#which_indices = np.array([0,6,12,13,14,15,17,19,20,21,24,5,27,28,29])
#which_indices = np.array([27,28,29])

# 715953.628172
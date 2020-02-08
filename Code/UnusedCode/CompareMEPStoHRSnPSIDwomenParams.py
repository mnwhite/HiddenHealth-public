'''
Load parameters for testing the model estimated on MEPS women vs longer run data
from the HRS and PSID.
'''
import numpy as np
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -8.
x_max = 23.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/CrossStudyData.txt'
source_name = 'HRS and PSID' # Name of dataset
figure_label = 'ModelTest' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 41         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 110.0    # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.52694070277,  # 0 Mort0
    0.0,  # 1 MortSex
    1.38795430119,  # 2 MortHealth1
    -0.143800216165,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    17.1927799358,  # 6 MortAge1
    -38.8921260865,  # 7 MortAge2
    4.59378273249,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -0.71322222151,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    1.31875161566,  # 12 Corr0
    7.95303712377,  # 13 CorrAge1
    -98.291601301,  # 14 CorrAge2
    328.048898056,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    1.19577786258,  # 17 Health0
    0.0,  # 18 HealthSex
    7.61912249685,  # 19 HealthAge1
    -28.891153728,  # 20 HealthAge2
    42.4460093801,  # 21 HealthAge3
    -22.186688017,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    9.02812911869,  # 24 xInitMean
    3.14145412844,  # 25 xInitStd
    0.511546047557,  # 26 SRHS_Coeff
    1.60175497905,  # 27 SRHS_Cut2
    1.79948622392,  # 28 SRHS_Cut3
    1.73810590583,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,6,7,8,10])
#which_indices = np.array([17,19,20,21,22,24,25])

# 677516.711430
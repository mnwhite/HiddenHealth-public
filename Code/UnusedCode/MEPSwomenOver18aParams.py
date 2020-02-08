'''
Load parameters for estimating the model only on women in the MEPS, using only
the observations of "general health" from waves 2 and 4, treating a period as a year.
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
data_file = '../Data/Estimation/MEPSshort.txt'
source_name = 'MEPSalt' # Name of dataset
figure_label = 'MEPSover18a' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 2         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 1 # Number of measures in data per period
category_counts = [5]  # Number of categorical responses for each measure (list)
measure_names = ['SRHS'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 87.0    # Maximum age in the data
age_incr = 1.0    # Age increment in years
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.71307934718,  # 0 Mort0
    0.0,  # 1 MortSex
    1.38795430119,  # 2 MortHealth1
    -0.28760043233,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    0.363813022626,  # 6 MortAge1
    -7.28229668219,  # 7 MortAge2
    2.75626963949,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -0.71322222151,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.45096532146,  # 12 Corr0
    4.73340300584,  # 13 CorrAge1
    -16.1153921612,  # 14 CorrAge2
    19.6829338834,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    7.79200883996,  # 17 Health0
    0.0,  # 18 HealthSex
    0.826488208455,  # 19 HealthAge1
    -2.05668016265,  # 20 HealthAge2
    1.58829564047,  # 21 HealthAge3
    -0.532480512408,  # 22 HealthAge4
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

# 166051.989192
'''
Load parameters for estimating the model only on women over 23 from the PSID,
treating each period as a year.  This version has three reporting types and no
mixed normal health shocks.
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
x_count = 360

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
report_type_count = 3 # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = False # Whether health shocks are a mixed normal

# Define a test parameter vector
current_param_vec = np.array([ 
    2.6172403796505823,  # 0 Mort0
    0.0,  # 1 MortSex
    1.2931794283898348,  # 2 MortHealth1
    -0.4161130425772286,  # 3 MortHealth2
    -0.31731062490832923,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -3.1941565954531748,  # 6 MortAge1
    14.13810770694898,  # 7 MortAge2
    -58.39712403526839,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -2.7713199262728643,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    3.4283012142725613,  # 12 Corr0
    5.179607835338121,  # 13 CorrAge1
    -18.526424101089546,  # 14 CorrAge2
    36.44369062098251,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    12.411987186103392,  # 17 Health0
    0.0,  # 18 HealthSex
    -9.862649222043512,  # 19 HealthAge1
    6.538960981996564,  # 20 HealthAge2
    -2.682550777384591,  # 21 HealthAge3
    0.0,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    12.15668920053159,  # 24 xInitMean
    4.186589421802998,  # 25 xInitStd
    -0.9145824417217349,  # 26 SRHSlogStd1
    0.011483806969730826,  # 27 SRHSlogStd2
    1.240890167528807,  # 28 TypeLogit1
    1.5210716235725328,  # 29 TypeLogit2
    0.34430511506619005,  # 30 SRHS_Coeff
    1.551441062223261,  # 31 SRHS_Cut2
    1.7797408860222277,  # 32 SRHS_Cut3
    1.8289627743258694,  # 33 SRHS_Cut4
]) 

# 86244.16873

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,24,25,26,27,28,29,30,31,32,33])
#which_indices = np.array([26,27,28])
#which_indices = np.array([12,13,14,15,17,19,20,21,24,25])
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15])

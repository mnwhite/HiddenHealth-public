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
wave_length = 2   # Number of periods between actual data collection waves
report_type_count = 1       # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = False # Whether health shocks are a mixed normal

# Define a test parameter vector
current_param_vec = np.array([ 
    2.337374797928915,  # 0 Mort0
    0.0,  # 1 MortSex
    1.0054885807486904,  # 2 MortHealth1
    1.050412662861607,  # 3 MortHealth2
    -2.584318406333606,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -1.0927301584972815,  # 6 MortAge1
    0.10737846557087277,  # 7 MortAge2
    -17.41865926980724,  # 8 MortAge3
    0.0,  # 9 MortAge4
    0.4848456237133539,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    2.6661229091038003,  # 12 Corr0
    7.277716134321006,  # 13 CorrAge1
    -33.8597588617799,  # 14 CorrAge2
    77.89698854478414,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    10.00217124384382,  # 17 Health0
    0.0,  # 18 HealthSex
    -1.4791794093832162,  # 19 HealthAge1
    -1.7246737705418382,  # 20 HealthAge2
    2.267235698245025,  # 21 HealthAge3
    -1.0458529396277154,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    11.271375981626685,  # 24 xInitMean
    3.7595960268059327,  # 25 xInitStd
    0.4386810042825071,  # 26 SRHS_Coeff
    1.681775475265532,  # 27 SRHS_Cut2
    1.896562484312285,  # 28 SRHS_Cut3
    1.968532305048764,  # 29 SRHS_Cut4
]) 

which_indices = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29]) 
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([17,19,20,21,22,24,25])

# 333314.4257228136
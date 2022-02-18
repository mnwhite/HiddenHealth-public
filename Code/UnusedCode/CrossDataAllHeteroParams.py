'''
Load parameters for estimating the model on all respondents across datasets,
treating a period as a year. This version has three reporting types and mixed
normal health shocks.
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
data_file = '../Data/Estimation/CrossStudyDataAlt.txt'
source_name = 'mixed data' # Name of dataset
figure_label = 'CrossData' # Text string to use as prefix for figure filenames
sex_list = [0,1]  # All respondents
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
report_type_count = 3 # Number of discrete types whose SRHS report variance differs
mixed_health_shocks = True # Whether the health shock distribution is a mixed normal

# Define a test parameter vector
current_param_vec = np.array([ 
    2.4691974533791803,  # 0 Mort0
    -0.24520316380360577,  # 1 MortSex
    1.3858708009993073,  # 2 MortHealth1
    -0.496365535873828,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    -0.3679136066954327,  # 6 MortAge1
    -1.8933240243310805,  # 7 MortAge2
    -16.133676470580607,  # 8 MortAge3
    0.0,  # 9 MortAge4
    -2.985617581892837,  # 10 MortHealthAge
    0.6556063876553321,  # 11 MortSexAge
    2.419043589533038,  # 12 Corr0
    11.612996586226886,  # 13 CorrAge1
    -59.061155229386706,  # 14 CorrAge2
    147.8719538291541,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    9.931777757443047,  # 17 Health0
    1.1401232038505345,  # 18 HealthSex
    -1.1873463930829893,  # 19 HealthAge1
    -2.7454023665429723,  # 20 HealthAge2
    3.3239462167780993,  # 21 HealthAge3
    -1.4737572625851936,  # 22 HealthAge4
    -52.91840872620989,  # 23 HealthAgeSex
    11.133443196913396,  # 24 xInitMean
    3.7697850899828076,  # 25 xInitStd
    -1.5479815826919654,  # 26 HealthShockAvg1
    1.2213944494539586,  # 27 HealthShockLogStd1
    -2.849332106001553,  # 28 HealthShockLogit1
    -0.724379792423187,  # 29 SRHSlogStd1
    0.7116727280055377,  # 30 SRHSlogStd2
    0.03918006546900993,  # 31 TypeLogit1
    -1.6819630668936343,  # 32 TypeLogit2
    0.43455481967418125,  # 33 SRHS_Coeff
    1.8979128112436543,  # 34 SRHS_Cut2
    1.8869203952032325,  # 35 SRHS_Cut3
    1.8628827152539127,  # 36 SRHS_Cut4
]) 

# 817163.9504416855
# 817186.2577950978
# 817182.2765977526
# 817182.2745209186
# 817182.2697536206


which_indices = np.array([0,1,2,3,6,7,8,10,11,12,13,14,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36])
#which_indices = np.array([29,30,31,32,33,34,35,36])
#which_indices = np.array([0,2,3,4,6,7,8,10])
#which_indices = np.array([12,13,14,15])
#which_indices = np.array([17,19,20,21])
#which_indices = np.array([0,1,2,3])

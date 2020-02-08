'''
Load parameters for estimating the model on everyone in the MEPS, using both
categorical physical and mental health.
'''
import numpy as np
file_name = os.path.basename(__file__)
dot_i = file_name.find('.')
param_file_name = file_name[:dot_i]
eval_count = 0

# Specify parameters for the grids
x_min = -5.
x_max = 15.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/MEPSallPhysAndMent.txt'
source_name = 'MEPS' # Name of dataset
figure_label = 'MEPSover18physAndMent' # Text string to use as prefix for figure filenames
sex_list = [0,1]  # Both sexes in this dataset
T_max = 5         # Maximum number of periods for each individual
weight_col = 2    # Column of the data with observation weight
age_col = 4       # Column of the data with age
sex_col = 3       # Column of the data with male dummy
data_init_col = 5 # Column where data starts
measure_count = 2 # Number of measures in data per period
category_counts = [5,5] # Number of categorical responses for each measure (list)
measure_names = ['SRHS','Mntl'] # Abbreviation for each measure in data (list)
age_min = 0.0     # Minimum age in the data
age_max = 87.0    # Maximum age in the data
age_incr = 0.5    # Age increment in years

# Define a test parameter vector
current_param_vec = np.array([ 
    2.96376593324,   # 0 Mort0
    -0.250471183998, # 1 MortSex
    1.28447195815,   # 2 MortHealth1
    2.83238815858,   # 3 MortHealth2
    -5.61906483369,  # 4 MortHealth3
    2.42687970806,   # 5 MortHealth4
    -12.9337390469,  # 6 MortAge1
    31.6385229285,   # 7 MortAge2
    -78.7500080508,  # 8 MortAge3
    36.6599275722,   # 9 MortAge4
    4.18523213203,   # 10 MortHealthAge
    2.03076232378,   # 11 MortSexAge
    2.3666690103,    # 12 Corr0
    1.47214759337,   # 13 CorrAge1
    -4.14151646688,  # 14 CorrAge2
    0.0,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    9.07681741791,   # 17 Health0
    0.307341274241,  # 18 HealthSex
    -0.0689587095645,# 19 HealthAge1
    -4.76804578726,  # 20 HealthAge2
    10.8443070999,   # 21 HealthAge3
    -7.60447124276,  # 22 HealthAge4
    1.15563793599,   # 23 HealthAgeSex
    9.57286223976,   # 24 xInitMean
    2.91228520523,   # 25 xInitStd
    0.663551018115,  # 26 Mntl_Const
    0.52636630121,   # 27 SRHS_Coeff
    0.40232966925,   # 28 Mntl_Coeff
    1.60680175578,   # 29 SRHS_Cut2
    1.77556843433,   # 30 SRHS_Cut3
    1.49500348258,   # 31 SRHS_Cut4
    1.20105578106,   # 32 Mntl_Cut2
    1.62946883517,   # 33 Mntl_Cut3
    1.18657249758,   # 34 Mntl_Cut4
]) 

# Still need to do full estimation run on this
which_indices = np.array([0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34])

# 3383871.97053
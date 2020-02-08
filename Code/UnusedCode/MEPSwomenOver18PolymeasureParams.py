'''
Load parameters for estimating the model only on women, using many measures of health.
'''
import numpy as np
eval_count = 0

# Specify parameters for the continuous state grid
x_min = -5.
x_max = 20.
x_count = 150

# Define parameters for loading in the data file
data_file = '../Data/Estimation/MEPSallPolymeasure.txt'
source_name = 'MEPS' # Name of dataset
figure_label = 'MEPSpolymeasure' # Text string to use as prefix for figure filenames
sex_list = [0]    # Only women in this dataset
T_max = 5         # Maximum number of periods for each individual
age_col = 3       # Column of the data with age
sex_col = 2       # Column of the data with male dummy
data_init_col = 4 # Column where data starts
measure_count = 27 # Number of measures in data per period
category_counts = [5,5,2,5,3,3,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,4,4,5,5,5,5] # Number of categorical responses for each measure (list)
measure_names = ['phys','ment','actlim','genh','climb','modact','acclessP','worklimP','acclessM','worklimM','pain','calm','energy','down','social','nervous','hopeless','restless','sosad','effort','worthless','interest','depress','dontneed','notworth','takerisk','overcome'] # Abbreviation for each measure in data (list)
age_min = 18.0    # Minimum age in the data
age_max = 87.0    # Maximum age in the data
age_incr = 0.5    # Age increment in years
wave_length = 1   # Number of periods between actual data collection waves

# Define a test parameter vector
current_param_vec = np.array([ 
    2.18844121042,  # 0 Mort0
    0.0,  # 1 MortSex
    0.375246184258,  # 2 MortHealth1
    -1.03292275756,  # 3 MortHealth2
    0.0,  # 4 MortHealth3
    0.0,  # 5 MortHealth4
    96.1174166652,  # 6 MortAge1
    -246.011634005,  # 7 MortAge2
    144.122483103,  # 8 MortAge3
    0.0,  # 9 MortAge4
    30.0640849981,  # 10 MortHealthAge
    0.0,  # 11 MortSexAge
    0.844529681287,  # 12 Corr0
    6.09672920155,  # 13 CorrAge1
    -62.5266116881,  # 14 CorrAge2
    103.922457011,  # 15 CorrAge3
    0.0,  # 16 CorrAge4
    9.021329311,  # 17 Health0
    0.0,  # 18 HealthSex
    -2.09055627789,  # 19 HealthAge1
    4.3310129191,  # 20 HealthAge2
    -4.07277047582,  # 21 HealthAge3
    0.972984389826,  # 22 HealthAge4
    0.0,  # 23 HealthAgeSex
    6.43849074087,  # 24 xInitMean
    2.49281535868,  # 25 xInitStd
    0.784697571513,  # 26 ment_Const
    -0.51877827539,  # 27 actlim_Const
    0.224520047342,  # 28 genh_Const
    -0.497549260838,  # 29 climb_Const
    -0.360538938452,  # 30 modact_Const
    0.318541758844,  # 31 acclessP_Const
    0.077182730293,  # 32 worklimP_Const
    0.751784276198,  # 33 acclessM_Const
    0.771907870639,  # 34 worklimM_Const
    0.385362003466,  # 35 pain_Const
    0.899434046275,  # 36 calm_Const
    0.381582252901,  # 37 energy_Const
    1.01153329288,  # 38 down_Const
    0.490280581612,  # 39 social_Const
    1.18713042135,  # 40 nervous_Const
    1.05394001511,  # 41 hopeless_Const
    0.952063394958,  # 42 restless_Const
    1.16308727107,  # 43 sosad_Const
    0.508825841625,  # 44 effort_Const
    1.00196357241,  # 45 worthless_Const
    0.288532744246,  # 46 interest_Const
    0.380717670933,  # 47 depress_Const
    -1.11059146978,  # 48 dontneed_Const
    0.0704593695924,  # 49 notworth_Const
    0.0349878271694,  # 50 takerisk_Const
    -0.447239455892,  # 51 overcome_Const
    0.504279371503,  # 52 phys_Coeff
    0.495241777232,  # 53 ment_Coeff
    0.461252916038,  # 54 actlim_Coeff
    0.615083522731,  # 55 genh_Coeff
    0.401985346749,  # 56 climb_Coeff
    0.41830988004,  # 57 modact_Coeff
    0.391720608302,  # 58 acclessP_Coeff
    0.505972199696,  # 59 worklimP_Coeff
    0.342185716251,  # 60 acclessM_Coeff
    0.379350710436,  # 61 worklimM_Coeff
    0.4292175009,  # 62 pain_Coeff
    0.192418884837,  # 63 calm_Coeff
    0.326808582605,  # 64 energy_Coeff
    0.286756332102,  # 65 down_Coeff
    0.434568470244,  # 66 social_Coeff
    0.26451376292,  # 67 nervous_Coeff
    0.410617456656,  # 68 hopeless_Coeff
    0.339327311289,  # 69 restless_Coeff
    0.414976516008,  # 70 sosad_Coeff
    0.407875145588,  # 71 effort_Coeff
    0.428634030596,  # 72 worthless_Coeff
    0.489468092957,  # 73 interest_Coeff
    0.488132890989,  # 74 depress_Coeff
    0.116978268215,  # 75 dontneed_Coeff
    0.0168006372715,  # 76 notworth_Coeff
    0.01331427408,  # 77 takerisk_Coeff
    0.085417221702,  # 78 overcome_Coeff
    1.19654109884,  # 79 phys_Cut2
    1.41033744953,  # 80 phys_Cut3
    1.30907153153,  # 81 phys_Cut4
    1.23067651099,  # 82 ment_Cut2
    1.61437264896,  # 83 ment_Cut3
    1.18583836617,  # 84 ment_Cut4
    1.77941157612,  # 85 genh_Cut2
    1.75868985413,  # 86 genh_Cut3
    1.73100686419,  # 87 genh_Cut4
    1.09632547834,  # 88 climb_Cut2
    1.05561881509,  # 89 modact_Cut2
    0.740275298057,  # 90 acclessP_Cut2
    0.885574416488,  # 91 acclessP_Cut3
    0.720480317996,  # 92 acclessP_Cut4
    0.754565130238,  # 93 worklimP_Cut2
    0.963247928353,  # 94 worklimP_Cut3
    0.752592773049,  # 95 worklimP_Cut4
    0.681010594593,  # 96 acclessM_Cut2
    0.86958399889,  # 97 acclessM_Cut3
    0.700938964961,  # 98 acclessM_Cut4
    0.652843899733,  # 99 worklimM_Cut2
    0.911477352952,  # 100 worklimM_Cut3
    0.760810974476,  # 101 worklimM_Cut4
    0.996739957835,  # 102 pain_Cut2
    0.639746200959,  # 103 pain_Cut3
    0.987319718704,  # 104 pain_Cut4
    0.704593408638,  # 105 calm_Cut2
    0.886068986821,  # 106 calm_Cut3
    1.44414308836,  # 107 calm_Cut4
    0.910137673344,  # 108 energy_Cut2
    1.15280103308,  # 109 energy_Cut3
    1.5664650507,  # 110 energy_Cut4
    0.745261343434,  # 111 down_Cut2
    1.07071459313,  # 112 down_Cut3
    0.949919229624,  # 113 down_Cut4
    0.748522532524,  # 114 social_Cut2
    0.961853580079,  # 115 social_Cut3
    0.758377479847,  # 116 social_Cut4
    0.729905787628,  # 117 nervous_Cut2
    0.991023660843,  # 118 nervous_Cut3
    1.05990604628,  # 119 nervous_Cut4
    0.773596853943,  # 120 hopeless_Cut2
    0.866658450605,  # 121 hopeless_Cut3
    0.867890092351,  # 122 hopeless_Cut4
    0.804366841949,  # 123 restless_Cut2
    0.979126214571,  # 124 restless_Cut3
    1.03694258917,  # 125 restless_Cut4
    0.785159984175,  # 126 sosad_Cut2
    0.858371667271,  # 127 sosad_Cut3
    0.854805032623,  # 128 sosad_Cut4
    0.73213780185,  # 129 effort_Cut2
    0.778491954491,  # 130 effort_Cut3
    0.944556926742,  # 131 effort_Cut4
    0.658165826515,  # 132 worthless_Cut2
    0.726947691668,  # 133 worthless_Cut3
    0.733850860319,  # 134 worthless_Cut4
    0.805207499061,  # 135 interest_Cut2
    1.20426137952,  # 136 interest_Cut3
    0.803752175954,  # 137 depress_Cut2
    1.30343720587,  # 138 depress_Cut3
    0.486058746929,  # 139 dontneed_Cut2
    0.357278119547,  # 140 dontneed_Cut3
    0.652819932257,  # 141 dontneed_Cut4
    0.461402694664,  # 142 notworth_Cut2
    0.435933885156,  # 143 notworth_Cut3
    0.626412416173,  # 144 notworth_Cut4
    0.538864360912,  # 145 takerisk_Cut2
    0.516959653891,  # 146 takerisk_Cut3
    0.784829869965,  # 147 takerisk_Cut4
    0.557915637159,  # 148 overcome_Cut2
    0.355401539839,  # 149 overcome_Cut3
    0.937411738423,  # 150 overcome_Cut4
])

which_indices = np.array([0,2,3,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25])

# 4752476.52786
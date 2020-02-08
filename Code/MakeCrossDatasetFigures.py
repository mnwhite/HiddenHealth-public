'''
This file produces a cross-dataset plot of the distribution SRHS by age.
'''

import numpy as np
import csv
import matplotlib.pyplot as plt

def readSRHSdatafile(filename):
    '''
    Reads a tab-delimited text file from disk and returns data on the cumulative
    distribution of self-reported health status by age.
    
    Parameters
    ----------
    filename : str
        Name of data file to be read from /Data/Figures/, with no .txt.
    
    Returns
    -------
    age_vec : np.array
        1D array of age data for this dataset.
    SRHS_dstn : np.array
        2D array of shape (J,5) with the cumulative distribution of SRHS.
    '''
    infile = open('../Data/Figures/' + filename + '.txt','r')
    my_reader = csv.reader(infile, delimiter='\t')
    all_data = list(my_reader)
    infile.close()
    J = len(all_data)
    
    age_vec = np.zeros(J)
    SRHS_data = np.zeros((J,5))
    
    for j in range(J):
        age_vec[j] = float(all_data[j][0])
        for h in range(5):
            SRHS_data[j,h] = float(all_data[j][h+1])
    
    return age_vec, SRHS_data


def readCorrDatafile(filename):
    '''
    Reads a tab-delimited text file from disk and returns data on correlation
    coefficient of latent health by age.
    
    Parameters
    ----------
    filename : str
        Name of data file to be read from /Data/Figures/, with no .txt.
    
    Returns
    -------
    age_vec : np.array
        1D array of age data for this dataset.
    corr_data : np.array
        1D array of shape (J) with correlation coefficient by age.
    '''
    infile = open('../Data/Figures/' + filename + '.txt','r')
    my_reader = csv.reader(infile, delimiter='\t')
    all_data = list(my_reader)
    infile.close()
    J = len(all_data)
    
    age_vec = np.zeros(J)
    corr_data = np.zeros(J)
    
    for j in range(J):
        age_vec[j] = float(all_data[j][0])
        corr_data[j] = float(all_data[j][1])
    
    return age_vec, corr_data


def makeSRHSfigure(dataset_names, data_labels, sex_bool, descr=None):
    '''
    Make a plot of the cumulative distribution of SRHS by age across datasets.
    
    Parameters
    ----------
    dataset_names : [str]
        List of strings naming datasets to be included on the figure.  For each
        element NAME in dataset_names, tab-delimited text files in /Data/Figures/
        named NAMEwomenSRHS.txt or NAMEmenSRHS.txt should exist.
    data_labels : [str]
        Labels to be used in the legend, corresponding to each dataset.
    sex_bool : bool
        Indicator for whether to make a figure for women (0) or men (1).
    descr : str
        Name of file to save figure to (in pdf format) in /Figures.  Defaults to None.
        
    Returns
    -------
    None
    '''
    if sex_bool:
        sex_word_A = 'men'
        sex_word_B = 'Men'
    else:
        sex_word_A = 'women'
        sex_word_B = 'Women'
    age_vec_list = []
    SRHS_data_list = []
    
    for name in dataset_names:
        age_vec, SRHS_data = readSRHSdatafile(name + sex_word_A + 'SRHS')
        age_vec_list.append(age_vec)
        SRHS_data_list.append(SRHS_data)
        
    colors = ['b','r','g','m','c']
    styles = ['-','--','-.']
    
    for h in range(5):
        for d in range(len(dataset_names)):
            plt.plot(age_vec_list[d], SRHS_data_list[d][:,h], styles[d] + colors[h])
    plt.ylim([-0.001,1.001])
    plt.xlim(np.min([vec[0] for vec in age_vec_list]),np.max([vec[-1] for vec in age_vec_list]))
    plt.title('Self reported health status by age across datasets, ' + sex_word_A)
    plt.xlabel('Age')
    plt.ylabel('Cumulative SRHS share')
    plt.legend(data_labels, loc=9, bbox_to_anchor=(0.5,-0.15), ncol=len(dataset_names))
    plt.tight_layout(pad=2.5)
    if descr is not None:
        plt.savefig('../Figures/' + descr + sex_word_B + '.pdf')
    plt.show()
    
    
def makeCorrFigure(dataset_names, data_labels, sex_bool, descr=None):
    '''
    Make a plot of the correlation coefficient for latent health by age across datasets.
    
    Parameters
    ----------
    dataset_names : [str]
        List of strings naming datasets to be included on the figure.  For each
        element NAME in dataset_names, tab-delimited text files in /Data/Figures/
        named NAMEwomenCorr.txt or NAMEmenCorr.txt should exist.
    data_labels : [str]
        Labels to be used in the legend, corresponding to each dataset.
    sex_bool : bool
        Indicator for whether to make a figure for women (0) or men (1).
    descr : str
        Name of file to save figure to (in pdf format) in /Figures.  Defaults to None.
        
    Returns
    -------
    None
    '''
    if sex_bool:
        sex_word_A = 'men'
        sex_word_B = 'Men'
    else:
        sex_word_A = 'women'
        sex_word_B = 'Women'
    age_vec_list = []
    Corr_data_list = []
    
    colors = ['b','r','g','k']
    
    for name in dataset_names:
        age_vec, Corr_data = readCorrDatafile(name + sex_word_A + 'Corr')
        age_vec_list.append(age_vec)
        Corr_data_list.append(Corr_data)
        
    for d in range(len(dataset_names)):
        plt.plot(age_vec_list[d], Corr_data_list[d], '-'+colors[d])
    plt.xlim(18,95)
    plt.ylim(0.92,1.0)
    plt.title('Latent health correlation coefficient by age, ' + sex_word_A)
    plt.xlabel('Age')
    plt.ylabel('Correlation coefficient $\\rho_j$')
    plt.legend(data_labels, loc=4) 
    plt.tight_layout()
    if descr is not None:
        plt.savefig('../Figures/' + descr + sex_word_B + '.pdf')
    plt.show()
    
    
if __name__ == '__main__':
    
    my_datasets = ['MEPSover18','HRSover50','PSIDover23']
    my_labels = ['MEPS', 'HRS', 'PSID']
    makeSRHSfigure(my_datasets, my_labels, False, 'CrossDataSRHSa')
    makeSRHSfigure(my_datasets, my_labels, True, 'CrossDataSRHSa')
    
    my_datasets = ['SAQover18','HRSover50','PSIDover23']
    my_labels = ['MEPS-SAQ', 'HRS', 'PSID']
    makeSRHSfigure(my_datasets, my_labels, False, 'CrossDataSRHSb')
    makeSRHSfigure(my_datasets, my_labels, True, 'CrossDataSRHSb')
    
    my_datasets = ['MEPSover18','HRSover50','PSIDover23','CrossData']
    my_labels = ['MEPS', 'HRS', 'PSID', 'Mixed']
    makeCorrFigure(my_datasets, my_labels, False, 'Correlation')
    makeCorrFigure(my_datasets, my_labels, True, 'Correlation')
        
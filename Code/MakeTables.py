'''
This file has functions for making tables for the hidden health project.
'''
import numpy as np
import csv
from copy import copy

one_type_param_symbols = [
        "\\theta_{0}'",
        "\\theta_{s}",
        "\\theta_{h1}'",
        "\\theta_{h2}'",
        "\\theta_{j1}'",
        "\\theta_{j2}'",
        "\\theta_{j3}'",
        "\\theta_{hj}",
        "\\theta_{js}",
        "\\gamma_{0}'",
        "\\gamma_{j1}'",
        "\\gamma_{j2}'",
        "\\gamma_{j3}'",
        "\\beta_{0}'",
        "\\beta_{s}",
        "\\beta_{j1}'",
        "\\beta_{j2}'",
        "\\beta_{j3}'",
        "\\beta_{js}",
        "\\mu_0",
        "\\sigma_{0}",
        "\\alpha_1",
        "\\chi_2",
        "\\chi_3",
        "\\chi_4"
        ]

one_type_param_descs = [
        'Mortality probit: level at model start $\\underline{j}$',
        'Mortality probit: shifter for men',
        'Mortality probit: first derivative w.r.t health at $\Health=0$',
        'Mortality probit: second derivative w.r.t health at $\Health=0$',
        'Mortality probit: first derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: second derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: third derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: coefficient on age$\\times$health',
        'Mortality probit: coefficient on age, adjustment for men',
        'Correlation factor: level at model start $\\underline{j}$',
        'Correlation factor: first derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: second derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: level at model start $\\underline{j}$',
        'Expected health: shifter for men',
        'Expected health: first derivative w.r.t age at $\\underline{j}$',
        'Expected health: second derivative w.r.t age at $\\underline{j}$',
        'Expected health: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: coefficient on age, adjustment for men',
        'Mean of latent health at $\\underline{j}$',
        'Standard deviation of latent health at $\\underline{j}$',
        "SRHS: Linear coefficient on latent health",
        "SRHS: Cut b/w reporting ``fair'' and ``good''",
        "SRHS: Cut b/w reporting ``good'' and ``very good''",
        "SRHS: Cut b/w reporting ``very good'' and ``excellent''"
        ]

hetero_param_symbols = [
    "\\theta_{0}'",
    "\\theta_{s}",
    "\\theta_{h1}'",
    "\\theta_{h2}'",
    "\\theta_{j1}'",
    "\\theta_{j2}'",
    "\\theta_{j3}'",
    "\\theta_{hj}",
    "\\theta_{js}",
    "\\gamma_{0}'",
    "\\gamma_{j1}'",
    "\\gamma_{j2}'",
    "\\gamma_{j3}'",
    "\\beta_{0}'",
    "\\beta_{s}",
    "\\beta_{j1}'",
    "\\beta_{j2}'",
    "\\beta_{j3}'",
    "\\beta_{js}",
    "\\mu_0",
    "\\sigma_0",
    "q_1",
    "\\mu_1",
    "\\sigma_1",
    "q_2",
    "\\mu_1",
    "\\sigma_1",
    "p_1",
    "\\varsigma_1",
    "p_2",
    "\\varsigma_2",
    "p_3",
    "\\varsigma_3",
    "\\alpha_1",
    "\\chi_2",
    "\\chi_3",
    "\\chi_4"
    ]

hetero_param_descs = [
        'Mortality probit: level at model start $\\underline{j}$',
        'Mortality probit: shifter for men',
        'Mortality probit: first derivative w.r.t health at $\Health=0$',
        'Mortality probit: second derivative w.r.t health at $\Health=0$',
        'Mortality probit: first derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: second derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: third derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: coefficient on age$\\times$health',
        'Mortality probit: coefficient on age, adjustment for men',
        'Correlation factor: level at model start $\\underline{j}$',
        'Correlation factor: first derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: second derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: level at model start $\\underline{j}$',
        'Expected health: shifter for men',
        'Expected health: first derivative w.r.t age at $\\underline{j}$',
        'Expected health: second derivative w.r.t age at $\\underline{j}$',
        'Expected health: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: coefficient on age, adjustment for men',
        'Mean of initial latent health at $\\underline{j}$',
        'Standard deviation of initial latent health at $\\underline{j}$',
        'Health shocks: probability of small shock',
        'Health shocks: mean for small shock',
        'Health shocks: stdev for small shock',
        'Health shocks: probability of large shock',
        'Health shocks: mean for large shock',
        'Health shocks: stdev for large shock',
        'Proportion of reporting type 1 individuals',
        'Standard deviation of SRHS shocks for type 1',
        'Proportion of reporting type 2 individuals',
        'Standard deviation of SRHS shocks for type 2',
        'Proportion of reporting type 3 individuals',
        'Standard deviation of SRHS shocks for type 3',
        "SRHS: Linear coefficient on latent health",
        "SRHS: Cut b/w reporting ``fair'' and ``good''",
        "SRHS: Cut b/w reporting ``good'' and ``very good''",
        "SRHS: Cut b/w reporting ``very good'' and ``excellent''"
        ]


def saveParamsAndCovarMatrix(params, covar, filename):
    '''
    Write estimated parameters and their covariance matrix to a file in /Data/Results/
    
    Parameters
    ----------
    params : np.array
        Array of estimated parameters to save.
    covar : np.array
        Corresponding covariance matrix to save.
    filename : str
        Name of file to store results in /Data/Results/; no extension needed.
        
    Returns
    -------
    None
    '''
    outfile = '../Data/Results/' + filename + 'RawEst.txt'
    with open(outfile,'w') as f:
        J = params.size
        for i in range(J):
            this_line = str(params[i])
            for j in range(J):
                this_line += '\t' + str(covar[i,j])
            this_line += '\n'
            f.write(this_line)
        f.close()
        
    
def readParamsAndCovarMatrix(filename):
    '''

    Parameters
    ----------
    filename : str
        Name of file in ../Data/Results/ to be read back into Python environment.

    Returns
    -------
    params : np.array
        Vector array of parameter estimates of size K.
    covar : np.array
        KxK array of covariances of parameter estimates.
    '''
    infile = '../Data/Results/' + filename + 'RawEst.txt'
    with open(infile,'r') as f:
        my_reader = csv.reader(f, delimiter='\t')
        data_dump = list(my_reader)
        f.close()
    K = len(data_dump)
    params = np.zeros(K) + np.nan
    covar = np.zeros((K,K)) + np.nan
    for j in range(K):
        params[j] = float(data_dump[j][0])
        for k in range(K):
            covar[j,k] = float(data_dump[j][k+1])
    return params, covar


def saveTableParamsAndStdErrs(params, stderrs, LL, ind_count, SRHS_count, filename):
    '''
    Write repored parameters and standard errors to a specified file in /Data/Results/
    
    Parameters
    ----------
    params : np.array
        Array of transformed estimated parameters to save.
    stderrs : np.array
        Array of corresponding standard errors to save.
    LL : float
        Log likelihood at the estimated parameters.
    ind_count : int
        Number of unique individuals in the dataset.
    SRHS_count : int
        Number of observations of SRHS in the data, living and dead.
    filename : str
        Name of file to store results in /Data/Results/; no extension needed.
        
    Returns
    -------
    None
    '''
    outfile = '../Data/Results/' + filename + '.txt'
    f = open(outfile,'w')
    J = params.size
    
    for j in range(J):
        this_line = str(params[j]) + '\t' + str(stderrs[j]) + '\n'
        f.write(this_line)
    f.write(str(LL) + '\n')
    f.write(str(ind_count) + '\n')
    f.write(str(SRHS_count) + '\n')
    f.close()
    print('Wrote results for table to ' + outfile)
    
    
def paramStr(value):
    '''
    Format a parameter value as a string.
    '''
    if np.isnan(value):
        return '---'
    elif value == 0.:
        return '0.00'
    
    try:
        n = int(np.floor(np.log(np.abs(value))/np.log(10.)))
    except:
        n = 0   
    if n < -1:
        temp = value/10.**n
        out = "{:.2f}".format(temp) + "e" + str(n)
    elif n >= 3:
        out = "{:.0f}".format(value)
    else:
        out = "{:.3f}".format(value)
    return out
    

def makeParameterTable(param_symbols, param_descs, filenames, which, spec_labels, spec_descs, table_title, table_label):
    '''
    Make a LaTeX table listing parameters (and standard errors) across specifications.
    
    Parameters
    ----------
    param_symbols : [str]
        List of strings with LaTeX code for each estimated parameter.
    param_descs : [str]
        List of strings with parameter descriptions for each estimated parameter.
    filenames : [str]
        List of strings naming parameter files to be read and included on table.
        File extension .txt is added automatically; files should be in /Results.
    which = np.array
        Array of parameter indices to include in the table.
    spec_labels : [str]
        List of strings to use as column headers, corresponding to the filenames.
    spec_descs : [str]
        List of strings with longer specification descriptions in a note at the
        bottom of the table.
    table_title : str
        String to put as the table's caption at the very top.
    table_label : str
        Label for the table, to be used in document that embeds the table.
    Returns
    -------
    table_text : str
        String with LaTeX code for the parameter table.
    '''
    N = len(filenames)
    J = len(param_symbols)
    if J != which.size:
        print('Length of parameter list must equal length of index list!')
    
    param_array = np.zeros((J,N)) + np.nan
    stderr_array = np.zeros((J,N)) + np.nan
    
    for n in range(N):
        infile = '../Data/Results/' + filenames[n] + '.txt'
        f = open(infile,'r')
        my_reader = csv.reader(f,delimiter='\t')
        temp_data = list(my_reader)
        f.close()
        
        for j in range(J):
            i = which[j]
            try:
                param_array[j,n] = float(temp_data[i][0])
            except:
                param_array[j,n] = np.nan
            try:
                stderr_array[j,n] = float(temp_data[i][1])
            except:
                stderr_array[j,n] = np.nan
    
    out  = '\\begin{table}[H]\n'
    out += '\\footnotesize\n'
    out += '\\singlespace\n'
    out += '\\begin{center}\n'
    out += '\\caption{' + table_title + '}\\label{tab:' + table_label + '}\n'
    out += "\\newsavebox{\\" + table_label + "Box}\n"
    out += "\\sbox{\\" + table_label + "Box}{  \n"
    out += '\\begin{tabular}{cl'
    for n in range(N):
        out += 'c'
    out += '}\n'
    out += '\\hline \\hline\n'
    out += 'Param & \\multicolumn{1}{c}{Description} '
    for n in range(N):
        out += '& ' + spec_labels[n] + ' '
    out += '\\\\\n'
    out += '\\hline\n'
    for j in range(J):
        this_line = '$' + param_symbols[j] + '$ & ' + param_descs[j] + ' '
        for n in range(N):
            this_line += '& ' + paramStr(param_array[j,n]) + ' '
        this_line += '\\\\\n'
        this_line += ' & '
        for n in range(N):
            if stderr_array[j,n] > 0.:
                se = stderr_array[j,n]
            else:
                se = np.nan
            this_line += '& (' + paramStr(se) + ') '
        this_line += '\\\\\n'
        out += this_line
    out += '\\hline\\hline\n'
    out += '\\end{tabular}\n'
    out += " } \n "
    out += "\\usebox{\\" + table_label + "Box}  \n"
    out += "\\settowidth\\TableWidth{\\usebox{\\" + table_label + "Box}} % Calculate width of table so notes will match  \n"
    out += "\\vspace{0.0cm} \parbox{\TableWidth}{\n"
    out += "  \\begin{flushleft}\n"
    for n in range(N):
        out += '\\textbf{' + spec_labels[n] + ':} ' + spec_descs[n] + '\\\\\n'
    out += "  \\end{flushleft}\n"
    out += "}\n"
    out += '\\end{center}\n'
    out += '\\end{table}\n'
    
    table_text = out
    return table_text


def makeParameterTableALT(param_symbols, param_descs, filenames, which, stderr_break, put_hline_after,
                          spec_labels, spec_descs, table_title, table_label):
    '''
    Make a LaTeX table listing parameters (and standard errors) across specifications.
    
    Parameters
    ----------
    param_symbols : [str]
        List of strings with LaTeX code for each estimated parameter.
    param_descs : [str]
        List of strings with parameter descriptions for each estimated parameter.
    filenames : [str]
        List of strings naming parameter files to be read and included on table.
        File extension .txt is added automatically; files should be in /Results.
    which = np.array
        Array of parameter indices to include in the table.
    stderr_break : bool
        Indicator for whether to put standard errors on a separate line (True)
        versus on the same line as the estimates (False).
    put_hline_after : [int]
        List of parameter line numbers after which to put a horizontal line.
    spec_labels : [str]
        List of strings to use as column headers, corresponding to the filenames.
    spec_descs : [str] or str
        List of strings with longer specification descriptions in a note at the
        bottom of the table. If only a single string (not a list), the note is
        applied directly without using spec_labels
    table_title : str
        String to put as the table's caption at the very top.
    table_label : str
        Label for the table, to be used in document that embeds the table.
    Returns
    -------
    table_text : str
        String with LaTeX code for the parameter table.
    '''
    N = len(filenames)
    J = len(param_symbols)
    if J != which.size:
        print('Length of parameter list must equal length of index list!')
    
    param_array = np.zeros((J,N)) + np.nan
    stderr_array = np.zeros((J,N)) + np.nan
    LL_vec = np.zeros(N)
    ind_count_vec = np.zeros(N, dtype=int)
    obs_count_vec = np.zeros(N, dtype=int)
    
    for n in range(N):
        infile = '../Data/Results/' + filenames[n] + '.txt'
        f = open(infile,'r')
        my_reader = csv.reader(f,delimiter='\t')
        temp_data = list(my_reader)
        f.close()
        
        for j in range(J):
            i = which[j]
            try:
                param_array[j,n] = float(temp_data[i][0])
            except:
                param_array[j,n] = np.nan
            try:
                stderr_array[j,n] = float(temp_data[i][1])
            except:
                stderr_array[j,n] = np.nan
        LL_vec[n] = float(temp_data[-3][0])
        ind_count_vec[n] = int(float(temp_data[-2][0]))
        obs_count_vec[n] = int(float(temp_data[-1][0]))
    
    out  = '\\begin{table}\n'
    out += '\\tiny\n'
    out += '\\singlespace\n'
    out += '\\begin{center}\n'
    out += '\\caption{' + table_title + '}\\label{tab:' + table_label + '}\n'
    out += "\\newsavebox{\\" + table_label + "Box}\n"
    out += "\\sbox{\\" + table_label + "Box}{  \n"
    out += '\\begin{tabular}{cl'
    for n in range(N):
        out += 'c'
    out += '}\n'
    out += '\\hline \\hline\n'
    out += '\\rule{0pt}{2.5ex}Param & \\multicolumn{1}{c}{Description} '
    for n in range(N):
        out += '& ' + spec_labels[n] + ' '
    out += '\\\\\n'
    out += '\\hline\n'
    for j in range(J):
        this_line = '\\rule{0pt}{2.2ex}$' + param_symbols[j] + '$ & ' + param_descs[j] + ' '
        other_line = '\\rule{0pt}{2.2ex} & '
        for n in range(N):
            if stderr_array[j,n] > 0.:
                se = stderr_array[j,n]
            else:
                se = np.nan
            this_line += '& ' + paramStr(param_array[j,n]) + ' '
            if not stderr_break:
                this_line += '(' + paramStr(se) + ') '
            other_line += '& ' + '(' + paramStr(se) + ') '
        this_line += '\\\\\n'
        other_line += '\\\\\n'
        out += this_line
        if stderr_break:
            out += other_line
        if j in put_hline_after:
            out += '\\hline\n'
    out += '\\hline\n'
    
    out += '\\rule{0pt}{2.2ex}$I$ & Number of unique individuals'
    for n in range(N):
        out += ' & ' + '{:,}'.format(ind_count_vec[n])
    out += '\\\\\n'
    out += '\\rule{0pt}{2.2ex}$\\lVert X \\rVert$ & Number of observations of SRHS (alive \& dead)'
    for n in range(N):
        out += ' & ' + '{:,}'.format(obs_count_vec[n])
    out += '\\\\\n'
    out += '\\rule{0pt}{2.2ex}$\\mathcal{L}(\\widehat{\\Delta} | X)$ & Log likelihood at estimated parameters'
    for n in range(N):
        out += ' & ' + "{:,.1f}".format(LL_vec[n])
    out += '\\\\\n'
    
    out += '\\hline\\hline\n'
    out += '\\end{tabular}\n'
    out += " } \n"
    out += "\\usebox{\\" + table_label + "Box}  \n"
    out += "\\settowidth\\TableWidth{\\usebox{\\" + table_label + "Box}} % Calculate width of table so notes will match  \n"
    out += "\\vspace{0.0cm} \parbox{\TableWidth}{\n"
    
    if (type(spec_descs) is list):
        out += "  \\begin{flushleft}\n"
        for n in range(N):
            out += '\\textbf{' + spec_labels[n] + ':} ' + spec_descs[n] + '\\\\\n'
        out += "  \\end{flushleft}\n"
    else:
        out += spec_descs  + '\\\\\n'
    out += "}\n"
    out += '\\end{center}\n'
    out += '\\end{table}\n'
    
    table_text = out
    return table_text


def makeSlidesTable(param_symbols, param_descs, filename, which, spec_label, table_label):
    '''
    Make a LaTeX table listing parameters (and standard errors) for one specification
    (for use in beamer slides).
    
    Parameters
    ----------
    param_symbols : [str]
        List of strings with LaTeX code for each estimated parameter.
    param_descs : [str]
        List of strings with parameter descriptions for each estimated parameter.
    filename : str
        String naming parameter file to be read and included on table.
        File extension .txt is added automatically; file should be in /Results.
    which = np.array
        Array of parameter indices to include in the table.
    spec_label : str
        String to use as column header, corresponding to the filenames.
    table_label : str
        Label for the table, to be used in document that embeds the table.
    Returns
    -------
    table_text : str
        String with LaTeX code for the parameter table.
    '''
    J = len(param_symbols)
    if J != which.size:
        print('Length of parameter list must equal length of index list!')
    
    param_array = np.zeros(J) + np.nan
    stderr_array = np.zeros(J) + np.nan
    
    infile = '../Data/Results/' + filename + '.txt'
    f = open(infile,'r')
    my_reader = csv.reader(f,delimiter='\t')
    temp_data = list(my_reader)
    f.close()
    
    for j in range(J):
        i = which[j]
        try:
            param_array[j] = float(temp_data[i][0])
        except:
            param_array[j] = np.nan
        try:
            stderr_array[j] = float(temp_data[i][1])
        except:
            stderr_array[j] = np.nan
    
    out  = '\\begin{table}[ht]\\label{' + table_label + '}\n'
    out += '\\footnotesize\n'
    out += '\\begin{center}\n'
    out += '\\begin{tabular}{cl'
    out += 'c'
    out += '}\n'
    out += '\\hline \\hline\n'
    out += 'Param & Description '
    out += '& ' + spec_label + ' '
    out += '\\\\\n'
    out += '\\hline\n'
    for j in range(J):
        this_line = '$' + param_symbols[j] + '$ & ' + param_descs[j] + ' '
        this_line += '& ' + paramStr(param_array[j]) + ' '
        this_line += '\\\\\n'
        this_line += ' & '
        this_line += '& (' + paramStr(stderr_array[j]) + ') '
        this_line += '\\\\\n'
        out += this_line
    out += '\\hline\\hline\n'
    out += '\\end{tabular}\n'
    out += '\\end{center}\n'
    out += '\\end{table}\n'
    
    table_text = out
    return table_text


def saveTable(text, filename):
    f = open('../Tables/' + filename + '.tex','w')
    f.write(text)
    f.close()
    print('Wrote a parameter table to /Tables/' + filename + '.tex')
    return None
    

if __name__ == '__main__':
    one_type_params_to_include = np.array([0,1,2,3,6,7,8,10,11,12,13,14,15,17,18,19,20,21,23,27,28,32,33,34,35])
    hetero_params_to_include = np.array([0,1,2,3,6,7,8,10,11,12,13,14,15,17,18,19,20,21,23,30,31,28,24,26,29,25,27,35,32,36,33,37,34,39,40,41,42])
    
    mort_params = np.array([0,2,3,6,7,8,10])
    mort_symbols = one_type_param_symbols[0:7]
    mort_descs = one_type_param_symbols[0:7]
    
    corr_params = np.array([12,13,14,15])
    corr_symbols = one_type_param_symbols[7:11]
    corr_descs = one_type_param_symbols[7:11]
    
    health_params = np.array([17,19,20,21,22,24,25])
    health_symbols = one_type_param_symbols[11:18]
    health_descs = one_type_param_symbols[11:18]
    
    srhs_params = np.array([26,27,28,29])
    srhs_symbols = one_type_param_symbols[18:22]
    srhs_descs = one_type_param_symbols[18:22]
    
    other_params = np.array([12,13,14,15,26,27,28,29])
    other_symbols = corr_symbols + srhs_symbols
    other_descs = corr_descs + srhs_descs
    
    
    # TwoStudyParamTable = makeParameterTableALT(hetero_param_symbols,
    #                           hetero_param_descs,
    #                           ['TwoStudyWomenOver23HeteroParams','TwoStudyMenOver23HeteroParams','TwoStudyAllOver23HeteroParams'],
    #                           hetero_params_to_include,
    #                           True,
    #                           [8,12,18,26,32],
    #                           ['Women','Men','All'],
    #                           'Includes HRS respondents (1996-2016) and PSID heads and spouses (1997-2017), ages 23 to 110.',
    #                           'Paramaters Estimated by Maximum Likelihood on HRS and PSID Data',
    #                           'TwoStudyTable')
    # saveTable(TwoStudyParamTable, 'TwoStudyTable')
    
    
    # BasicModelParamTable = makeParameterTableALT(one_type_param_symbols,
    #                           one_type_param_descs,
    #                           ['TwoStudyWomenOver23aParams','TwoStudyMenOver23aParams','TwoStudyAllOver23aParams'],
    #                           one_type_params_to_include,
    #                           True,
    #                           [8,12,18,20],
    #                           ['Women','Men','All'],
    #                           'Includes HRS respondents (1996-2016) and PSID heads and spouses (1997-2017), ages 23 to 110. Health shocks are specified as standard normal, and reporting shocks are drawn iid for all agents.',
    #                           'Paramaters Estimated by Maximum Likelihood on HRS and PSID Data, Basic Model',
    #                           'BasicTable')
    # saveTable(BasicModelParamTable, 'BasicTable')
    
    
    # HRS_params_to_include = np.array([0,1,2,3,6,7,8,10,11,12,13,17,18,19,20,21,23,30,31,28,24,26,29,25,27,35,32,36,33,37,34,39,40,41,42])
    # HRS_param_symbols = copy(hetero_param_symbols)
    # HRS_param_symbols.pop(11)
    # HRS_param_symbols.pop(11)
    # HRS_param_descs = copy(hetero_param_descs)
    # HRS_param_descs.pop(11)
    # HRS_param_descs.pop(11)
    # HRSonlyParamTable = makeParameterTableALT(HRS_param_symbols,
    #                           HRS_param_descs,
    #                           ['HRSwomenOver50HeteroParams','HRSmenOver50HeteroParams','HRSallOver50HeteroParams'],
    #                           HRS_params_to_include,
    #                           True,
    #                           [8,10,16,24,30],
    #                           ['Women','Men','All'],
    #                           'Includes HRS respondents (1996-2016), ages 50 to 115.',
    #                           'Paramaters Estimated by Maximum Likelihood on HRS Data',
    #                           'HRSonlyTable')
    # saveTable(HRSonlyParamTable, 'HRSonlyTable')
    
    
    # PSID_params_to_include = np.array([0,1,2,3,6,7,8,10,11,12,13,14,17,18,19,20,21,23,30,31,28,24,26,29,25,27,35,32,36,33,37,34,39,40,41,42])
    # PSID_param_symbols = copy(hetero_param_symbols)
    # PSID_param_symbols.pop(12)
    # PSID_param_descs = copy(hetero_param_descs)
    # PSID_param_descs.pop(12)
    # PSIDonlyParamTable = makeParameterTableALT(PSID_param_symbols,
    #                           PSID_param_descs,
    #                           ['PSIDwomenOver23HeteroParams','PSIDmenOver23HeteroParams','PSIDallOver23HeteroParams'],
    #                           PSID_params_to_include,
    #                           True,
    #                           [8,11,17,25,31],
    #                           ['Women','Men','All'],
    #                           'Includes PSID heads and spouses (1997-2017), ages 23 to 110.',
    #                           'Paramaters Estimated by Maximum Likelihood on PSID Data',
    #                           'PSIDonlyTable')
    # saveTable(PSIDonlyParamTable, 'PSIDonlyTable')
    
    
    MEPS_params_to_include = np.array([0,1,2,3,6,7,8,10,11,12,13,14,15,17,18,19,20,21,22,23,30,31,28,24,26,29,25,27,35,32,36,33,37,34,39,40,41,42])
    MEPS_param_symbols = copy(hetero_param_symbols)
    MEPS_param_symbols.insert(18,"\\beta_{j3}'")
    MEPS_param_descs = copy(hetero_param_descs)
    MEPS_param_descs.insert(18,'Expected health: fourth derivative w.r.t age at $\\underline{j}$')
    MEPSonlyParamTable = makeParameterTableALT(MEPS_param_symbols,
                              MEPS_param_descs,
                              ['MEPSwomenOver18HeteroParams','MEPSmenOver18HeteroParams','MEPSallOver18HeteroParams'],
                              MEPS_params_to_include,
                              True,
                              [8,12,19,27,33],
                              ['Women','Men','All'],
                              'Includes MEPS respondents (1996-2017), ages 18 to 86.',
                              'Paramaters Estimated by Maximum Likelihood on MEPS Data',
                              'MEPSonlyTable')
    saveTable(MEPSonlyParamTable, 'MEPSonlyTable')
    
    

    
    # These are 
    if False:
        WomenMEPSmortTable = makeSlidesTable(mort_symbols, mort_descs, 'MEPSwomenOver18Params', mort_params, 'MEPS', 'MEPSwomenMortParams')
        saveTable(WomenMEPSmortTable, 'MEPSwomenMortParams')
        WomenMEPScorrTable = makeSlidesTable(corr_symbols, corr_descs, 'MEPSwomenOver18Params', corr_params, 'MEPS', 'MEPSwomenCorrParams')
        saveTable(WomenMEPScorrTable, 'MEPSwomenCorrParams')
        WomenMEPShealthTable = makeSlidesTable(health_symbols, health_descs, 'MEPSwomenOver18Params', health_params, 'MEPS', 'MEPSwomenHealthParams')
        saveTable(WomenMEPShealthTable, 'MEPSwomenHealthParams')
        WomenMEPSsrhsTable = makeSlidesTable(srhs_symbols, srhs_descs, 'MEPSwomenOver18Params', srhs_params, 'MEPS', 'MEPSwomenSRHSparams')
        saveTable(WomenMEPSsrhsTable, 'MEPSwomenSRHSparams')
        WomenMEPSotherTable = makeSlidesTable(other_symbols, other_descs, 'MEPSwomenOver18Params', other_params, 'MEPS', 'MEPSwomenOtherParams')
        saveTable(WomenMEPSotherTable, 'MEPSwomenOtherParams')
        
        MenMEPSmortTable = makeSlidesTable(mort_symbols, mort_descs, 'MEPSmenOver18Params', mort_params, 'MEPS', 'MEPSmenMortParams')
        saveTable(MenMEPSmortTable, 'MEPSmenMortParams')
        MenMEPScorrTable = makeSlidesTable(corr_symbols, corr_descs, 'MEPSmenOver18Params', corr_params, 'MEPS', 'MEPSmenCorrParams')
        saveTable(MenMEPScorrTable, 'MEPSmenCorrParams')
        MenMEPShealthTable = makeSlidesTable(health_symbols, health_descs, 'MEPSmenOver18Params', health_params, 'MEPS', 'MEPSmenHealthParams')
        saveTable(MenMEPShealthTable, 'MEPSmenHealthParams')
        MenMEPSsrhsTable = makeSlidesTable(srhs_symbols, srhs_descs, 'MEPSmenOver18Params', srhs_params, 'MEPS', 'MEPSmenSRHSparams')
        saveTable(MenMEPSsrhsTable, 'MEPSmenSRHSparams')
        MenMEPSotherTable = makeSlidesTable(other_symbols, other_descs, 'MEPSmenOver18Params', other_params, 'MEPS', 'MEPSmenOtherParams')
        saveTable(MenMEPSotherTable, 'MEPSmenOtherParams')
        
        CrossWomenMortTable = makeSlidesTable(mort_symbols, mort_descs, 'CrossDataWomenParams', mort_params, 'Cross', 'CrossWomenMortParams')
        saveTable(CrossWomenMortTable, 'CrossWomenMortParams')
        CrossWomenCorrTable = makeSlidesTable(corr_symbols, corr_descs, 'CrossDataWomenParams', corr_params, 'Cross', 'CrossWomenCorrParams')
        saveTable(CrossWomenCorrTable, 'CrossWomenCorrParams')
        CrossWomenHealthTable = makeSlidesTable(health_symbols, health_descs, 'CrossDataWomenParams', health_params, 'Cross', 'CrossWomenHealthParams')
        saveTable(CrossWomenHealthTable, 'CrossWomenHealthParams')
        CrossWomenSrhsTable = makeSlidesTable(srhs_symbols, srhs_descs, 'CrossDataWomenParams', srhs_params, 'Cross', 'CrossWomenSRHSparams')
        saveTable(CrossWomenSrhsTable, 'CrossWomenSRHSparams')
        CrossWomenOtherTable = makeSlidesTable(other_symbols, other_descs, 'CrossDataWomenParams', other_params, 'Cross', 'CrossWomenOtherParams')
        saveTable(CrossWomenOtherTable, 'CrossWomenOtherParams')
        
        CrossMenMortTable = makeSlidesTable(mort_symbols, mort_descs, 'CrossDataMenParams', mort_params, 'Cross', 'CrossMenMortParams')
        saveTable(CrossMenMortTable, 'CrossMenMortParams')
        CrossMenCorrTable = makeSlidesTable(corr_symbols, corr_descs, 'CrossDataMenParams', corr_params, 'Cross', 'CrossMenCorrParams')
        saveTable(CrossMenCorrTable, 'CrossMenCorrParams')
        CrossMenHealthTable = makeSlidesTable(health_symbols, health_descs, 'CrossDataMenParams', health_params, 'Cross', 'CrossMenHealthParams')
        saveTable(CrossMenHealthTable, 'CrossMenHealthParams')
        CrossMenSrhsTable = makeSlidesTable(srhs_symbols, srhs_descs, 'CrossDataMenParams', srhs_params, 'Cross', 'CrossMenSRHSparams')
        saveTable(CrossMenSrhsTable, 'CrossMenSRHSparams')
        CrossMenOtherTable = makeSlidesTable(other_symbols, other_descs, 'CrossDataMenParams', other_params, 'Cross', 'CrossMenOtherParams')
        saveTable(CrossMenOtherTable, 'CrossMenOtherParams')
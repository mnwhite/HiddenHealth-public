'''
This file has functions for making tables for the hidden health project.
'''
import numpy as np
import csv

one_index_param_symbols = [
        "\\theta_{0}'",
        "\\theta_{h1}'",
        "\\theta_{h2}'",
        "\\theta_{h3}'",
        "\\theta_{j1}'",
        "\\theta_{j2}'",
        "\\theta_{j3}'",
        "\\theta_{hj}",
        "\\gamma_{0}'",
        "\\gamma_{j1}'",
        "\\gamma_{j2}'",
        "\\gamma_{j3}'",
        "\\beta_{0}'",
        "\\beta_{j1}'",
        "\\beta_{j2}'",
        "\\beta_{j3}'",
        "\\beta_{j4}'",
        "\\mu_0",
        "\\sigma_{0}",
        "\\alpha_1",
        "\\chi_2",
        "\\chi_3",
        "\\chi_4"
        ]

one_index_param_descs = [
        'Mortality probit: level at model start $\\underline{j}$',
        'Mortality probit: first derivative w.r.t health at $\Health=0$',
        'Mortality probit: second derivative w.r.t health at $\Health=0$',
        'Mortality probit: third derivative w.r.t health at $\Health=0$',
        'Mortality probit: first derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: second derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: third derivative w.r.t age at $\\underline{j}$',
        'Mortality probit: coefficient on age$\\times$health',
        'Correlation factor: level at model start $\\underline{j}$',
        'Correlation factor: first derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: second derivative w.r.t age at $\\underline{j}$',
        'Correlation factor: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: level at model start $\\underline{j}$',
        'Expected health: first derivative w.r.t age at $\\underline{j}$',
        'Expected health: second derivative w.r.t age at $\\underline{j}$',
        'Expected health: third derivative w.r.t age at $\\underline{j}$',
        'Expected health: fourth derivative w.r.t age at $\\underline{j}$',
        'Mean of latent health at $\\underline{j}$',
        'Standard deviation of latent health at $\\underline{j}$',
        "SRHS: Linear coefficient on latent health",
        "SRHS: Cut b/w reporting ``fair'' and ``good''",
        "SRHS: Cut b/w reporting ``good'' and ``very good''",
        "SRHS: Cut b/w reporting ``very good'' and ``excellent''"
        ]

def parameterTransformation(params_in):
    params_out = np.copy(params_in)
    params_out[2] *= 1e-1
    params_out[3] *= 1e-2
    params_out[4] *= 1e-3
    params_out[5] *= 1e-4
    params_out[6] *= 1e-2
    params_out[7] *= 1e-4
    params_out[8] *= 1e-6
    params_out[9] *= 1e-8
    params_out[10] *= 1e-4
    params_out[11] *= 1e-3
    params_out[13] *= 1e-2
    params_out[14] *= 1e-4
    params_out[15] *= 1e-6
    params_out[16] *= 1e-8
    params_out[19] *= 1e-1
    params_out[20] *= 1e-2
    params_out[21] *= 1e-3
    params_out[22] *= 1e-4
    params_out[23] *= 1e-3
    params_out[28] += params_out[27]
    params_out[29] += params_out[28]
    return params_out

def standardErrorsFromCovarMatrix(covar):
    stderrs_out = np.sqrt(np.diag(covar))
    stderrs_out[2] *= 1e-1
    stderrs_out[3] *= 1e-2
    stderrs_out[4] *= 1e-3
    stderrs_out[5] *= 1e-4
    stderrs_out[6] *= 1e-2
    stderrs_out[7] *= 1e-4
    stderrs_out[8] *= 1e-6
    stderrs_out[9] *= 1e-8
    stderrs_out[10] *= 1e-4
    stderrs_out[11] *= 1e-3
    stderrs_out[13] *= 1e-2
    stderrs_out[14] *= 1e-4
    stderrs_out[15] *= 1e-6
    stderrs_out[16] *= 1e-8
    stderrs_out[19] *= 1e-1
    stderrs_out[20] *= 1e-2
    stderrs_out[21] *= 1e-3
    stderrs_out[22] *= 1e-4
    stderrs_out[23] *= 1e-3
    stderrs_out[28] = np.sqrt(covar[27,27] + covar[28,28] + 2*covar[27,28])
    stderrs_out[29] = np.sqrt(covar[27,27] + covar[28,28] + covar[29,29] + 2*covar[27,28] + 2*covar[27,29] + 2*covar[28,29])
    
    return stderrs_out
    


def saveParamsAndStdErrs(params, stderrs, filename):
    '''
    Write estimated parameters and standard errors to a specified file in /Data/Results/
    
    Parameters
    ----------
    params : np.array
        Array of estimated parameters to save.
    stderrs : np.array
        Array of corresponding standard errors to save.
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
    f.close()
    
    
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
    params_to_include = np.array([0,2,3,4,6,7,8,10,12,13,14,15,17,19,20,21,22,24,25,26,27,28,29])
    
    mort_params = np.array([0,2,3,6,7,8,10])
    mort_symbols = one_index_param_symbols[0:7]
    mort_descs = one_index_param_descs[0:7]
    
    corr_params = np.array([12,13,14,15])
    corr_symbols = one_index_param_symbols[7:11]
    corr_descs = one_index_param_descs[7:11]
    
    health_params = np.array([17,19,20,21,22,24,25])
    health_symbols = one_index_param_symbols[11:18]
    health_descs = one_index_param_descs[11:18]
    
    srhs_params = np.array([26,27,28,29])
    srhs_symbols = one_index_param_symbols[18:22]
    srhs_descs = one_index_param_descs[18:22]
    
    other_params = np.array([12,13,14,15,26,27,28,29])
    other_symbols = corr_symbols + srhs_symbols
    other_descs = corr_descs + srhs_descs
    
    WomenParamTable = makeParameterTable(one_index_param_symbols,
                              one_index_param_descs,
                              ['MEPSwomenOver18Params','HRSwomenOver50aParams','PSIDwomenOver23aParams','CrossDataWomenParams'],
                              params_to_include,
                              ['MEPS','HRS','PSID','Mixed'],
                              ['Women ages 18 to 84 in Panels 1-20 (1996-2017); six month periods.',
                               'Women ages 50 to 90 (1996-2016); one year periods.',
                               'Women ages 23 to 90, as head or spouse (1997-2017); one year periods.',
                               'MEPS (SAQ) women ages 18-84 (2000-2017), HRS women ages 50-90 (1996-2016), and PSID women ages 23-90 (1997-2017); one year periods.'],
                              'Estimated Parameters for Women',
                              'WomenParams')
    saveTable(WomenParamTable, 'WomenParams')
    
    MenParamTable = makeParameterTable(one_index_param_symbols,
                              one_index_param_descs,
                              ['MEPSmenOver18Params','HRSmenOver50aParams','PSIDmenOver23aParams','CrossDataMenParams'],
                              params_to_include,
                              ['MEPS','HRS','PSID','Mixed'],
                              ['Men ages 18 to 84 in Panels 1-20 (1996-2017); six month periods.',
                               'Men ages 50 to 90 (1996-2016); one year periods.',
                               'Men ages 23 to 90, as head or spouse (1997-2017); one year periods.',
                               'MEPS (SAQ) men ages 18-84 (2000-2017), HRS men ages 50-90 (1996-2016), and PSID men ages 23-90 (1997-2017); one year periods.'],
                              'Estimated Parameters for Men',
                              'MenParams')
    saveTable(MenParamTable, 'MenParams')
    
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
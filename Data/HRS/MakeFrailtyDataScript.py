'''
This script writes a Stata script to construct an HRS dataset for making the
frailty index (or something really close to it).
'''
import csv

infile = open('FrailtyQcodes.txt','r') 
my_reader = csv.reader(infile, delimiter='\t')
all_data = list(my_reader)[1:]
infile.close()
row_count = len(all_data)

col96 = 9
col98 = 8
col00 = 7
col02 = 6
col04 = 5
col06 = 4
col08 = 3
col10 = 2
col12 = 2
col14 = 2
col16 = 2

year_labels = ['96', '98', '00', '02', '04', '06', '08', '10', '12', '14', '16']
year_strings = ['1996', '1998', '2000', '2002', '2004', '2006', '2008', '2010', '2012', '2014', '2016']
year_cols = [col96, col98, col00, col02, col04, col06, col08, col10, col12, col14, col16]
year_letters = ['E','F','G','H','J','K','L','M','N','O','P']
file1_letters = ['B','B','B','C','C','C','C','C','C','C','C']
file2_letters = ['E','E','E','G','G','G','G','G','G','G','G']
extract_scripts = []
year_count = len(year_labels)

for j in range(year_count):
    yr = year_labels[j]
    col = year_cols[j]
    let = year_letters[j]
    year = year_strings[j]
    
    var_list = ''
    for i in range(row_count):
        var_list += ' ' + let + all_data[i][col]
    
    script = 'clear all\n'
    script += 'infile using H' + yr + file1_letters[j] + '_R.dct\n'
    script += 'gen HHIDPN = HHID + PN\n'
    script += 'destring HHIDPN, gen(ID)\n'
    script += 'order ID\n'
    script += 'sort ID\n'
    script += 'save temp.dta, replace\n\n'
    
    script += 'clear all\n'
    script += 'infile using H' + yr + file2_letters[j] + '_R.dct\n'
    script += 'gen HHIDPN = HHID + PN\n'
    script += 'destring HHIDPN, gen(ID)\n'
    script += 'order ID\n'
    script += 'sort ID\n'
    script += 'merge 1:1 ID using temp.dta\n\n'
    
    script += 'keep ID' + var_list + '\n\n'
    
    for i in range(row_count):
        var_name = let + all_data[i][col]
        script += 'rename ' + var_name + ' ' + all_data[i][1] + '\n'
        script += 'label variable ' + all_data[i][1] + ' "' + all_data[i][0] + '"\n'
    
    script += '\n'
    script += 'do CalcFrailty.do\n\n'
    script += 'rename Frailty F' + year + '\n'
    script += 'rename Height Ht' + year + '\n'
    script += 'rename Weight Wt' + year + '\n'
    script += 'rename Health X' + year + '\n'
    script += 'sort ID\n'
    script += '\n'
    script += 'save FrailtyData' + yr + '.dta, replace\n'
    with open('ExtractFrailty' + yr + '.do', 'w') as f:
        f.write(script)
        f.close()
    print('Made extraction script for ' + year + '.')
    
    
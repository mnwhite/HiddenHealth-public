clear all
infile using TRK2016TR_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
gen sex = 2 - GENDER
rename BIRTHYR yearborn
rename FIRSTIW firstob
rename EXDEATHYR yeardied

gen weight = .
replace weight = EWGTR if firstob <= 1996
replace weight = FWGTR if firstob == 1998 | weight == 0
replace weight = GWGTR if firstob == 2000 | weight == 0
replace weight = HWGTR if firstob == 2002 | weight == 0
replace weight = JWGTR if firstob == 2004 | weight == 0
replace weight = KWGTR if firstob == 2006 | weight == 0
replace weight = LWGTR if firstob == 2008 | weight == 0
replace weight = MWGTR if firstob == 2010 | weight == 0
replace weight = NWGTR if firstob == 2012 | weight == 0
replace weight = OWGTR if firstob == 2014 | weight == 0
replace weight = PWGTR if firstob == 2016 | weight == 0

keep ID weight firstob yearborn yeardied sex
order ID weight firstob yearborn yeardied sex
sort ID

save AllHRSrespondents.dta, replace

label define Health 1 "Poor" 2 "Fair" 3 "Good" 4 "Very Good" 5 "Excellent" 6 "None" 8 "Don't Know" 9 "Refused", replace
label define EmpStat 1 "Working" 2 "Unemployed" 3 "Laid off" 4 "Disabled" 5 "Retired" 6 "Homemaker" 7 "Other" 8 "Don't know" 9 "Refused", replace

clear all
infile using H96B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename E769 h1996
replace h1996 = 6 - h1996 if h1996 >= 1 & h1996 <= 5
label variable h1996 Health
keep ID h1996
order ID h1996
sort ID
save SRHS1996.dta, replace

clear all
infile using H98B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename F1097 h1998
replace h1998 = 6 - h1998 if h1998 >= 1 & h1998 <= 5
label values h1998 Health
keep ID h1998
order ID h1998
sort ID
save SRHS1998.dta, replace

clear all
infile using H00B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename G1226 h2000
replace h2000 = 6 - h2000 if h2000 >= 1 & h2000 <= 5
label values h2000 Health
keep ID h2000
order ID h2000
sort ID
save SRHS2000.dta, replace

clear all
infile using H02C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename HC001 h2002
replace h2002 = 6 - h2002 if h2002 >= 1 & h2002 <= 5
label values h2002 Health
keep ID h2002
order ID h2002
sort ID
save SRHS2002.dta, replace

clear all
infile using H04C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename JC001 h2004
replace h2004 = 6 - h2004 if h2004 >= 1 & h2004 <= 5
label values h2004 Health
keep ID h2004
order ID h2004
sort ID
save SRHS2004.dta, replace

clear all
infile using H06C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename KC001 h2006
replace h2006 = 6 - h2006 if h2006 >= 1 & h2006 <= 5
label values h2006 Health
keep ID h2006
order ID h2006
sort ID
save SRHS2006.dta, replace

clear all
infile using H08C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename LC001 h2008
replace h2008 = 6 - h2008 if h2008 >= 1 & h2008 <= 5
label values h2008 Health
keep ID h2008
order ID h2008
sort ID
save SRHS2008.dta, replace

clear all
infile using H10C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename MC001 h2010
replace h2010 = 6 - h2010 if h2010 >= 1 & h2010 <= 5
label values h2010 Health
keep ID h2010
order ID h2010
sort ID
save SRHS2010.dta, replace

clear all
infile using H12C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename NC001 h2012
replace h2012 = 6 - h2012 if h2012 >= 1 & h2012 <= 5
label values h2012 Health
keep ID h2012
order ID h2012
sort ID
save SRHS2012.dta, replace

clear all
infile using H14C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename OC001 h2014
replace h2014 = 6 - h2014 if h2014 >= 1 & h2014 <= 5
label values h2014 Health
keep ID h2014
order ID h2014
sort ID
save SRHS2014.dta, replace

clear all
infile using H16C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename PC001 h2016
replace h2016 = 6 - h2016 if h2016 >= 1 & h2016 <= 5
label values h2016 Health
keep ID h2016
order ID h2016
sort ID
save SRHS2016.dta, replace

clear all
infile using H96G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename E2611M1 empa1996
rename E2611M2 empb1996
rename E2611M3 empc1996
label values empa1996 EmpStat
label values empb1996 EmpStat
label values empc1996 EmpStat
keep ID empa1996 empb1996 empc1996
order ID empa1996 empb1996 empc1996
sort ID
save Emp1996.dta, replace
gen w1996 = 0
replace w1996 = 1 if empa == 1
replace w1996 = 1 if empb == 1
replace w1996 = 1 if empc == 1
keep ID w1996
save Work1996.dta, replace

clear all
infile using H98G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename F3115M1 empa1998
rename F3115M2 empb1998
rename F3115M3 empc1998
label values empa1998 EmpStat
label values empb1998 EmpStat
label values empc1998 EmpStat
keep ID empa1998 empb1998 empc1998
order ID empa1998 empb1998 empc1998
sort ID
save Emp1998.dta, replace
gen w1998 = 0
replace w1998 = 1 if empa == 1
replace w1998 = 1 if empb == 1
replace w1998 = 1 if empc == 1
keep ID w1998
save Work1998.dta, replace

clear all
infile using H00G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename G3365M1 empa2000
rename G3365M2 empb2000
rename G3365M3 empc2000
label values empa2000 EmpStat
label values empb2000 EmpStat
label values empc2000 EmpStat
keep ID empa2000 empb2000 empc2000
order ID empa2000 empb2000 empc2000
sort ID
save Emp2000.dta, replace
gen w2000 = 0
replace w2000 = 1 if empa == 1
replace w2000 = 1 if empb == 1
replace w2000 = 1 if empc == 1
keep ID w2000
save Work2000.dta, replace

clear all
infile using H02J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename HJ005M1 empa2002
rename HJ005M2 empb2002
rename HJ005M3 empc2002
label values empa2002 EmpStat
label values empb2002 EmpStat
label values empc2002 EmpStat
keep ID empa2002 empb2002 empc2002
order ID empa2002 empb2002 empc2002
sort ID
save Emp2002.dta, replace
gen w2002 = 0
replace w2002 = 1 if empa == 1
replace w2002 = 1 if empb == 1
replace w2002 = 1 if empc == 1
keep ID w2002
save Work2002.dta, replace

clear all
infile using H04J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename JJ005M1 empa2004
rename JJ005M2 empb2004
rename JJ005M3 empc2004
label values empa2004 EmpStat
label values empb2004 EmpStat
label values empc2004 EmpStat
keep ID empa2004 empb2004 empc2004
order ID empa2004 empb2004 empc2004
sort ID
save Emp2004.dta, replace
gen w2004 = 0
replace w2004 = 1 if empa == 1
replace w2004 = 1 if empb == 1
replace w2004 = 1 if empc == 1
keep ID w2004
save Work2004.dta, replace

clear all
infile using H06J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename KJ005M1 empa2006
rename KJ005M2 empb2006
rename KJ005M3 empc2006
label values empa2006 EmpStat
label values empb2006 EmpStat
label values empc2006 EmpStat
keep ID empa2006 empb2006 empc2006
order ID empa2006 empb2006 empc2006
sort ID
save Emp2006.dta, replace
gen w2006 = 0
replace w2006 = 1 if empa == 1
replace w2006 = 1 if empb == 1
replace w2006 = 1 if empc == 1
keep ID w2006
save Work2006.dta, replace

clear all
infile using H08J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename LJ005M1 empa2008
rename LJ005M2 empb2008
rename LJ005M3 empc2008
label values empa2008 EmpStat
label values empb2008 EmpStat
label values empc2008 EmpStat
keep ID empa2008 empb2008 empc2008
order ID empa2008 empb2008 empc2008
sort ID
save Emp2008.dta, replace
gen w2008 = 0
replace w2008 = 1 if empa == 1
replace w2008 = 1 if empb == 1
replace w2008 = 1 if empc == 1
keep ID w2008
save Work2008.dta, replace

clear all
infile using H10J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename MJ005M1 empa2010
rename MJ005M2 empb2010
rename MJ005M3 empc2010
label values empa2010 EmpStat
label values empb2010 EmpStat
label values empc2010 EmpStat
keep ID empa2010 empb2010 empc2010
order ID empa2010 empb2010 empc2010
sort ID
save Emp2010.dta, replace
gen w2010 = 0
replace w2010 = 1 if empa == 1
replace w2010 = 1 if empb == 1
replace w2010 = 1 if empc == 1
keep ID w2010
save Work2010.dta, replace

clear all
infile using H12J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename NJ005M1 empa2012
rename NJ005M2 empb2012
rename NJ005M3 empc2012
label values empa2012 EmpStat
label values empb2012 EmpStat
label values empc2012 EmpStat
keep ID empa2012 empb2012 empc2012
order ID empa2012 empb2012 empc2012
sort ID
save Emp2012.dta, replace
gen w2012 = 0
replace w2012 = 1 if empa == 1
replace w2012 = 1 if empb == 1
replace w2012 = 1 if empc == 1
keep ID w2012
save Work2012.dta, replace

clear all
infile using H14J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename OJ005M1 empa2014
rename OJ005M2 empb2014
rename OJ005M3 empc2014
label values empa2014 EmpStat
label values empb2014 EmpStat
label values empc2014 EmpStat
keep ID empa2014 empb2014 empc2014
order ID empa2014 empb2014 empc2014
sort ID
save Emp2014.dta, replace
gen w2014 = 0
replace w2014 = 1 if empa == 1
replace w2014 = 1 if empb == 1
replace w2014 = 1 if empc == 1
keep ID w2014
save Work2014.dta, replace

clear all
infile using H16J_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
rename PJ005M1 empa2016
rename PJ005M2 empb2016
rename PJ005M3 empc2016
label values empa2016 EmpStat
label values empb2016 EmpStat
label values empc2016 EmpStat
keep ID empa2016 empb2016 empc2016
order ID empa2016 empb2016 empc2016
sort ID
save Emp2016.dta, replace
gen w2016 = 0
replace w2016 = 1 if empa == 1
replace w2016 = 1 if empb == 1
replace w2016 = 1 if empc == 1
keep ID w2016
save Work2016.dta, replace


clear
use AllHRSrespondents.dta
merge 1:1 ID using SRHS1996.dta
drop _merge
sort ID
merge 1:1 ID using SRHS1998.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2000.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2002.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2004.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2006.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2008.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2010.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2012.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2014.dta
drop _merge
sort ID
merge 1:1 ID using SRHS2016.dta
drop _merge
sort ID
merge 1:1 ID using Work1996.dta
drop _merge
sort ID
merge 1:1 ID using Work1998.dta
drop _merge
sort ID
merge 1:1 ID using Work2000.dta
drop _merge
sort ID
merge 1:1 ID using Work2002.dta
drop _merge
sort ID
merge 1:1 ID using Work2004.dta
drop _merge
sort ID
merge 1:1 ID using Work2006.dta
drop _merge
sort ID
merge 1:1 ID using Work2008.dta
drop _merge
sort ID
merge 1:1 ID using Work2010.dta
drop _merge
sort ID
merge 1:1 ID using Work2012.dta
drop _merge
sort ID
merge 1:1 ID using Work2014.dta
drop _merge
sort ID
merge 1:1 ID using Work2016.dta
drop _merge
sort ID

drop if yeardied <= 1995
drop if yearborn < 1890
drop if yearborn > 2016
drop if firstob > 2016

replace firstob = 1996 if firstob < 1996 & h1996 != .
replace firstob = 1998 if firstob < 1996 & h1998 != .
replace firstob = 2000 if firstob < 1996 & h2000 != .
replace firstob = 2002 if firstob < 1996 & h2002 != .
replace firstob = 2004 if firstob < 1996 & h2004 != .
replace firstob = 2006 if firstob < 1996 & h2006 != .
replace firstob = 2008 if firstob < 1996 & h2008 != .
replace firstob = 2010 if firstob < 1996 & h2010 != .
replace firstob = 2012 if firstob < 1996 & h2012 != .
replace firstob = 2014 if firstob < 1996 & h2014 != .
replace firstob = 2016 if firstob < 1996 & h2016 != .
drop if firstob < 1996

gen age = firstob - yearborn

replace h1996 = 0 if yeardied <= 1996 & h1996 == .
replace h1998 = 0 if yeardied <= 1998 & h1998 == .
replace h2000 = 0 if yeardied <= 2000 & h2000 == .
replace h2002 = 0 if yeardied <= 2002 & h2002 == .
replace h2004 = 0 if yeardied <= 2004 & h2004 == .
replace h2006 = 0 if yeardied <= 2006 & h2006 == .
replace h2008 = 0 if yeardied <= 2008 & h2008 == .
replace h2010 = 0 if yeardied <= 2010 & h2010 == .
replace h2012 = 0 if yeardied <= 2012 & h2012 == .
replace h2014 = 0 if yeardied <= 2014 & h2014 == .
replace h2016 = 0 if yeardied <= 2016 & h2016 == .

save HRSunadjusted.dta, replace

gen x1 = .
gen x2 = .
gen x3 = .
gen x4 = .
gen x5 = .
gen x6 = .
gen x7 = .
gen x8 = .
gen x9 = .
gen x10 = .
gen x11 = .

replace x1 = h1996 if firstob == 1996
replace x2 = h1998 if firstob == 1996
replace x3 = h2000 if firstob == 1996
replace x4 = h2002 if firstob == 1996
replace x5 = h2004 if firstob == 1996
replace x6 = h2006 if firstob == 1996
replace x7 = h2008 if firstob == 1996
replace x8 = h2010 if firstob == 1996
replace x9 = h2012 if firstob == 1996
replace x10 = h2014 if firstob == 1996
replace x11 = h2016 if firstob == 1996

replace x1 = h1998 if firstob == 1998
replace x2 = h2000 if firstob == 1998
replace x3 = h2002 if firstob == 1998
replace x4 = h2004 if firstob == 1998
replace x5 = h2006 if firstob == 1998
replace x6 = h2008 if firstob == 1998
replace x7 = h2010 if firstob == 1998
replace x8 = h2012 if firstob == 1998
replace x9 = h2014 if firstob == 1998
replace x10 = h2016 if firstob == 1998

replace x1 = h2000 if firstob == 2000
replace x2 = h2002 if firstob == 2000
replace x3 = h2004 if firstob == 2000
replace x4 = h2006 if firstob == 2000
replace x5 = h2008 if firstob == 2000
replace x6 = h2010 if firstob == 2000
replace x7 = h2012 if firstob == 2000
replace x8 = h2014 if firstob == 2000
replace x9 = h2016 if firstob == 2000

replace x1 = h2002 if firstob == 2002
replace x2 = h2004 if firstob == 2002
replace x3 = h2006 if firstob == 2002
replace x4 = h2008 if firstob == 2002
replace x5 = h2010 if firstob == 2002
replace x6 = h2012 if firstob == 2002
replace x7 = h2014 if firstob == 2002
replace x8 = h2016 if firstob == 2002

replace x1 = h2004 if firstob == 2004
replace x2 = h2006 if firstob == 2004
replace x3 = h2008 if firstob == 2004
replace x4 = h2010 if firstob == 2004
replace x5 = h2012 if firstob == 2004
replace x6 = h2014 if firstob == 2004
replace x7 = h2016 if firstob == 2004

replace x1 = h2006 if firstob == 2006
replace x2 = h2008 if firstob == 2006
replace x3 = h2010 if firstob == 2006
replace x4 = h2012 if firstob == 2006
replace x5 = h2014 if firstob == 2006
replace x6 = h2016 if firstob == 2006

replace x1 = h2008 if firstob == 2008
replace x2 = h2010 if firstob == 2008
replace x3 = h2012 if firstob == 2008
replace x4 = h2014 if firstob == 2008
replace x5 = h2016 if firstob == 2008

replace x1 = h2010 if firstob == 2010
replace x2 = h2012 if firstob == 2010
replace x3 = h2014 if firstob == 2010
replace x4 = h2016 if firstob == 2010

replace x1 = h2012 if firstob == 2012
replace x2 = h2014 if firstob == 2012
replace x3 = h2016 if firstob == 2012

replace x1 = h2014 if firstob == 2014
replace x2 = h2016 if firstob == 2014

replace x1 = h2016 if firstob == 2016

gen e1 = .
gen e2 = .
gen e3 = .
gen e4 = .
gen e5 = .
gen e6 = .
gen e7 = .
gen e8 = .
gen e9 = .
gen e10 = .
gen e11 = .

replace e1 = w1996 if firstob == 1996
replace e2 = w1998 if firstob == 1996
replace e3 = w2000 if firstob == 1996
replace e4 = w2002 if firstob == 1996
replace e5 = w2004 if firstob == 1996
replace e6 = w2006 if firstob == 1996
replace e7 = w2008 if firstob == 1996
replace e8 = w2010 if firstob == 1996
replace e9 = w2012 if firstob == 1996
replace e10 = w2014 if firstob == 1996
replace e11 = w2016 if firstob == 1996

replace e1 = w1998 if firstob == 1998
replace e2 = w2000 if firstob == 1998
replace e3 = w2002 if firstob == 1998
replace e4 = w2004 if firstob == 1998
replace e5 = w2006 if firstob == 1998
replace e6 = w2008 if firstob == 1998
replace e7 = w2010 if firstob == 1998
replace e8 = w2012 if firstob == 1998
replace e9 = w2014 if firstob == 1998
replace e10 = w2016 if firstob == 1998

replace e1 = w2000 if firstob == 2000
replace e2 = w2002 if firstob == 2000
replace e3 = w2004 if firstob == 2000
replace e4 = w2006 if firstob == 2000
replace e5 = w2008 if firstob == 2000
replace e6 = w2010 if firstob == 2000
replace e7 = w2012 if firstob == 2000
replace e8 = w2014 if firstob == 2000
replace e9 = w2016 if firstob == 2000

replace e1 = w2002 if firstob == 2002
replace e2 = w2004 if firstob == 2002
replace e3 = w2006 if firstob == 2002
replace e4 = w2008 if firstob == 2002
replace e5 = w2010 if firstob == 2002
replace e6 = w2012 if firstob == 2002
replace e7 = w2014 if firstob == 2002
replace e8 = w2016 if firstob == 2002

replace e1 = w2004 if firstob == 2004
replace e2 = w2006 if firstob == 2004
replace e3 = w2008 if firstob == 2004
replace e4 = w2010 if firstob == 2004
replace e5 = w2012 if firstob == 2004
replace e6 = w2014 if firstob == 2004
replace e7 = w2016 if firstob == 2004

replace e1 = w2006 if firstob == 2006
replace e2 = w2008 if firstob == 2006
replace e3 = w2010 if firstob == 2006
replace e4 = w2012 if firstob == 2006
replace e5 = w2014 if firstob == 2006
replace e6 = w2016 if firstob == 2006

replace e1 = w2008 if firstob == 2008
replace e2 = w2010 if firstob == 2008
replace e3 = w2012 if firstob == 2008
replace e4 = w2014 if firstob == 2008
replace e5 = w2016 if firstob == 2008

replace e1 = w2010 if firstob == 2010
replace e2 = w2012 if firstob == 2010
replace e3 = w2014 if firstob == 2010
replace e4 = w2016 if firstob == 2010

replace e1 = w2012 if firstob == 2012
replace e2 = w2014 if firstob == 2012
replace e3 = w2016 if firstob == 2012

replace e1 = w2014 if firstob == 2014
replace e2 = w2016 if firstob == 2014

replace e1 = w2016 if firstob == 2016

gen miss = (x1 == .) | (x1 == 8) | (x1 == 9)
replace x1 = x2 if miss == 1
replace x2 = x3 if miss == 1
replace x3 = x4 if miss == 1
replace x4 = x5 if miss == 1
replace x5 = x6 if miss == 1
replace x6 = x7 if miss == 1
replace x7 = x8 if miss == 1
replace x8 = x9 if miss == 1
replace x9 = x10 if miss == 1
replace x10 = x11 if miss == 1
replace x11 = . if miss == 1
replace e1 = e2 if miss == 1
replace e2 = e3 if miss == 1
replace e3 = e4 if miss == 1
replace e4 = e5 if miss == 1
replace e5 = e6 if miss == 1
replace e6 = e7 if miss == 1
replace e7 = e8 if miss == 1
replace e8 = e9 if miss == 1
replace e9 = e10 if miss == 1
replace e10 = e11 if miss == 1
replace e11 = . if miss == 1
replace age = age + 2 if miss
drop miss

gen miss = x1 == . | (x1 == 8) | (x1 == 9)
replace x1 = x2 if miss == 1
replace x2 = x3 if miss == 1
replace x3 = x4 if miss == 1
replace x4 = x5 if miss == 1
replace x5 = x6 if miss == 1
replace x6 = x7 if miss == 1
replace x7 = x8 if miss == 1
replace x8 = x9 if miss == 1
replace x9 = x10 if miss == 1
replace x10 = x11 if miss == 1
replace x11 = . if miss == 1
replace e1 = e2 if miss == 1
replace e2 = e3 if miss == 1
replace e3 = e4 if miss == 1
replace e4 = e5 if miss == 1
replace e5 = e6 if miss == 1
replace e6 = e7 if miss == 1
replace e7 = e8 if miss == 1
replace e8 = e9 if miss == 1
replace e9 = e10 if miss == 1
replace e10 = e11 if miss == 1
replace e11 = . if miss == 1
replace age = age + 2 if miss
drop miss

gen miss = x1 == . | (x1 == 8) | (x1 == 9)
replace x1 = x2 if miss == 1
replace x2 = x3 if miss == 1
replace x3 = x4 if miss == 1
replace x4 = x5 if miss == 1
replace x5 = x6 if miss == 1
replace x6 = x7 if miss == 1
replace x7 = x8 if miss == 1
replace x8 = x9 if miss == 1
replace x9 = x10 if miss == 1
replace x10 = x11 if miss == 1
replace x11 = . if miss == 1
replace e1 = e2 if miss == 1
replace e2 = e3 if miss == 1
replace e3 = e4 if miss == 1
replace e4 = e5 if miss == 1
replace e5 = e6 if miss == 1
replace e6 = e7 if miss == 1
replace e7 = e8 if miss == 1
replace e8 = e9 if miss == 1
replace e9 = e10 if miss == 1
replace e10 = e11 if miss == 1
replace e11 = . if miss == 1
replace age = age + 2 if miss
drop miss

replace x1 = . if (x1 == 8) | (x1 == 9)
replace x2 = . if (x2 == 8) | (x2 == 9)
replace x3 = . if (x3 == 8) | (x3 == 9)
replace x4 = . if (x4 == 8) | (x4 == 9)
replace x5 = . if (x5 == 8) | (x5 == 9)
replace x6 = . if (x6 == 8) | (x6 == 9)
replace x7 = . if (x7 == 8) | (x7 == 9)
replace x8 = . if (x8 == 8) | (x8 == 9)
replace x9 = . if (x9 == 8) | (x9 == 9)
replace x10 = . if (x10 == 8) | (x10 == 9)
replace x11 = . if (x11 == 8) | (x11 == 9)

drop if x1 == 0
drop if x1 == .
keep ID weight sex age x* e*
sort ID
save HRSall.dta, replace

gen x1a = .
gen x2a = .
gen x3a = .
gen x4a = .
gen x5a = .
gen x6a = .
gen x7a = .
gen x8a = .
gen x9a = .
gen x10a = .
order ID weight sex age x1 x1a x2 x2a x3 x3a x4 x4a x5 x5a x6 x6a x7 x7a x8 x8a x9 x9a x10 x10a x11
keep ID weight sex age x1 x1a x2 x2a x3 x3a x4 x4a x5 x5a x6 x6a x7 x7a x8 x8a x9 x9a x10 x10a x11

* Make estimation dataset with everyone (annual)
outsheet using ..\Estimation\HRSallAnnual.txt, replace noname nolabel

gen source = "HRS"
tostring ID, gen(id)
drop ID
rename sex male
order source id weight
drop if age < 50
sort source id
save HRSforMergeAlt.dta, replace

clear all
use HRSall.dta

gen x1a = .
gen x2a = .
gen x3a = .
gen x4a = .
gen x5a = .
gen x6a = .
gen x7a = .
gen x8a = .
gen x9a = .
gen x10a = .
gen x1b = .
gen x2b = .
gen x3b = .
gen x4b = .
gen x5b = .
gen x6b = .
gen x7b = .
gen x8b = .
gen x9b = .
gen x10b = .
gen x1c = .
gen x2c = .
gen x3c = .
gen x4c = .
gen x5c = .
gen x6c = .
gen x7c = .
gen x8c = .
gen x9c = .
gen x10c = .
order ID weight sex age x1 x1a x1b x1c x2 x2a x2b x2c x3 x3a x3b x3c x4 x4a x4b x4c x5 x5a x5b x5c x6 x6a x6b x6c x7 x7a x7b x7c x8 x8a x8b x8c x9 x9a x9b x9c x10 x10a x10b x10c x11
keep ID weight sex age x1 x1a x1b x1c x2 x2a x2b x2c x3 x3a x3b x3c x4 x4a x4b x4c x5 x5a x5b x5c x6 x6a x6b x6c x7 x7a x7b x7c x8 x8a x8b x8c x9 x9a x9b x9c x10 x10a x10b x10c x11

* Make estimation dataset with everyone (semiannual)
outsheet using ..\Estimation\HRSallSemiannual.txt, replace noname nolabel

gen source = "HRS"
tostring ID, gen(id)
rename sex male
drop ID
order source id weight
drop if age < 50
sort source id
save HRSforMerge.dta, replace

clear all
do PrepareToPredictWork.do


cd Results

clear all
insheet using HRSmenOver50aParamsXhat.txt
rename v1 age
rename v2 h1
rename v3 h2
rename v4 xhat
rename v5 xhatsq
sort age h1 h2
bysort age h1 h2: keep if _n == 1
save ../HRS/MenOver50xHat.dta, replace

clear all
insheet using HRSwomenOver50aParamsXhat.txt
rename v1 age
rename v2 h1
rename v3 h2
rename v4 xhat
rename v5 xhatsq
sort age h1 h2
bysort age h1 h2: keep if _n == 1
save ../HRS/WomenOver50xHat.dta, replace

clear all
cd ..
cd HRS
use HRSpredictWork.dta
keep if sex == 0
sort age h1 h2
merge m:1 age h1 h2 using WomenOver50xHat.dta
keep if _merge == 3
drop _merge
gen agesq = age*age
gen agecu = agesq*age
gen agequ = agecu*age
gen hx = 0
replace hx = 1 if h2 < 3
gen hy = 0
replace hy = 1 if h1 < 3
gen hz = 2*hx + hy
gen hq = 5*(h2-1) + (h1-1)
gen ageSRHS = (h2-1) + floor(age)*5

log using RetRegressWomen.txt, text replace

regress R age agesq agecu i.h2 [aweight=weight]
regress R age agesq agecu i.h2 i.h1 [aweight=weight]
regress R age agesq agecu i.hq [aweight=weight]
regress R i.age i.hq [aweight=weight]
regress R age agesq agecu hx [aweight=weight]
regress R age agesq agecu i.hz [aweight=weight]
regress R age agesq agecu xhat [aweight=weight]
regress R age agesq agecu xhat xhatsq [aweight=weight]
regress R i.ageSRHS [aweight=weight]
capture log close


clear all
cd ..
cd HRS
use HRSpredictWork.dta
keep if sex == 1
sort age h1 h2
merge m:1 age h1 h2 using MenOver50xHat.dta
keep if _merge == 3
drop _merge
gen agesq = age*age
gen agecu = agesq*age
gen agequ = agecu*age
gen hx = 0
replace hx = 1 if h2 < 3
gen hy = 0
replace hy = 1 if h1 < 3
gen hz = 2*hx + hy
gen hq = 5*(h2-1) + (h1-1)
gen ageSRHS = (h2-1) + floor(age)*5

log using RetRegressMen.txt, text replace

regress R age agesq agecu i.h2 [aweight=weight]
regress R age agesq agecu i.h2 i.h1 [aweight=weight]
regress R age agesq agecu i.hq [aweight=weight]
regress R i.age i.hq [aweight=weight]
regress R age agesq agecu hx [aweight=weight]
regress R age agesq agecu i.hz [aweight=weight]
regress R age agesq agecu xhat [aweight=weight]
regress R age agesq agecu xhat xhatsq [aweight=weight]
regress R i.ageSRHS [aweight=weight]
capture log close

cd Results

clear all
insheet using TwoStudyAllOver23HeteroParamsXhat.txt
rename v1 sex
rename v2 age
rename v3 h1
rename v4 h2
rename v5 xhat
rename v6 xhatsq
bysort sex age h1 h2: keep if _n == 1
sort sex age h1 h2
save ../HRS/AllOver23HeteroxHat.dta, replace


clear all
cd ..
cd HRS
use HRSpredictWork.dta
sort sex age h1 h2
merge m:1 sex age h1 h2 using AllOver23HeteroxHat.dta
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

*regress R age agesq agecu i.h2 [aweight=weight] if sex==0 & age >= 50
*regress R age agesq agecu i.h2 i.h1 [aweight=weight] if sex==0 & age >= 50
*regress R age agesq agecu i.hq [aweight=weight] if sex==0 & age >= 50
regress R w0 i.age i.hq [aweight=weight] if sex==0 & age >= 50
*regress R age agesq agecu hx [aweight=weight] if sex==0 & age >= 50
*regress R age agesq agecu i.hz [aweight=weight] if sex==0 & age >= 50
*regress R age agesq agecu xhat [aweight=weight] if sex==0 & age >= 50
regress R w0 age agesq agecu xhat xhatsq [aweight=weight] if sex==0 & age >= 50
*regress R i.ageSRHS [aweight=weight] if sex==0 & age >= 50
capture log close


log using RetRegressMen.txt, text replace

*regress R age agesq agecu i.h2 [aweight=weight] if sex==1 & age >= 50
*regress R age agesq agecu i.h2 i.h1 [aweight=weight] if sex==1 & age >= 50
*regress R age agesq agecu i.hq [aweight=weight] if sex==1 & age >= 50
regress R w0 i.age i.hq [aweight=weight] if sex==1 & age >= 50
*regress R age agesq agecu hx [aweight=weight] if sex==1 & age >= 50
*regress R age agesq agecu i.hz [aweight=weight] if sex==1 & age >= 50
*regress R age agesq agecu xhat [aweight=weight] if sex==1 & age >= 50
regress R w0 age agesq agecu xhat xhatsq [aweight=weight] if sex==1 & age >= 50
*regress R i.ageSRHS [aweight=weight] if sex==1 & age >= 50
capture log close

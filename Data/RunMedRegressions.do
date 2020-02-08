cd Results

clear all
insheet using MEPSmenOver18ParamsXhat.txt
rename v1 age
rename v2 h1
rename v3 h2
rename v4 h3
rename v5 xhat
rename v6 xhatsq
sort age h1 h2 h3
save ../MEPS/MenOver18xHat.dta, replace

clear all
insheet using MEPSwomenOver18ParamsXhat.txt
rename v1 age
rename v2 h1
rename v3 h2
rename v4 h3
rename v5 xhat
rename v6 xhatsq
sort age h1 h2 h3
save ../MEPS/WomenOver18xHat.dta, replace

clear all
cd ..
cd MEPS
use MEPSforMedRegression.dta
keep if male == 0
sort age h1 h2 h3
merge m:1 age h1 h2 h3 using WomenOver18xHat.dta
keep if _merge == 3
drop _merge
gen LogMed = log(totalmed)
gen agesq = age*age
gen agecu = agesq*age
gen agequ = agecu*age
gen SomeMed = 0
replace SomeMed = 1 if totalmed > 0 & totalmed != .
gen hx = 0
replace hx = 1 if h3 < 3
gen hy = 0
replace hy = 1 if h1 < 3
gen hz = 2*hx + hy
*gen xhatsq = xhat*xhat
gen ageSRHS = (h3-1) + floor(age)*5

log using MedRegressWomen.txt, text replace
regress LogMed age i.h3
regress LogMed age agesq agecu agequ i.h3
regress LogMed age hx
regress LogMed age i.hz
regress LogMed age xhat
regress LogMed age xhat xhatsq
regress LogMed age agesq xhat xhatsq
regress LogMed age agesq agecu xhat xhatsq
regress LogMed age agesq agecu agequ xhat xhatsq
regress LogMed i.ageSRHS

probit SomeMed age i.h3
probit SomeMed age hx
probit SomeMed age i.hz
probit SomeMed age xhat
probit SomeMed age xhat xhatsq
probit SomeMed age agesq agecu agequ xhat
probit SomeMed age i.ageSRHS
capture log close


clear all
use MEPSforMedRegression.dta
keep if male == 1
sort age h1 h2 h3
merge m:1 age h1 h2 h3 using MenOver18xHat.dta
keep if _merge == 3
drop _merge
gen LogMed = log(totalmed)
gen agesq = age*age
gen agecu = agesq*age
gen agequ = agecu*age
gen SomeMed = 0
replace SomeMed = 1 if totalmed > 0 & totalmed != .
gen hx = 0
replace hx = 1 if h3 < 3
gen hy = 0
replace hy = 1 if h1 < 3
gen hz = 2*hx + hy
*gen xhatsq = xhat*xhat
gen ageSRHS = (h3-1) + floor(age)*5

log using MedRegressMen.txt, text replace
regress LogMed age i.h3
regress LogMed age agesq agecu agequ i.h3
regress LogMed age hx
regress LogMed age i.hz
regress LogMed age xhat
regress LogMed age xhat xhatsq
regress LogMed age agesq xhat xhatsq
regress LogMed age agesq agecu xhat xhatsq
regress LogMed age agesq agecu agequ xhat xhatsq
regress LogMed i.ageSRHS

probit SomeMed age i.h3
probit SomeMed age hx
probit SomeMed age i.hz
probit SomeMed age xhat
probit SomeMed age xhat xhatsq
probit SomeMed age agesq agecu agequ xhat
probit SomeMed age i.ageSRHS
capture log close

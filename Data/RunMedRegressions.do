cd Results

clear all
insheet using MEPSallOver18HeteroParamsXhat.txt
rename v1 sex
rename v2 age
rename v3 h1
rename v4 h2
rename v5 h3
rename v6 xhat
rename v7 xhatsq
sort sex age h1 h2 h3
save ../MEPS/AllOver18HeteroxHat.dta, replace

clear all
cd ..
cd MEPS
use MEPSforMedRegression.dta
rename male sex
sort sex age h1 h2 h3
merge m:1 sex age h1 h2 h3 using AllOver18HeteroxHat.dta
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
*regress LogMed age i.h3 if sex == 0
*regress LogMed age agesq agecu agequ i.h3 if sex == 0
*regress LogMed age hx if sex == 0
*regress LogMed age i.hz if sex == 0
*regress LogMed age xhat if sex == 0
*regress LogMed age xhat xhatsq if sex == 0
*regress LogMed age agesq xhat xhatsq if sex == 0
regress LogMed age agesq agecu xhat xhatsq if sex == 0
*regress LogMed age agesq agecu agequ xhat xhatsq if sex == 0
regress LogMed i.ageSRHS if sex == 0

*probit SomeMed age i.h3 if sex == 0
*probit SomeMed age hx if sex == 0
*probit SomeMed age i.hz if sex == 0
*probit SomeMed age xhat if sex == 0
*probit SomeMed age xhat xhatsq if sex == 0
*probit SomeMed age agesq agecu agequ xhat if sex == 0
*probit SomeMed age i.ageSRHS if sex == 0
capture log close



log using MedRegressMen.txt, text replace
*regress LogMed age i.h3 if sex == 1
*regress LogMed age agesq agecu agequ i.h3 if sex == 1
*regress LogMed age hx if sex == 1
*regress LogMed age i.hz if sex == 1
*regress LogMed age xhat if sex == 1
*regress LogMed age xhat xhatsq if sex == 1
*regress LogMed age agesq xhat xhatsq if sex == 1
regress LogMed age agesq agecu xhat xhatsq if sex == 1
*regress LogMed age agesq agecu agequ xhat xhatsq if sex == 1
regress LogMed i.ageSRHS if sex == 1

*probit SomeMed age i.h3 if sex == 1
*probit SomeMed age hx if sex == 1
*probit SomeMed age i.hz if sex == 1
*probit SomeMed age xhat if sex == 1
*probit SomeMed age xhat xhatsq if sex == 1
*probit SomeMed age agesq agecu agequ xhat if sex == 1
*probit SomeMed age i.ageSRHS if sex == 1
capture log close

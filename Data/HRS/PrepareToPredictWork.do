clear all
use HRSall.dta
rename x1 h1
rename x2 h2
rename e1 w0
rename e2 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 0
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x2 h1
rename x3 h2
rename e2 w0
rename e3 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 2
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x3 h1
rename x4 h2
rename e3 w0
rename e4 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 4
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x4 h1
rename x5 h2
rename e4 w0
rename e5 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 6
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x5 h1
rename x6 h2
rename e5 w0
rename e6 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 8
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x6 h1
rename x7 h2
rename e6 w0
rename e7 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 10
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x7 h1
rename x8 h2
rename e7 w0
rename e8 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 12
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x8 h1
rename x9 h2
rename e8 w0
rename e9 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 14
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x9 h1
rename x10 h2
rename e9 w0
rename e10 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 14
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

clear all
use HRSall.dta
rename x10 h1
rename x11 h2
rename e10 w0
rename e11 w1
keep if h1 != . & h2 != .
gen R = 0
replace R = 1 if w1 == 0
replace age = age + 14
order weight sex age h1 h2 R
keep weight sex age h1 h2 R
append using HRSpredictWork.dta
save HRSpredictWork.dta, replace

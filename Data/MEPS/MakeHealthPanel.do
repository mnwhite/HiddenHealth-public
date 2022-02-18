clear
set more off

forvalues i=1/20 {
    local y = `i' + 1995
	use raw`y'.dta
	keep DUPERSID WEIGHT PSTATS* RTHLTH* MNHLTH* AGE31X AGE42X PANEL SEX
	keep if PANEL == `i'
	keep if AGE31X >= 0
	keep if AGE31X < 85
	replace AGE31X = AGE31X + 0.5 if AGE42X > AGE31X
	gen male = 2 - SEX
	gen h1 = 6 - RTHLTH31 if RTHLTH31 > 0
	gen h2 = 6 - RTHLTH42 if RTHLTH42 > 0
	gen h3 = 6 - RTHLTH53 if RTHLTH53 > 0
	keep if h1 != .
	replace h2 = 0 if PSTATS42 == 31
	replace h3 = 0 if PSTATS42 == 31
	replace h3 = 0 if PSTATS53 == 31
	gen m1 = 6 - MNHLTH31 if MNHLTH31 > 0
	gen m2 = 6 - MNHLTH42 if MNHLTH42 > 0
	gen m3 = 6 - MNHLTH53 if MNHLTH53 > 0
	replace m2 = -1 if PSTATS42 == 31
	replace m3 = -1 if PSTATS42 == 31
	replace m3 = -1 if PSTATS53 == 31
	rename AGE31X age
	keep DUPERSID PANEL WEIGHT male age h* m*
	order DUPERSID PANEL WEIGHT male age h1 m1 h2 m2 h3 m3
	sort DUPERSID
	save Panel`i'Health.dta, replace
	clear
	local y = `y' + 1
	use raw`y'.dta
	keep DUPERSID PSTATS* RTHLTH* MNHLTH* PANEL TOTEXP*
	keep if PANEL == `i'
	gen totalmed = TOTEXP
	gen h4 = 6 - RTHLTH42 if RTHLTH42 > 0
	gen h5 = 6 - RTHLTH53 if RTHLTH53 > 0
	replace h4 = 0 if PSTATS31 == 31 & PANEL == 1
	replace h5 = 0 if PSTATS31 == 31 & PANEL == 1
	replace h4 = 0 if PSTATS42 == 31
	replace h5 = 0 if PSTATS42 == 31
	replace h5 = 0 if PSTATS53 == 31
	gen m4 = 6 - MNHLTH42 if MNHLTH42 > 0
	gen m5 = 6 - MNHLTH53 if MNHLTH53 > 0
	replace m4 = -1 if PSTATS31 == 31 & PANEL == 1
	replace m5 = -1 if PSTATS31 == 31 & PANEL == 1
	replace m4 = -1 if PSTATS42 == 31
	replace m5 = -1 if PSTATS42 == 31
	replace m5 = -1 if PSTATS53 == 31
	merge 1:1 DUPERSID using Panel`i'Health.dta
	replace h3 = 6 - RTHLTH31 if PANEL == 1 & RTHLTH31 > 0
	replace h3 = 0 if PSTATS31 == 31 & PANEL == 1
	replace m3 = 6 - MNHLTH31 if PANEL == 1 & MNHLTH31 > 0
	replace m3 = -1 if PSTATS31 == 31 & PANEL == 1
	drop RTHLTH31
	gen panel = PANEL + 0
	rename WEIGHT weight
	keep DUPERSID panel weight male age h* m* totalmed _merge
	order DUPERSID panel weight male age h1 m1 h2 m2 h3 m3 h4 m4 h5 m5
	drop if _merge == 1
	drop _merge
	save Panel`i'Health.dta, replace
}

clear
use Panel1Health.dta
forvalues i=2/20 {
	append using Panel`i'Health.dta
}
save PanelHealth.dta, replace
drop totalmed
outsheet using ..\Estimation\MEPSallPhysAndMent.txt, nolabel nonames replace
tab panel

keep DUPERSID panel weight male age h*
outsheet using ..\Estimation\MEPSall.txt, nolabel nonames replace

gen source = "MEPS"
rename DUPERSID id
rename h1 x1
rename h2 x2
rename h3 x3
rename h4 x4
rename h5 x5
keep source id weight male age x*
order source id weight male age x*
egen weightsum = sum(weight)
replace weight = weight/weightsum
drop weightsum
sort source id
save MEPSforMerge.dta, replace

clear
use PanelHealth.dta
keep weight male age h1 h2 h3 totalmed
save MEPSforMedRegression.dta, replace


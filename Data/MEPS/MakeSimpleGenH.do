clear
set more off

forvalues i=5/20 {
    local y = `i' + 1995
	use raw`y'.dta
	keep DUPERSID WEIGHT AGE31X AGE42X PANEL SEX PSTATS* ADGENH42
	keep if PANEL == `i'
	keep if AGE31X >= 0
	keep if AGE31X < 85
	replace AGE31X = AGE31X + 0.5 if AGE42X > AGE31X
	gen male = 2 - SEX
	
	* general health rating (5)
	gen genh2 = 6 - ADGENH42 if ADGENH42 > 0
	replace genh2 = 0 if PSTATS31 == 31
	replace genh2 = 0 if PSTATS42 == 31
	
	rename AGE31X age
	rename WEIGHT weight
	keep DUPERSID PANEL weight male age genh2
	order DUPERSID PANEL weight male age genh2
	sort DUPERSID
	save Panel`i'GenH.dta, replace
	
	clear
	local y = `y' + 1
	use raw`y'.dta
	keep DUPERSID PANEL SEX PSTATS* ADGENH42
	keep if PANEL == `i'
	
	* general health rating (5)
	gen genh4 = 6 - ADGENH42 if ADGENH42 > 0
	replace genh4 = 0 if PSTATS31 == 31
	replace genh4 = 0 if PSTATS42 == 31
	
	merge 1:1 DUPERSID using Panel`i'GenH.dta
	drop if _merge == 1
	
	gen panel = PANEL + 0
	keep DUPERSID panel weight male age genh2 genh4
	order DUPERSID panel weight male age genh2 genh4
	save Panel`i'GenH.dta, replace
}

clear
use Panel5GenH.dta
forvalues i=6/20 {
	append using Panel`i'GenH.dta
}

save PanelGenH.dta, replace

keep DUPERSID panel weight male age genh2 genh4
keep if genh2 !=.
drop if genh2 == 0
gen source = "MEPS"
rename DUPERSID id
rename genh2 x1
rename genh4 x1a
keep source id weight male age x1 x1a
order source id weight male age x1 x1a
sort source id
save MEPSforMergeAlt.dta, replace

clear all
set more off

use PanelHealth.dta
drop m1 m2 m3 m4 m5
keep if age >= 18

gen b1 = .
replace b1 = 0 if h1 > 0 & h1 != .
replace b1 = 1 if h1 > 2 & h1 != .
gen b2 = .
replace b2 = 0 if h2 > 0 & h2 != .
replace b2 = 1 if h2 > 2 & h2 != .
gen b3 = .
replace b3 = 0 if h3 > 0 & h3 != .
replace b3 = 1 if h3 > 2 & h3 != .
gen b4 = .
replace b4 = 0 if h4 > 0 & h4 != .
replace b4 = 1 if h4 > 2 & h4 != .
gen b5 = .
replace b5 = 0 if h5 > 0 & h5 != .
replace b5 = 1 if h5 > 2 & h5 != .

gen dead = .
replace dead = 1 if h5 == 0
replace dead = 0 if h5 > 0 & h5 != .

tab panel, gen(pn)
drop pn1

gen agesq = age*age
gen agecu = age*agesq
gen agequ = age*agecu

gen logmed = log(totalmed + 0)

regress logmed age agesq agecu pn* [aweight=weight] if male == 0
regress logmed age agesq agecu pn* [aweight=weight] if male == 1

regress logmed age agesq agecu b3 b1 pn* [aweight=weight] if male == 0
regress logmed age agesq agecu b3 b1 pn* [aweight=weight] if male == 1

probit dead age agesq [pweight=weight] if male == 0
probit dead age agesq [pweight=weight] if male == 1

probit dead age b3 b1 [pweight=weight] if male == 0
probit dead age b3 b1 [pweight=weight] if male == 1


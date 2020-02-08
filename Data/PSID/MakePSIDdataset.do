clear all
do MakeWeights.do

clear all
do J264007.do
do J264007_formats.do

drop ER30000
rename ER30001 famid
rename ER30002 PN
rename ER32000 sex
rename ER32050 deathyear

rename ER33401 id97
rename ER33402 seq97
rename ER33403 rel97
rename ER33406 born97

rename ER33501 id99
rename ER33502 seq99
rename ER33503 rel99
rename ER33506 born99

rename ER33601 id01
rename ER33602 seq01
rename ER33603 rel01
rename ER33606 born01

rename ER33701 id03
rename ER33702 seq03
rename ER33703 rel03
rename ER33706 born03

rename ER33801 id05
rename ER33802 seq05
rename ER33803 rel05
rename ER33806 born05

rename ER33901 id07
rename ER33902 seq07
rename ER33903 rel07
rename ER33906 born07

rename ER34001 id09
rename ER34002 seq09
rename ER34003 rel09
rename ER34006 born09

rename ER34101 id11
rename ER34102 seq11
rename ER34103 rel11
rename ER34106 born11

rename ER34201 id13
rename ER34202 seq13
rename ER34203 rel13
rename ER34206 born13

rename ER34301 id15
rename ER34302 seq15
rename ER34303 rel15
rename ER34307 born15

rename ER34501 id17
rename ER34502 seq17
rename ER34503 rel17
rename ER34506 born17

gen birthyear = .
replace birthyear = born97
replace birthyear = born99 if birthyear == 0
replace birthyear = born01 if birthyear == 0
replace birthyear = born03 if birthyear == 0
replace birthyear = born05 if birthyear == 0
replace birthyear = born07 if birthyear == 0
replace birthyear = born09 if birthyear == 0
replace birthyear = born11 if birthyear == 0
replace birthyear = born13 if birthyear == 0
replace birthyear = born15 if birthyear == 0
replace birthyear = born17 if birthyear == 0
drop if birthyear == 0
drop if birthyear == 9999

order famid PN sex birthyear deathyear
drop born*

gen h1997 = .
gen h1999 = .
gen h2001 = .
gen h2003 = .
gen h2005 = .
gen h2007 = .
gen h2009 = .
gen h2011 = .
gen h2013 = .
gen h2015 = .
gen h2017 = .

sort famid PN
merge 1:1 famid PN using PSIDweights.dta
drop _merge

save IndWaveHistory.dta, replace
clear all

do J263970.do
do J263970_formats.do

* Heads 1997
preserve
keep ER10002 ER11723
rename ER10002 id
keep if id != .
gen h1997 = 6 - ER11723 if ER11723 < 6 & ER11723 > 0
drop ER11723
gen rel = 1
sort id rel
save Heads1997.dta, replace
restore

* Wives 1997
preserve
keep ER10002 ER11727
rename ER10002 id
keep if id != . & ER11727 > 0
gen h1997 = 6 - ER11727 if ER11727 < 6 & ER11727 > 0
drop ER11727
gen rel = 2
sort id rel
save Wives1997.dta, replace
restore

* Heads 1999
preserve
keep ER13002 ER15447
rename ER13002 id
keep if id != .
gen h1999 = 6 - ER15447 if ER15447 < 6 & ER15447 > 0
drop ER15447
gen rel = 1
sort id rel
save Heads1999.dta, replace
restore

* Wives 1999
preserve
keep ER13002 ER15555
rename ER13002 id
keep if id != . & ER15555 > 0
gen h1999 = 6 - ER15555 if ER15555 < 6 & ER15555 > 0
drop ER15555
gen rel = 2
sort id rel
save Wives1999.dta, replace
restore

* Heads 2001
preserve
keep ER17002 ER19612
rename ER17002 id
keep if id != .
gen h2001 = 6 - ER19612 if ER19612 < 6 & ER19612 > 0
drop ER19612
gen rel = 1
sort id rel
save Heads2001.dta, replace
restore

* Wives 2001
preserve
keep ER17002 ER19720
rename ER17002 id
keep if id != . & ER19720 > 0
gen h2001 = 6 - ER19720 if ER19720 < 6 & ER19720 > 0
drop ER19720
gen rel = 2
sort id rel
save Wives2001.dta, replace
restore

* Heads 2003
preserve
keep ER21002 ER23009
rename ER21002 id
keep if id != .
gen h2003 = 6 - ER23009 if ER23009 < 6 & ER23009 > 0
drop ER23009
gen rel = 1
sort id rel
save Heads2003.dta, replace
restore

* Wives 2003
preserve
keep ER21002 ER23136
rename ER21002 id
keep if id != . & ER23136 > 0
gen h2003 = 6 - ER23136 if ER23136 < 6 & ER23136 > 0
drop ER23136
gen rel = 2
sort id rel
save Wives2003.dta, replace
restore

* Heads 2005
preserve
keep ER25002 ER26990
rename ER25002 id
keep if id != .
gen h2005 = 6 - ER26990 if ER26990 < 6 & ER26990 > 0
drop ER26990
gen rel = 1
sort id rel
save Heads2005.dta, replace
restore

* Wives 2005
preserve
keep ER25002 ER27113
rename ER25002 id
keep if id != . & ER27113 > 0
gen h2005 = 6 - ER27113 if ER27113 < 6 & ER27113 > 0
drop ER27113
gen rel = 2
sort id rel
save Wives2005.dta, replace
restore

* Heads 2007
preserve
keep ER36002 ER38202
rename ER36002 id
keep if id != .
gen h2007 = 6 - ER38202 if ER38202 < 6 & ER38202 > 0
drop ER38202
gen rel = 1
sort id rel
save Heads2007.dta, replace
restore

* Wives 2007
preserve
keep ER36002 ER39299
rename ER36002 id
keep if id != . & ER39299 > 0
gen h2007 = 6 - ER39299 if ER39299 < 6 & ER39299 > 0
drop ER39299
gen rel = 2
sort id rel
save Wives2007.dta, replace
restore

* Heads 2009
preserve
keep ER42002 ER44175
rename ER42002 id
keep if id != .
gen h2009 = 6 - ER44175 if ER44175 < 6 & ER44175 > 0
drop ER44175
gen rel = 1
sort id rel
save Heads2009.dta, replace
restore

* Wives 2009
preserve
keep ER42002 ER45272
rename ER42002 id
keep if id != . & ER45272 > 0
gen h2009 = 6 - ER45272 if ER45272 < 6 & ER45272 > 0
drop ER45272
gen rel = 2
sort id rel
save Wives2009.dta, replace
restore

* Heads 2011
preserve
keep ER47302 ER49494
rename ER47302 id
keep if id != .
gen h2011 = 6 - ER49494 if ER49494 < 6 & ER49494 > 0
drop ER49494
gen rel = 1
sort id rel
save Heads2011.dta, replace
restore

* Wives 2011
preserve
keep ER47302 ER50612
rename ER47302 id
keep if id != . & ER50612 > 0
gen h2011 = 6 - ER50612 if ER50612 < 6 & ER50612 > 0
drop ER50612
gen rel = 2
sort id rel
save Wives2011.dta, replace
restore

* Heads 2013
preserve
keep ER53002 ER55244
rename ER53002 id
keep if id != .
gen h2013 = 6 - ER55244 if ER55244 < 6 & ER55244 > 0
drop ER55244
gen rel = 1
sort id rel
save Heads2013.dta, replace
restore

* Wives 2013
preserve
keep ER53002 ER56360
rename ER53002 id
keep if id != . & ER56360 > 0
gen h2013 = 6 - ER56360 if ER56360 < 6 & ER56360 > 0
drop ER56360
gen rel = 2
sort id rel
save Wives2013.dta, replace
restore

* Heads 2015
preserve
keep ER60002 ER62366
rename ER60002 id
keep if id != .
gen h2015 = 6 - ER62366 if ER62366 < 6 & ER62366 > 0
drop ER62366
gen rel = 1
sort id rel
save Heads2015.dta, replace
restore

* Wives 2015
preserve
keep ER60002 ER63482
rename ER60002 id
keep if id != . & ER63482 > 0
gen h2015 = 6 - ER63482 if ER63482 < 6 & ER63482 > 0
drop ER63482
gen rel = 2
sort id rel
save Wives2015.dta, replace
restore

* Heads 2017
preserve
keep ER66002 ER68420
rename ER66002 id
keep if id != .
gen h2017 = 6 - ER68420 if ER68420 < 6 & ER68420 > 0
drop ER68420
gen rel = 1
sort id rel
save Heads2017.dta, replace
restore

* Wives 2017
preserve
keep ER66002 ER69547
rename ER66002 id
keep if id != . & ER69547 > 0
gen h2017 = 6 - ER69547 if ER69547 < 6 & ER69547 > 0
drop ER69547
gen rel = 2
sort id rel
save Wives2017.dta, replace
restore

clear all
use IndWaveHistory.dta

* Merge in 1997 data
gen id = id97
gen rel = .
replace rel = 1 if seq97 < 20 & rel97 == 10
replace rel = 2 if seq97 < 20 & (rel97 == 20 | rel97 == 22)
sort id rel

merge m:1 id rel using Heads1997.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives1997.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 1999 data
gen id = id99
gen rel = .
replace rel = 1 if seq99 < 20 & rel99 == 10
replace rel = 2 if seq99 < 20 & (rel99 == 20 | rel99 == 22)
sort id rel

merge m:1 id rel using Heads1999.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives1999.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2001 data
gen id = id01
gen rel = .
replace rel = 1 if seq01 < 20 & rel01 == 10
replace rel = 2 if seq01 < 20 & (rel01 == 20 | rel01 == 22)
sort id rel

merge m:1 id rel using Heads2001.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2001.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2003 data
gen id = id03
gen rel = .
replace rel = 1 if seq03 < 20 & rel03 == 10
replace rel = 2 if seq03 < 20 & (rel03 == 20 | rel03 == 22)
sort id rel

merge m:1 id rel using Heads2003.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2003.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2005 data
gen id = id05
gen rel = .
replace rel = 1 if seq05 < 20 & rel05 == 10
replace rel = 2 if seq05 < 20 & (rel05 == 20 | rel05 == 22)
sort id rel

merge m:1 id rel using Heads2005.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2005.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2007 data
gen id = id07
gen rel = .
replace rel = 1 if seq07 < 20 & rel07 == 10
replace rel = 2 if seq07 < 20 & (rel07 == 20 | rel07 == 22)
sort id rel

merge m:1 id rel using Heads2007.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2007.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2009 data
gen id = id09
gen rel = .
replace rel = 1 if seq09 < 20 & rel09 == 10
replace rel = 2 if seq09 < 20 & (rel09 == 20 | rel09 == 22)
sort id rel

merge m:1 id rel using Heads2009.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2009.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2011 data
gen id = id11
gen rel = .
replace rel = 1 if seq11 < 20 & rel11 == 10
replace rel = 2 if seq11 < 20 & (rel11 == 20 | rel11 == 22)
sort id rel

merge m:1 id rel using Heads2011.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2011.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2013 data
gen id = id13
gen rel = .
replace rel = 1 if seq13 < 20 & rel13 == 10
replace rel = 2 if seq13 < 20 & (rel13 == 20 | rel13 == 22)
sort id rel

merge m:1 id rel using Heads2013.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2013.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2015 data
gen id = id15
gen rel = .
replace rel = 1 if seq15 < 20 & rel15 == 10
replace rel = 2 if seq15 < 20 & (rel15 == 20 | rel15 == 22)
sort id rel

merge m:1 id rel using Heads2015.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2015.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Merge in 2017 data
gen id = id17
gen rel = .
replace rel = 1 if seq17 < 20 & rel17 == 10
replace rel = 2 if seq17 < 20 & (rel17 == 20 | rel17 == 22)
sort id rel

merge m:1 id rel using Heads2017.dta, update
drop if _merge == 2
drop _merge

merge m:1 id rel using Wives2017.dta, update
drop if _merge == 2
drop _merge

drop id rel

* Trim variables
keep famid PN wt* sex birthyear deathyear h*
replace deathyear = . if deathyear == 0

* Count living observations
gen count = 0
replace count = count + 1 if h1997 != .
replace count = count + 1 if h1999 != .
replace count = count + 1 if h2001 != .
replace count = count + 1 if h2003 != .
replace count = count + 1 if h2005 != .
replace count = count + 1 if h2007 != .
replace count = count + 1 if h2009 != .
replace count = count + 1 if h2011 != .
replace count = count + 1 if h2013 != .
replace count = count + 1 if h2015 != .
replace count = count + 1 if h2017 != .
drop if count == 0

* Fill in dead observations
replace h1997 = 0 if deathyear <= 1997 & h1997 == .
replace h1999 = 0 if deathyear <= 1999 & h1999 == .
replace h2001 = 0 if deathyear <= 2001 & h2001 == .
replace h2003 = 0 if deathyear <= 2003 & h2003 == .
replace h2005 = 0 if deathyear <= 2005 & h2005 == .
replace h2007 = 0 if deathyear <= 2007 & h2007 == .
replace h2009 = 0 if deathyear <= 2009 & h2009 == .
replace h2011 = 0 if deathyear <= 2011 & h2011 == .
replace h2013 = 0 if deathyear <= 2013 & h2013 == .
replace h2015 = 0 if deathyear <= 2015 & h2015 == .
replace h2017 = 0 if deathyear <= 2017 & h2017 == .

* Find first observed wave
gen firstob = .
replace firstob = 1997 if h1997 != . & firstob == .
replace firstob = 1999 if h1999 != . & firstob == .
replace firstob = 2001 if h2001 != . & firstob == .
replace firstob = 2003 if h2003 != . & firstob == .
replace firstob = 2005 if h2005 != . & firstob == .
replace firstob = 2007 if h2007 != . & firstob == .
replace firstob = 2009 if h2009 != . & firstob == .
replace firstob = 2011 if h2011 != . & firstob == .
replace firstob = 2013 if h2013 != . & firstob == .
replace firstob = 2015 if h2015 != . & firstob == .
replace firstob = 2017 if h2017 != . & firstob == .

* Define weight based on first observed wave
gen weight = .
replace weight = wt97 if firstob == 1997
replace weight = wt99 if firstob == 1999
replace weight = wt01 if firstob == 2001
replace weight = wt03 if firstob == 2003
replace weight = wt05 if firstob == 2005
replace weight = wt07 if firstob == 2007
replace weight = wt09 if firstob == 2009
replace weight = wt11 if firstob == 2011
replace weight = wt13 if firstob == 2013
replace weight = wt15 if firstob == 2015
replace weight = wt17 if firstob == 2017

* Initialize SRHS observations starting from first observed period
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

* Fill in those SRHS observations
gen these = 0
replace these = 1 if firstob == 1997
replace x1 = h1997 if these == 1
replace x2 = h1999 if these == 1
replace x3 = h2001 if these == 1
replace x4 = h2003 if these == 1
replace x5 = h2005 if these == 1
replace x6 = h2007 if these == 1
replace x7 = h2009 if these == 1
replace x8 = h2011 if these == 1
replace x9 = h2013 if these == 1
replace x10 = h2015 if these == 1
replace x11 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 1999
replace x1 = h1999 if these == 1
replace x2 = h2001 if these == 1
replace x3 = h2003 if these == 1
replace x4 = h2005 if these == 1
replace x5 = h2007 if these == 1
replace x6 = h2009 if these == 1
replace x7 = h2011 if these == 1
replace x8 = h2013 if these == 1
replace x9 = h2015 if these == 1
replace x10 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2001
replace x1 = h2001 if these == 1
replace x2 = h2003 if these == 1
replace x3 = h2005 if these == 1
replace x4 = h2007 if these == 1
replace x5 = h2009 if these == 1
replace x6 = h2011 if these == 1
replace x7 = h2013 if these == 1
replace x8 = h2015 if these == 1
replace x9 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2003
replace x1 = h2003 if these == 1
replace x2 = h2005 if these == 1
replace x3 = h2007 if these == 1
replace x4 = h2009 if these == 1
replace x5 = h2011 if these == 1
replace x6 = h2013 if these == 1
replace x7 = h2015 if these == 1
replace x8 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2005
replace x1 = h2005 if these == 1
replace x2 = h2007 if these == 1
replace x3 = h2009 if these == 1
replace x4 = h2011 if these == 1
replace x5 = h2013 if these == 1
replace x6 = h2015 if these == 1
replace x7 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2007
replace x1 = h2007 if these == 1
replace x2 = h2009 if these == 1
replace x3 = h2011 if these == 1
replace x4 = h2013 if these == 1
replace x5 = h2015 if these == 1
replace x6 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2009
replace x1 = h2009 if these == 1
replace x2 = h2011 if these == 1
replace x3 = h2013 if these == 1
replace x4 = h2015 if these == 1
replace x5 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2011
replace x1 = h2011 if these == 1
replace x2 = h2013 if these == 1
replace x3 = h2015 if these == 1
replace x4 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2013
replace x1 = h2013 if these == 1
replace x2 = h2015 if these == 1
replace x3 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2015
replace x1 = h2015 if these == 1
replace x2 = h2017 if these == 1
drop these

gen these = 0
replace these = 1 if firstob == 2017
replace x1 = h2017 if these == 1
drop these

* Adjust and trim variables again
gen UID = famid*1000 + PN
gen male = 2 - sex
gen age = firstob - birthyear
drop if x1 == 0
keep UID weight male age x*
order UID weight male age x*

* Save data as dta file
sort UID
save PSIDall.dta, replace

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
order UID weight male age x1 x1a x2 x2a x3 x3a x4 x4a x5 x5a x6 x6a x7 x7a x8 x8a x9 x9a x10 x10a x11

* Make estimation data file for everyone (annual data)
outsheet using ..\Estimation\PSIDallAnnual.txt, replace noname nolabel

gen source = "PSID"
tostring UID, gen(id)
drop UID
order source id weight
drop if age < 24
sort source id
save PSIDforMergeAlt.dta, replace

clear all
use PSIDall.dta

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
order UID weight male age x1 x1a x1b x1c x2 x2a x2b x2c x3 x3a x3b x3c x4 x4a x4b x4c x5 x5a x5b x5c x6 x6a x6b x6c x7 x7a x7b x7c x8 x8a x8b x8c x9 x9a x9b x9c x10 x10a x10b x10c x11

* Make estimation data file for everyone (semi-annual data)
outsheet using ..\Estimation\PSIDallSemiannual.txt, replace noname nolabel

gen source = "PSID"
tostring UID, gen(id)
drop UID
order source id weight
drop if age < 24
sort source id
save PSIDforMerge.dta, replace

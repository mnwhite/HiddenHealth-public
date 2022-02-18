do ExtractFrailty96.do
do ExtractFrailty98.do
do ExtractFrailty00.do
do ExtractFrailty02.do
do ExtractFrailty04.do
do ExtractFrailty06.do
do ExtractFrailty08.do
do ExtractFrailty10.do
do ExtractFrailty12.do
do ExtractFrailty14.do
do ExtractFrailty16.do

clear all
use FrailtyData96.dta
merge 1:1 ID using FrailtyData98.dta
drop _merge
merge 1:1 ID using FrailtyData00.dta
drop _merge
merge 1:1 ID using FrailtyData02.dta
drop _merge
merge 1:1 ID using FrailtyData04.dta
drop _merge
merge 1:1 ID using FrailtyData06.dta
drop _merge
merge 1:1 ID using FrailtyData08.dta
drop _merge
merge 1:1 ID using FrailtyData10.dta
drop _merge
merge 1:1 ID using FrailtyData12.dta
drop _merge
merge 1:1 ID using FrailtyData14.dta
drop _merge
merge 1:1 ID using FrailtyData16.dta
drop _merge

order ID F*

gen Height = .
replace Height = Ht1996 if Ht1996 != .
replace Height = Ht1998 if Ht1998 != .
replace Height = Ht2000 if Ht2000 != .
replace Height = Ht2002 if Ht2002 != .
replace Height = Ht2004 if Ht2004 != .
replace Height = Ht2006 if Ht2006 != .
replace Height = Ht2008 if Ht2008 != .
replace Height = Ht2010 if Ht2010 != .
replace Height = Ht2012 if Ht2012 != .
replace Height = Ht2014 if Ht2014 != .
replace Height = Ht2016 if Ht2016 != .

drop Ht* Wt* Height

replace F1996 = F1996 / 29
replace F1998 = F1998 / 29
replace F2000 = F2000 / 29
replace F2002 = F2002 / 29
replace F2004 = F2004 / 29
replace F2006 = F2006 / 29
replace F2008 = F2008 / 29
replace F2010 = F2010 / 29
replace F2012 = F2012 / 29
replace F2014 = F2014 / 29
replace F2016 = F2016 / 29

sort ID
merge 1:1 ID using AllHRSrespondents.dta
keep if _merge == 3
drop _merge

order ID sex yearborn yeardied firstob weight F* X*
save FrailtyDataAll.dta, replace

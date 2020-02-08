clear
set more off

* non-round 2/4 questions (2000-2016): ACTLIM31 ACTLIM53
* SF-12v2 (2003-2016): ADCAPE42 ADNRGY42 ADDOWN42 ADCLIM42 ADDAYA42 ADGENH42 ADMALS42 ADWMLM42 ADPALS42 ADPWLM42 ADPAIN42 ADSOCA42
* SF-12v1 (2000-2002): ADCALM42 ADPEP42  ADBLUE42 ADCLIM42 ADDAYA42 ADGENH42 ADMACC42 ADMLMT42 ADPACC42 ADPLMT42 ADPAIN42 ADSOCA42
* mental past 30 days (2004-2016): ADEFRT42 ADHOPE42 ADNERV42 ADREST42 ADSAD42 ADWRTH42
* mental past 2 weeks (2004-2016): ADDPRS42 ADINTR42
* EQ-5D (2000-2003): ADACTI42 ADDEPR42 ADMOBI42 ADPAYN42 ADSELF42
* opinions (2000-2016): ADOVER42 ADRISK42 ADINSA42 ADINSB42

* SF-12 v1 to v2 change: accomplished less & limited in kind (phys and ment) switched from yes/no to time scale
* SF-12 v1 to v2 change: calm, energy, down switched from 6 point time scale to 5 point (removed "a good bit of the time")
   

forvalues i=9/20 {
    local y = `i' + 1995
	use raw`y'.dta
	keep DUPERSID WEIGHT AGE31X AGE42X PANEL SEX PSTATS* RTHLTH* MNHLTH* ACTLIM* ADCAPE42 ADNRGY42 ADDOWN42 ADCLIM42 ADDAYA42 ADGENH42 ADMALS42 ADMWLM42 ADPALS42 ADPWLM42 ADPAIN42 ADSOCA42 ADEFRT42 ADHOPE42 ADNERV42 ADREST42 ADSAD42 ADWRTH42 ADDPRS42 ADINTR42 ADOVER42 ADRISK42 ADINSA42 ADINSB42
	keep if PANEL == `i'
	keep if AGE31X >= 0
	keep if AGE31X < 85
	replace AGE31X = AGE31X + 0.5 if AGE42X > AGE31X
	gen male = 2 - SEX
	
	* general rating of physical health (5)
	gen phys1 = 6 - RTHLTH31 if RTHLTH31 > 0
	gen phys2 = 6 - RTHLTH42 if RTHLTH42 > 0
	gen phys3 = 6 - RTHLTH53 if RTHLTH53 > 0
	keep if phys1 != .
	replace phys2 = 0 if PSTATS42 == 31
	replace phys3 = 0 if PSTATS42 == 31
	replace phys3 = 0 if PSTATS53 == 31
	
	* general rating of mental health (5)
	gen ment1 = 6 - MNHLTH31 if MNHLTH31 > 0
	gen ment2 = 6 - MNHLTH42 if MNHLTH42 > 0
	gen ment3 = 6 - MNHLTH53 if MNHLTH53 > 0
	replace ment2 = . if PSTATS42 == 31
	replace ment3 = . if PSTATS42 == 31
	replace ment3 = . if PSTATS53 == 31
	
	* any limits on work / housework / schoolwork (2)
	gen actlim1 = ACTLIM31 if ACTLIM31 > 0
	gen actlim2 = .
	gen actlim3 = ACTLIM53 if ACTLIM53 > 0
	
	* general health rating (5)
	gen genh1 = .
	gen genh2 = 6 - ADGENH42 if ADGENH42 > 0
	gen genh3 = .
	
	* does health limit climbing several flights of stairs? (3)
	gen climb1 = .
	gen climb2 = ADCLIM42 if ADCLIM42 > 0
	gen climb3 = .
	
	* does health limit moderate activities? (3)
	gen modact1 = .
	gen modact2 = ADDAYA42 if ADDAYA42 > 0
	gen modact3 = .
	
	* accomplish less because of physical problems? (5)
	gen acclessP1 = .
	gen acclessP2 = ADPALS42 if ADPALS42 > 0
	gen acclessP3 = .
	
	* limited in kind of work or activites bc of physical problems? (5)
	gen worklimP1 = .
	gen worklimP2 = ADPWLM42 if ADPWLM42 > 0
	gen worklimP3 = .
	
	* accomplish less because of mental problems? (5)
	gen acclessM1 = .
	gen acclessM2 = ADMALS42 if ADMALS42 > 0
	gen acclessM3 = .
	
	* did work or other activities less carefully bc of mental problems? (5)
	gen worklimM1 = .
	gen worklimM2 = ADMWLM42 if ADMWLM42 > 0
	gen worklimM3 = .
	
	* how much did pain interfere with normal work activities? (5)
	gen pain1 = .
	gen pain2 = 6 - ADPAIN42 if ADPAIN42 > 0
	gen pain3 = .
	
	* how often feel calm/peaceful? (5)
	gen calm1 = .
	gen calm2 = 6 - ADCAPE42 if ADCAPE42 > 0
	gen calm3 = .
	
	* how often have lots of energy (5)
	gen energy1 = .
	gen energy2 = 6 - ADNRGY42 if ADNRGY42 > 0
	gen energy3 = .
	
	* how often felt downhearted / depressed (5)
	gen down1 = .
	gen down2 = ADDOWN42 if ADDOWN42 > 0
	gen down3 = .
	
	* how much did health interfere with social activities? (5)
	gen social1 = .
	gen social2 = ADSOCA42 if ADSOCA42 > 0
	gen social3 = .
	
	* how often did you feel nervous? (5)
	gen nervous1 = .
	gen nervous2 = 5 - ADNERV42 if ADNERV42 >= 0
	gen nervous3 = .
	
	* how often did you feel hopeless? (5)
	gen hopeless1 = .
	gen hopeless2 = 5 - ADHOPE42 if ADHOPE42 >= 0
	gen hopeless3 = .

	* how often did you feel restless or fidgety? (5)
	gen restless1 = .
	gen restless2 = 5 - ADREST42 if ADREST42 >= 0
	gen restless3 = .
	
	* how often did you feel so sad that nothing could cheer you up? (5)
	gen sosad1 = .
	gen sosad2 = 5 - ADSAD42 if ADSAD42 >= 0
	gen sosad3 = .
	
	* how often did you feel that everything was an effort? (5)
	gen effort1 = .
	gen effort2 = 5 - ADEFRT42 if ADEFRT42 >= 0
	gen effort3 = .
	
	* how often did you feel worthless? (5)
	gen worthless1 = .
	gen worthless2 = 5 - ADWRTH42 if ADWRTH42 >= 0
	gen worthless3 = .
	
	* how often do you have little interest or pleasure in doing things? (4)
	gen interest1 = .
	gen interest2 = 4 - ADINTR42 if ADINTR42 >= 0
	gen interest3 = .
	
	* how often do you feel down, depressed, or hopeless? (4)
	gen depress1 = .
	gen depress2 = 4 - ADDPRS42 if ADDPRS42 >= 0
	gen depress3 = .
	
	* disagree to agree that "I'm healthy enough that I don't really need health insurance." (5)
	gen dontneed1 = .
	gen dontneed2 = ADINSA42 if ADINSA42 > 0
	gen dontneed3 = .
	
	* disagree to agree that "Health insurance is not worth the money it costs." (5)
	gen notworth1 = .
	gen notworth2 = ADINSB42 if ADINSB42 > 0
	gen notworth3 = .
	
	* disagree to agree that "I'm more likely to take risks than the average person" (5)
	gen takerisk1 = .
	gen takerisk2 = ADRISK42 if ADRISK42 > 0
	gen takerisk3 = .
	
	* disagree to agree that "I can overcome illness without help from a medically trained person." (5)
	gen overcome1 = .
	gen overcome2 = ADOVER42 if ADOVER42 > 0
	gen overcome3 = .
	
	rename AGE31X age
	rename WEIGHT weight
	keep DUPERSID PANEL weight male age phys* ment* actlim* genh* climb* modact* accless* worklim* pain* calm* energy* down* social* nervous* hopeless* restless* sosad* effort* worthless* interest* depress* dontneed* notworth* takerisk* overcome*
	order DUPERSID PANEL male weight age phys* ment* actlim* genh* climb* modact* accless* worklim* pain* calm* energy* down* social* nervous* hopeless* restless* sosad* effort* worthless* interest* depress* dontneed* notworth* takerisk* overcome*
	sort DUPERSID
	save Panel`i'HealthMany.dta, replace
	
	clear
	local y = `y' + 1
	use raw`y'.dta
	keep DUPERSID PANEL SEX PSTATS* RTHLTH* MNHLTH* ACTLIM* ADCAPE42 ADNRGY42 ADDOWN42 ADCLIM42 ADDAYA42 ADGENH42 ADMALS42 ADMWLM42 ADPALS42 ADPWLM42 ADPAIN42 ADSOCA42 ADEFRT42 ADHOPE42 ADNERV42 ADREST42 ADSAD42 ADWRTH42 ADDPRS42 ADINTR42 ADOVER42 ADRISK42 ADINSA42 ADINSB42
	keep if PANEL == `i'
	
	* rate your physical health (5)
	gen phys4 = 6 - RTHLTH42 if RTHLTH42 > 0
	gen phys5 = 6 - RTHLTH53 if RTHLTH53 > 0
	replace phys4 = 0 if PSTATS31 == 31 & PANEL == 1
	replace phys5 = 0 if PSTATS31 == 31 & PANEL == 1
	replace phys4 = 0 if PSTATS42 == 31
	replace phys5 = 0 if PSTATS42 == 31
	replace phys5 = 0 if PSTATS53 == 31
	
	* rate your mental health (5)
	gen ment4 = 6 - MNHLTH42 if MNHLTH42 > 0
	gen ment5 = 6 - MNHLTH53 if MNHLTH53 > 0
	replace ment4 = . if PSTATS31 == 31 & PANEL == 1
	replace ment5 = . if PSTATS31 == 31 & PANEL == 1
	replace ment4 = . if PSTATS42 == 31
	replace ment5 = . if PSTATS42 == 31
	replace ment5 = . if PSTATS53 == 31
	
	* any limits on work / housework / schoolwork (2)
	gen actlim4 = .
	gen actlim5 = ACTLIM53 if ACTLIM53 > 0
	
	* general health rating (5)
	gen genh4 = 6 - ADGENH42 if ADGENH42 > 0
	gen genh5 = .
	
	* does health limit climbing several flights of stairs? (3)
	gen climb4 = ADCLIM42 if ADCLIM42 > 0
	gen climb5 = .
	
	* does health limit moderate activities? (3)
	gen modact4 = ADDAYA42 if ADDAYA42 > 0
	gen modact5 = .
	
	* accomplish less because of physical problems? (5)
	gen acclessP4 = ADPALS42 if ADPALS42 > 0
	gen acclessP5 = .
	
	* limited in kind of work or activites bc of physical problems? (5)
	gen worklimP4 = ADPWLM42 if ADPWLM42 > 0
	gen worklimP5 = .
	
	* accomplish less because of mental problems? (5)
	gen acclessM4 = ADMALS42 if ADMALS42 > 0
	gen acclessM5 = .
	
	* did work or other activities less carefully bc of mental problems? (5)
	gen worklimM4 = ADMWLM42 if ADMWLM42 > 0
	gen worklimM5 = .
	
	* how much did pain interfere with normal work activities? (5)
	gen pain4 = 6 - ADPAIN42 if ADPAIN42 > 0
	gen pain5 = .
	
	* how often feel calm/peaceful? (5)
	gen calm4 = 6 - ADCAPE42 if ADCAPE42 > 0
	gen calm5 = .
	
	* how often have lots of energy (5)
	gen energy4 = 6 - ADNRGY42 if ADNRGY42 > 0
	gen energy5 = .
	
	* how often felt downhearted / depressed (5)
	gen down4 = ADDOWN42 if ADDOWN42 > 0
	gen down5 = .
	
	* how much did health interfere with social activities? (5)
	gen social4 = ADSOCA42 if ADSOCA42 > 0
	gen social5 = .
	
	* how often did you feel nervous? (5)
	gen nervous4 = 5 - ADNERV42 if ADNERV42 >= 0
	gen nervous5 = .
	
	* how often did you feel hopeless? (5)
	gen hopeless4 = 5 - ADHOPE42 if ADHOPE42 >= 0
	gen hopeless5 = .

	* how often did you feel restless or fidgety? (5)
	gen restless4 = 5 - ADREST42 if ADREST42 >= 0
	gen restless5 = .
	
	* how often did you feel so sad that nothing could cheer you up? (5)
	gen sosad4 = 5 - ADSAD42 if ADSAD42 >= 0
	gen sosad5 = .
	
	* how often did you feel that everything was an effort? (5)
	gen effort4 = 5 - ADEFRT42 if ADEFRT42 >= 0
	gen effort5 = .
	
	* how often did you feel worthless? (5)
	gen worthless4 = 5 - ADWRTH42 if ADWRTH42 >= 0
	gen worthless5 = .
	
	* how often do you have little interest or pleasure in doing things? (4)
	gen interest4 = 4 - ADINTR42 if ADINTR42 >= 0
	gen interest5 = .
	
	* how often do you feel down, depressed, or hopeless? (4)
	gen depress4 = 4 - ADDPRS42 if ADDPRS42 >= 0
	gen depress5 = .
	
	* disagree to agree that "I'm healthy enough that I don't really need health insurance." (5)
	gen dontneed4 = ADINSA42 if ADINSA42 > 0
	gen dontneed5 = .
	
	* disagree to agree that "Health insurance is not worth the money it costs." (5)
	gen notworth4 = ADINSB42 if ADINSB42 > 0
	gen notworth5 = .
	
	* disagree to agree that "I'm more likely to take risks than the average person" (5)
	gen takerisk4 = ADRISK42 if ADRISK42 > 0
	gen takerisk5 = .
	
	* disagree to agree that "I can overcome illness without help from a medically trained person." (5)
	gen overcome4 = ADOVER42 if ADOVER42 > 0
	gen overcome5 = .
	
	merge 1:1 DUPERSID using Panel`i'HealthMany.dta
	drop if _merge == 1
	
	gen panel = PANEL + 0
	keep DUPERSID panel weight male age phys* ment* actlim* genh* climb* modact* accless* worklim* pain* calm* energy* down* social* nervous* hopeless* restless* sosad* effort* worthless* interest* depress* dontneed* notworth* takerisk* overcome*
	order DUPERSID panel weight male age phys1 ment1 actlim1 genh1 climb1 modact1 acclessP1 worklimP1 acclessM1 worklimM1 pain1 calm1 energy1 down1 social1 nervous1 hopeless1 restless1 sosad1 effort1 worthless1 interest1 depress1 dontneed1 notworth1 takerisk1 overcome1 phys2 ment2 actlim2 genh2 climb2 modact2 acclessP2 worklimP2 acclessM2 worklimM2 pain2 calm2 energy2 down2 social2 nervous2 hopeless2 restless2 sosad2 effort2 worthless2 interest2 depress2 dontneed2 notworth2 takerisk2 overcome2 phys3 ment3 actlim3 genh3 climb3 modact3 acclessP3 worklimP3 acclessM3 worklimM3 pain3 calm3 energy3 down3 social3 nervous3 hopeless3 restless3 sosad3 effort3 worthless3 interest3 depress3 dontneed3 notworth3 takerisk3 overcome3 phys4 ment4 actlim4 genh4 climb4 modact4 acclessP4 worklimP4 acclessM4 worklimM4 pain4 calm4 energy4 down4 social4 nervous4 hopeless4 restless4 sosad4 effort4 worthless4 interest4 depress4 dontneed4 notworth4 takerisk4 overcome4 phys5 ment5 actlim5 genh5 climb5 modact5 acclessP5 worklimP5 acclessM5 worklimM5 pain5 calm5 energy5 down5 social5 nervous5 hopeless5 restless5 sosad5 effort5 worthless5 interest5 depress5 dontneed5 notworth5 takerisk5 overcome5 
	save Panel`i'HealthMany.dta, replace
}

clear
use Panel9HealthMany.dta
forvalues i=10/20 {
	append using Panel`i'HealthMany.dta
}

save PanelHealthMany.dta, replace

outsheet using ..\Estimation\MEPSallPolymeasure.txt, nolabel nonames replace

keep DUPERSID panel weight male age genh2 genh4 phys1 phys2 phys3 phys4
replace genh2 = 0 if phys1 == 0 | phys2 == 0
replace genh4 = 0 if phys1 == 0 | phys2 == 0 | phys3 ==0 | phys4 == 0
drop phys*
keep if genh2 !=.
drop if genh2 == 0
outsheet using ..\Estimation\MEPSshort.txt, nolabel nonames replace

gen source = "MEPS"
rename DUPERSID id
rename genh2 x1
rename genh4 x1a
keep source id weight male age x1 x1a
order source id weight male age x1 x1a
sort source id
save MEPSforMergeAlt.dta, replace

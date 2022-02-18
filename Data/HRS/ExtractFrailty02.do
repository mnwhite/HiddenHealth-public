clear all
infile using H02C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H02G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID HC001 HC005 HC010 HC018 HC030 HC036 HC053 HC065 HC070 HC088 HG023 HG014 HG025 HG030 HG021 HG016 HG001 HG002 HG003 HG047 HG059 HG044 HG041 HG005 HG008 HG011 HG040 HG050 HG006 HG007 HG009 HG010 HG012 HC139 HC141 HC142 HC118 HC119

rename HC001 HealthStatus
label variable HealthStatus "Health status self report"
rename HC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename HC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename HC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename HC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename HC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename HC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename HC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename HC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename HC088 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename HG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename HG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename HG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename HG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename HG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename HG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename HG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename HG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename HG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename HG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename HG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename HG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename HG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename HG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename HG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename HG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename HG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename HG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename HG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename HG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename HG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename HG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename HG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename HC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename HC141 HeightFeet
label variable HeightFeet "Height in feet"
rename HC142 HeightInches
label variable HeightInches "Height in inches"
rename HC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename HC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2002
rename Height Ht2002
rename Weight Wt2002
rename Health X2002
sort ID

save FrailtyData02.dta, replace

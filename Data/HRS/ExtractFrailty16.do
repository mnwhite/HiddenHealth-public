clear all
infile using H16C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H16G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID PC001 PC005 PC010 PC018 PC030 PC036 PC053 PC065 PC070 PC229 PG023 PG014 PG025 PG030 PG021 PG016 PG001 PG002 PG003 PG047 PG059 PG044 PG041 PG005 PG008 PG011 PG040 PG050 PG006 PG007 PG009 PG010 PG012 PC139 PC141 PC142 PC118 PC119

rename PC001 HealthStatus
label variable HealthStatus "Health status self report"
rename PC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename PC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename PC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename PC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename PC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename PC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename PC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename PC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename PC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename PG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename PG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename PG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename PG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename PG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename PG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename PG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename PG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename PG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename PG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename PG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename PG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename PG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename PG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename PG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename PG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename PG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename PG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename PG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename PG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename PG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename PG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename PG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename PC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename PC141 HeightFeet
label variable HeightFeet "Height in feet"
rename PC142 HeightInches
label variable HeightInches "Height in inches"
rename PC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename PC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2016
rename Height Ht2016
rename Weight Wt2016
rename Health X2016
sort ID

save FrailtyData16.dta, replace

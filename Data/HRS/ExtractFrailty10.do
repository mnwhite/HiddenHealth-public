clear all
infile using H10C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H10G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID MC001 MC005 MC010 MC018 MC030 MC036 MC053 MC065 MC070 MC229 MG023 MG014 MG025 MG030 MG021 MG016 MG001 MG002 MG003 MG047 MG059 MG044 MG041 MG005 MG008 MG011 MG040 MG050 MG006 MG007 MG009 MG010 MG012 MC139 MC141 MC142 MC118 MC119

rename MC001 HealthStatus
label variable HealthStatus "Health status self report"
rename MC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename MC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename MC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename MC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename MC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename MC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename MC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename MC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename MC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename MG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename MG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename MG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename MG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename MG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename MG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename MG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename MG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename MG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename MG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename MG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename MG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename MG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename MG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename MG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename MG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename MG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename MG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename MG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename MG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename MG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename MG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename MG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename MC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename MC141 HeightFeet
label variable HeightFeet "Height in feet"
rename MC142 HeightInches
label variable HeightInches "Height in inches"
rename MC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename MC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2010
rename Height Ht2010
rename Weight Wt2010
rename Health X2010
sort ID

save FrailtyData10.dta, replace

clear all
infile using H08C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H08G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID LC001 LC005 LC010 LC018 LC030 LC036 LC053 LC065 LC070 LC229 LG023 LG014 LG025 LG030 LG021 LG016 LG001 LG002 LG003 LG047 LG059 LG044 LG041 LG005 LG008 LG011 LG040 LG050 LG006 LG007 LG009 LG010 LG012 LC139 LC141 LC142 LC118 LC119

rename LC001 HealthStatus
label variable HealthStatus "Health status self report"
rename LC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename LC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename LC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename LC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename LC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename LC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename LC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename LC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename LC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename LG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename LG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename LG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename LG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename LG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename LG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename LG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename LG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename LG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename LG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename LG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename LG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename LG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename LG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename LG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename LG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename LG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename LG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename LG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename LG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename LG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename LG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename LG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename LC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename LC141 HeightFeet
label variable HeightFeet "Height in feet"
rename LC142 HeightInches
label variable HeightInches "Height in inches"
rename LC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename LC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2008
rename Height Ht2008
rename Weight Wt2008
rename Health X2008
sort ID

save FrailtyData08.dta, replace

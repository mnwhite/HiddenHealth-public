clear all
infile using H06C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H06G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID KC001 KC005 KC010 KC018 KC030 KC036 KC053 KC065 KC070 KC229 KG023 KG014 KG025 KG030 KG021 KG016 KG001 KG002 KG003 KG047 KG059 KG044 KG041 KG005 KG008 KG011 KG040 KG050 KG006 KG007 KG009 KG010 KG012 KC139 KC141 KC142 KC118 KC119

rename KC001 HealthStatus
label variable HealthStatus "Health status self report"
rename KC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename KC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename KC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename KC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename KC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename KC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename KC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename KC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename KC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename KG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename KG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename KG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename KG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename KG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename KG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename KG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename KG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename KG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename KG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename KG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename KG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename KG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename KG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename KG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename KG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename KG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename KG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename KG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename KG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename KG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename KG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename KG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename KC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename KC141 HeightFeet
label variable HeightFeet "Height in feet"
rename KC142 HeightInches
label variable HeightInches "Height in inches"
rename KC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename KC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2006
rename Height Ht2006
rename Weight Wt2006
rename Health X2006
sort ID

save FrailtyData06.dta, replace

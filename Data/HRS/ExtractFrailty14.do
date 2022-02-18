clear all
infile using H14C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H14G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID OC001 OC005 OC010 OC018 OC030 OC036 OC053 OC065 OC070 OC229 OG023 OG014 OG025 OG030 OG021 OG016 OG001 OG002 OG003 OG047 OG059 OG044 OG041 OG005 OG008 OG011 OG040 OG050 OG006 OG007 OG009 OG010 OG012 OC139 OC141 OC142 OC118 OC119

rename OC001 HealthStatus
label variable HealthStatus "Health status self report"
rename OC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename OC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename OC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename OC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename OC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename OC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename OC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename OC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename OC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename OG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename OG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename OG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename OG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename OG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename OG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename OG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename OG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename OG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename OG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename OG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename OG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename OG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename OG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename OG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename OG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename OG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename OG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename OG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename OG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename OG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename OG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename OG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename OC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename OC141 HeightFeet
label variable HeightFeet "Height in feet"
rename OC142 HeightInches
label variable HeightInches "Height in inches"
rename OC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename OC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2014
rename Height Ht2014
rename Weight Wt2014
rename Health X2014
sort ID

save FrailtyData14.dta, replace

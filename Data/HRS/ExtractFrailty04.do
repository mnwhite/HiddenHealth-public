clear all
infile using H04C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H04G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID JC001 JC005 JC010 JC018 JC030 JC036 JC053 JC065 JC070 JC229 JG023 JG014 JG025 JG030 JG021 JG016 JG001 JG002 JG003 JG047 JG059 JG044 JG041 JG005 JG008 JG011 JG040 JG050 JG006 JG007 JG009 JG010 JG012 JC139 JC141 JC142 JC118 JC119

rename JC001 HealthStatus
label variable HealthStatus "Health status self report"
rename JC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename JC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename JC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename JC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename JC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename JC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename JC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename JC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename JC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename JG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename JG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename JG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename JG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename JG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename JG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename JG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename JG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename JG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename JG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename JG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename JG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename JG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename JG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename JG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename JG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename JG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename JG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename JG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename JG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename JG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename JG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename JG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename JC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename JC141 HeightFeet
label variable HeightFeet "Height in feet"
rename JC142 HeightInches
label variable HeightInches "Height in inches"
rename JC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename JC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2004
rename Height Ht2004
rename Weight Wt2004
rename Health X2004
sort ID

save FrailtyData04.dta, replace

clear all
infile using H12C_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H12G_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID NC001 NC005 NC010 NC018 NC030 NC036 NC053 NC065 NC070 NC229 NG023 NG014 NG025 NG030 NG021 NG016 NG001 NG002 NG003 NG047 NG059 NG044 NG041 NG005 NG008 NG011 NG040 NG050 NG006 NG007 NG009 NG010 NG012 NC139 NC141 NC142 NC118 NC119

rename NC001 HealthStatus
label variable HealthStatus "Health status self report"
rename NC005 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename NC010 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename NC018 HaveCancer
label variable HaveCancer "Have cancer?"
rename NC030 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename NC036 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename NC053 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename NC065 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename NC070 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename NC229 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename NG023 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename NG014 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename NG025 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename NG030 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename NG021 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename NG016 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename NG001 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename NG002 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename NG003 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename NG047 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename NG059 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename NG044 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename NG041 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename NG005 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename NG008 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename NG011 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename NG040 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename NG050 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename NG006 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename NG007 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename NG009 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename NG010 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename NG012 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename NC139 WeightLbs
label variable WeightLbs "Weight in pounds"
rename NC141 HeightFeet
label variable HeightFeet "Height in feet"
rename NC142 HeightInches
label variable HeightInches "Height in inches"
rename NC118 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename NC119 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2012
rename Height Ht2012
rename Weight Wt2012
rename Health X2012
sort ID

save FrailtyData12.dta, replace

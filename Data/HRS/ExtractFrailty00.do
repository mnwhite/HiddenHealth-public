clear all
infile using H00B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H00E_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID G1226 G1238 G1245 G1262 G1279 G1289 G1309 G1322 G1327 G2686 G2752 G2723 G2762 G2775 G2742 G2725 G2689 G2690 G2692 G2870 G2916 G2865 G2860 G2698 G2707 G2716 G2851 G2875 G2701 G2704 G2710 G2713 G2719 G1425 G1428 G1429 G1401 G1402

rename G1226 HealthStatus
label variable HealthStatus "Health status self report"
rename G1238 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename G1245 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename G1262 HaveCancer
label variable HaveCancer "Have cancer?"
rename G1279 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename G1289 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename G1309 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename G1322 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename G1327 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename G2686 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename G2752 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename G2723 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename G2762 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename G2775 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename G2742 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename G2725 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename G2689 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename G2690 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename G2692 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename G2870 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename G2916 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename G2865 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename G2860 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename G2698 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename G2707 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename G2716 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename G2851 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename G2875 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename G2701 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename G2704 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename G2710 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename G2713 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename G2719 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename G1425 WeightLbs
label variable WeightLbs "Weight in pounds"
rename G1428 HeightFeet
label variable HeightFeet "Height in feet"
rename G1429 HeightInches
label variable HeightInches "Height in inches"
rename G1401 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename G1402 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F2000
rename Height Ht2000
rename Weight Wt2000
rename Health X2000
sort ID

save FrailtyData00.dta, replace

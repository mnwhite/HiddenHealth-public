clear all
infile using H98B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H98E_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID F1097 F1109 F1116 F1129 F1146 F1156 F1176 F1189 F1194 F2388 F2454 F2425 F2464 F2477 F2444 F2427 F2391 F2392 F2394 F2572 F2618 F2567 F2562 F2400 F2409 F2418 F2553 F2577 F2403 F2406 F2412 F2415 F2421 F1291 F1295 F1296 F1268 F1269

rename F1097 HealthStatus
label variable HealthStatus "Health status self report"
rename F1109 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename F1116 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename F1129 HaveCancer
label variable HaveCancer "Have cancer?"
rename F1146 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename F1156 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename F1176 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename F1189 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename F1194 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename F2388 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename F2454 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename F2425 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename F2464 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename F2477 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename F2444 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename F2427 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename F2391 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename F2392 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename F2394 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename F2572 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename F2618 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename F2567 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename F2562 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename F2400 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename F2409 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename F2418 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename F2553 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename F2577 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename F2403 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename F2406 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename F2412 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename F2415 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename F2421 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename F1291 WeightLbs
label variable WeightLbs "Weight in pounds"
rename F1295 HeightFeet
label variable HeightFeet "Height in feet"
rename F1296 HeightInches
label variable HeightInches "Height in inches"
rename F1268 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename F1269 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F1998
rename Height Ht1998
rename Weight Wt1998
rename Health X1998
sort ID

save FrailtyData98.dta, replace

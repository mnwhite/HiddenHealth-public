clear all
infile using H96B_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
save temp.dta, replace

clear all
infile using H96E_R.dct
gen HHIDPN = HHID + PN
destring HHIDPN, gen(ID)
order ID
sort ID
merge 1:1 ID using temp.dta

keep ID E769 E781 E788 E801 E818 E828 E848 E861 E866 E1854 E1928 E1908 E1938 E1951 E1918 E1895 E1858 E1861 E1864 E2046 E2093 E2041 E2036 E1870 E1879 E1888 E2027 E2051 E1873 E1876 E1882 E1885 E1891 E954 E958 E959 E943 E944

rename E769 HealthStatus
label variable HealthStatus "Health status self report"
rename E781 HaveHighBP
label variable HaveHighBP "Have high blood pressure?"
rename E788 HaveDiabetes
label variable HaveDiabetes "Have diabetes?"
rename E801 HaveCancer
label variable HaveCancer "Have cancer?"
rename E818 HaveLungCond
label variable HaveLungCond "Have lung condition?"
rename E828 HaveHeartCond
label variable HaveHeartCond "Have heart condition?"
rename E848 HasHadStroke
label variable HasHadStroke "Has ever had a stroke?"
rename E861 HavePsychProb
label variable HavePsychProb "Have psychiatric problems?"
rename E866 HaveArthritis
label variable HaveArthritis "Have arthritis?"
rename E1854 DaysInBed
label variable DaysInBed "Days spent in bed in last month"
rename E1928 DiffEating
label variable DiffEating "Difficulty cutting and eating food?"
rename E1908 DiffDressing
label variable DiffDressing "Difficulty getting dressed?"
rename E1938 DiffWithBed
label variable DiffWithBed "Difficulty getting in/out of bed?"
rename E1951 DiffToilet
label variable DiffToilet "Difficulty using the toilet?"
rename E1918 DiffBathing
label variable DiffBathing "Difficulty bathing or showering?"
rename E1895 DiffCrossRoom
label variable DiffCrossRoom "Difficulty walking across a room?"
rename E1858 DiffWalkBlocks
label variable DiffWalkBlocks "Difficulty walking several blocks?"
rename E1861 DiffJogMile
label variable DiffJogMile "Difficulty jogging a mile?"
rename E1864 DiffWalk1Block
label variable DiffWalk1Block "Difficulty walking one block?"
rename E2046 DiffPhoning
label variable DiffPhoning "Difficulty making phone calls?"
rename E2093 DiffMoney
label variable DiffMoney "Difficulty managing money?"
rename E2041 DiffShopping
label variable DiffShopping "Difficulty shopping for groceries?"
rename E2036 DiffCooking
label variable DiffCooking "Difficulty preparing a hot meal?"
rename E1870 DiffStanding
label variable DiffStanding "Difficulty getting up from a chair?"
rename E1879 DiffStooping
label variable DiffStooping "Difficulty stooping or kneeling?"
rename E1888 DiffCarrying
label variable DiffCarrying "Difficulty carrying heavy grocery bag?"
rename E2027 DiffUsingMap
label variable DiffUsingMap "Difficulty using a map?"
rename E2051 DiffTakingRX
label variable DiffTakingRX "Difficulty taking medications?"
rename E1873 DiffStairs
label variable DiffStairs "Difficulty climbing flights of stairs?"
rename E1876 Diff1Stair
label variable Diff1Stair "Difficulty climbing one flight of stairs?"
rename E1882 DiffReaching
label variable DiffReaching "Difficulty reaching arms upward?"
rename E1885 DiffPushing
label variable DiffPushing "Difficulty pushing living room chair?"
rename E1891 DiffPickDime
label variable DiffPickDime "Difficulty picking up a dime?"
rename E954 WeightLbs
label variable WeightLbs "Weight in pounds"
rename E958 HeightFeet
label variable HeightFeet "Height in feet"
rename E959 HeightInches
label variable HeightInches "Height in inches"
rename E943 CigsPerDay
label variable CigsPerDay "Cigarettes per day"
rename E944 PacksPerDay
label variable PacksPerDay "Packs of cigs per day"

do CalcFrailty.do

rename Frailty F1996
rename Height Ht1996
rename Weight Wt1996
rename Health X1996
sort ID

save FrailtyData96.dta, replace

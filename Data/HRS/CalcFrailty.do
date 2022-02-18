gen Frailty = 0

gen Health = .
replace Health = 6 - HealthStatus if HealthStatus < 6

replace Frailty = Frailty + 1 if DiffEating == 1 | DiffEating == 6 | DiffEating == 7
replace Frailty = Frailty + 1 if DiffDressing == 1 | DiffDressing == 6 | DiffDressing == 7
replace Frailty = Frailty + 1 if DiffWithBed == 1 | DiffWithBed == 6 | DiffWithBed == 7
replace Frailty = Frailty + 1 if DiffToilet == 1 | DiffToilet == 6 | DiffToilet == 7
replace Frailty = Frailty + 1 if DiffBathing == 1 | DiffBathing == 6 | DiffBathing == 7
replace Frailty = Frailty + 1 if DiffCrossRoom == 1 | DiffCrossRoom == 6 | DiffCrossRoom == 7
replace Frailty = Frailty + 1 if DiffWalkBlocks == 1 | DiffWalkBlocks == 6 | DiffWalkBlocks == 7
replace Frailty = Frailty + 1 if DiffPhoning == 1 | DiffPhoning == 6 | DiffPhoning == 7
replace Frailty = Frailty + 1 if DiffMoney == 1 | DiffMoney == 6 | DiffMoney == 7
replace Frailty = Frailty + 1 if DiffShopping == 1 | DiffShopping == 6 | DiffShopping == 7
replace Frailty = Frailty + 1 if DiffCooking == 1 | DiffCooking == 6 | DiffCooking == 7
replace Frailty = Frailty + 1 if DiffStanding == 1 | DiffStanding == 6 | DiffStanding == 7
replace Frailty = Frailty + 1 if DiffStooping == 1 | DiffStooping == 6 | DiffStooping == 7
replace Frailty = Frailty + 1 if DiffCarrying == 1 | DiffCarrying == 6 | DiffCarrying == 7
replace Frailty = Frailty + 1 if DiffUsingMap == 1 | DiffUsingMap == 6 | DiffUsingMap == 7
replace Frailty = Frailty + 1 if DiffTakingRX == 1 | DiffTakingRX == 6 | DiffTakingRX == 7
replace Frailty = Frailty + 1 if Diff1Stair == 1 | Diff1Stair == 6 | Diff1Stair == 7
replace Frailty = Frailty + 1 if DiffPickDime == 1 | DiffPickDime == 6 | DiffPickDime == 7
replace Frailty = Frailty + 1 if DiffReaching == 1 | DiffReaching == 6 | DiffReaching == 7
replace Frailty = Frailty + 1 if DiffPushing == 1 | DiffPushing == 6 | DiffPushing == 7
replace Frailty = Frailty + 1 if HaveHighBP == 1
replace Frailty = Frailty + 1 if HaveDiabetes == 1
replace Frailty = Frailty + 1 if HaveCancer == 1
replace Frailty = Frailty + 1 if HaveHeartCond == 1
replace Frailty = Frailty + 1 if HaveLungCond == 1
replace Frailty = Frailty + 1 if HasHadStroke == 1
replace Frailty = Frailty + 1 if HavePsychProb == 1
replace Frailty = Frailty + 1 if HaveArthritis == 1
replace Frailty = Frailty + 1 if CigsPerDay != . | CigsPerDay != .
gen Height = 12*HeightFeet + HeightInches
keep ID Frailty Height WeightLbs Health



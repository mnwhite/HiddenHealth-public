clear all
insheet using ../Results/TwoStudyAllOver23HeteroParamsTypeProbs.txt
rename v1 ID
rename v2 Prob1
rename v3 Prob2
rename v4 Prob3
sort ID

merge 1:1 ID using FrailtyDataAll.dta
keep if _merge == 3
drop _merge

reshape long F X, i(ID) j(year)

gen age = year - yearborn
gen W1 = weight*Prob1
gen W2 = weight*Prob2
gen W3 = weight*Prob3
gen Fsq = F*F

log using TypeProbRegressions.log, replace

oprobit X F Fsq age sex [aweight=weight]

oprobit X F Fsq age sex [aweight=W1]

oprobit X F Fsq age sex [aweight=W2]

oprobit X F Fsq age sex [aweight=W3]

oprobit X F Fsq age sex [aweight=weight] if Prob1 > 0.6

oprobit X F Fsq age sex [aweight=weight] if Prob2 > 0.6

oprobit X F Fsq age sex [aweight=weight] if Prob3 > 0.6

capture log close

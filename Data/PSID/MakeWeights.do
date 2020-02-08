clear all

do J264114.do
do J264114_formats.do

rename ER30001 famid
rename ER30002 PN
rename ER33438 wt97
rename ER33547 wt99
rename ER33639 wt01
rename ER33742 wt03
rename ER33849 wt05
rename ER33951 wt07
rename ER34046 wt09
rename ER34155 wt11
rename ER34269 wt13
rename ER34414 wt15
rename ER34651 wt17

keep famid PN wt*
sort famid PN

save PSIDweights.dta, replace
clear all

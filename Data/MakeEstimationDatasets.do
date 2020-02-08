clear all

cd MEPS
do MakeMEPSdataset.do
cd ..

cd HRS
do MakeHRSdataset.do
cd ..

cd PSID
do MakePSIDdataset.do

clear all
use PSIDforMerge.dta
cd ..
cd HRS
append using HRSforMerge.dta
cd ..
cd MEPS
append using MEPSforMerge.dta
cd ..

cd Estimation
outsheet using CrossStudyData.txt, replace noname nolabel
cd ..

clear all
cd PSID
use PSIDforMergeAlt.dta
cd ..
cd HRS
append using HRSforMergeAlt.dta
cd ..
cd MEPS
append using MEPSforMergeAlt.dta
cd ..

cd Estimation
outsheet using CrossStudyDataAlt.txt, replace noname nolabel
cd ..

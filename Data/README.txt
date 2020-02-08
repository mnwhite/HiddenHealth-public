This folder and its subdirectories contain data files used to estimate the latent health
model, as well as Stata code for constructing them from the raw MEPS, HRS, and PSID data.
This repository includes my constructed datasets used in the estimations, but *not* the
raw panel data files that I used to build them.  These are publicly available data, and
I provide instructions in the README files in the subdirectories for which files must be
downloaded and where they should be put.

Below is a description of the contents of this directory.

MakeEstimationDatasets.do : Stata script that produces all of the files in /Data/Estimation,
    which are used in the actual MLE.  You will only be able to run this script successfully
    if you first follow the instructions in the README files in /Data/MEPS, /Data/PSID, and
    /Data/HRS to put the correct raw data files in the right place.

RunMedRegressions.do : Stata script for regressing log medical expenses in the MEPS on
    model-predicted latent health, and competitor/horserace specifications using lagged
    SRHS (etc).  Obnoxiously, all of the code is written as if x represents latent health,
    rather than h, as I made a late change in notation in the paper.  Sorry.

RunRetRegressions.do : Stata script for regressing extensive margin labor supply in the HRS
    on model-predicted latent health, and competitor/horserace specifications.  Like the
    file above, these results are used in the External Validity subsection of the paper.

EstimationProgress.txt : The main estimation code writes the latest parameters to this file
    every 20 evaluations of the LL function.  It exists only so that you can monitor where
    the estimation is going in the parameter space.

USactuarial.txt : Tab-delimited text file with Social Security Administration mortality
    rates.  I think this is a copy-paste from the 2017 table, and I really should know.

Results/ : Subdirectory where model results are written, including parameter estimates
    (with standard errors) and model-predicted latent health values for every combination
    of age and SRHS sequence.  These files are used to produce the parameter tables and
    to run the external validity regressions.

Figures/ : Subdirectory where other model output is written.  These files are read by
    /Code/MakeCrossDatasetFigures.py when making figures that depend on information from
    multiple specifications.

Estimation/ : Subdirectory with constructed datasets that are used by HiddenHealthEstimation.py
    for the MLE.  These files are created by outsheet-ing from Stata when MakeEstimationDatasets.do
    is run.  Each file is a tab-delimited text file; their structure is implicitly described
    in the specification files in /Code (see that README).

MEPS/ : Subdirectory with raw MEPS data and Stata scripts for processing it into the form
     used by the MLE.  See README there for which raw data files are needed.

HRS/ : Subdirectory with raw HRS data and Stata scripts for processing it into the form
     used by the MLE.  See README there for which raw data files are needed.

PSID/ : Subdirectory with raw PSID data and Stata scripts for processing it into the form
     used by the MLE.  See README there for which raw data files are needed.

Unused/ : Subdirectory with old/junk files.  I don't think these are used for anything.
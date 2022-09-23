# HiddenHealth

This repository contains all code and data used in the paper "Self-Reported Health Status and Latent
Health Dynamics" by Matthew N. White.  I do not provide the raw data files, but the repo does include
my constructed data files that are used in the estimation.  See README.txt files in each subdirectory
for more information about running the code or reproducing the original raw datasets.

## Abstract

Many dynamic structural models that include health as a state variable use categorical self-reported
health status (SRHS) as their sole empirical measure of health. Commonly, transition probabilities 
among discrete health states are calculated directly from one-wave-ahead transitions observed in panel
data.  The predicted dynamics of SRHS generated from these calculations rapidly deviate from empirical
transitions more than one wave ahead, as the assumption of a Markovian process is not satisfied.
Consequently, models that treat SRHS as a true representation of health are not well calibrated to
accurately match the long term dynamics of individual health.  This paper specifies a model in which
SRHS is a noisy measure of a continuous latent health state. I estimate the model by maximum likelihood
on several panel datasets, exploiting long sequences of SRHS rather than simple wave-to-wave transitions.
By accounting for transitory reporting error, the latent health model is able to match both short-run
and long-run SRHS transitions up to twenty years in the future, as well as other features of empirical
SRHS dynamics. Moreover, the measure of latent health is at least as good at predicting other outcomes
(including mortality, labor supply, and medical expenses) as SRHS itself. To aid structural modelers in
replacing their representation of health, I provide simple software tools for generating a discretized
latent health process, and for filtering observed sequences of SRHS into (a distribution of) latent health.

## Directory structure

- /Code : Python and OpenCL files with code for estimating the model and producing figures and tables.
- /Data : Stata code for producing estimation datasets from raw MEPS, HRS, and PSID data files.
- /Figures : Figures produced by the Python code, mostly in PDF format.  Most of these are not used in
    the paper nor slides, and some might be out-of-data.  Figures can be produced or updated by running
    the main estimation file and setting the make_figs and save_figs options to True (and uncommenting
    relevant lines that select which kinds of figures to produce).
- /LaTeX : Files for building the paper and slides, including the BibTeX database.
- /Tables : Files with LaTeX table code, mostly produced by /Code/MakeTables.py; DataSummary.tex is
    "hand made", however.  These are imported into the paper or slides LaTeX files.
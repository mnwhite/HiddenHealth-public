# HiddenHealth
This repository contains all code and data used in the paper "Self-Reported Health Status and Latent
Health Dynamics" by Matthew N. White.  I do not provide the raw data files, but the repo does include
my constructed data files that are used in the estimation.  See README.txt files in each subdirectory
for more information about running the code or reproducing the datasets.

## Abstract
Most dynamic structural models that include health as a state variable use categorical self-reported
health status (SRHS) as their sole empirical measure of health. Almost universally, transition
probabilities among discrete health states are calculated directly from one-period transitions observed
in panel data, either as simple fractions of respondents or by reduced form methods.  The ``naive
dynamics'' of SRHS generated from these calculations rapidly deviate from empirical transitions more
than one period ahead, as the assumption of a Markov(1) process is not satisfied.  Consequently, these
models are not well calibrated to accurately match the long term dynamics of individual health, and
quantitative predictions that rely on agents making decisions based on such dynamics might be unreliable.
As an alternative, I specify a simple model in which SRHS is a noisy measure of a continuous latent
health state. I estimate the model by maximum likelihood on several panel datasets, exploiting long
sequences of SRHS rather than simple period-to-period transitions.  I demonstrate that the model is able
to match both short run and long run SRHS transitions up to twenty years in the future.  Moreover, it
also fits other observed features of SRHS dynamics, including apparent duration dependence.  Finally, I
show how the estimation method is compatible with multiple categorical measures of latent health, rather
than only SRHS, as well as other model extensions.

## Directory structure

- Code/ : Python and OpenCL files with code for estimating the model and producing figures and tables.
- Data/ : Stata code for producing estimation datasets from raw MEPS, HRS, and PSID data files.
- Figures/ : Figures produced by the Python code, mostly in PDF format.  Most of these are not used in
    the paper nor slides, and some might be out-of-data.  Figures can be produced or updated by running
    the main estimation file and setting the make_figs and save_figs options to True (and uncommenting
    relevant lines that select which kinds of figures to produce).
- LaTeX/ : Files for building the paper and slides, including the BibTeX database.
- Tables/ : Files with LaTeX table code, mostly produced by /Code/MakeTables.py; DataSummary.tex is
    "hand made", however.  These are imported into the paper or slides LaTeX files.
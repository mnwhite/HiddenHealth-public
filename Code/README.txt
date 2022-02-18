This folder contains Python and OpenCL code for estimating the latent health model on
various specifications and datasets.  The only package used by the code is that is not
included in the base distribution of Anaconda is opencl4py, which provides a bridge to
the OpenCL heterogeneous computing language.  This package installs correctly via pip
on Windows, but I am told that pip install does not work correctly on Mac or Linux
sometimes.  Package files from https://github.com/Samsung/opencl4py can be copied right
into your Python package library directory and will work correctly.

Below is a list of file descriptions in this directory.

MAIN CODE FILES

DisplayOpenCLinfo.py : Run this very short file first to make sure that opencl4py is
    correctly installed on your computer, and that it can find an OpenCL platform.
    Use the displayed information to choose appropriate platform and device(s), and
    input this information on lines 29-33 of HiddenHealthEstimation.py.  The code has
    been set up to distribute the computational burden of the log likelihood function
    between multiple devices (CPUs and GPUs).  The variable D should have the number
    of devices specified in the "PYOPENCL_CTX" environment variable in the line above,
    while d_opt indicates which one is the fastest device; this is used only in the
    precomputational step when calculating transition probabilities.  The variables
    device_loads and thread_counts are used to set the load distribution across devices,
    and how many threads each device should spawn.  You will have to experiment on
    your own machine with what gives the best performance.  I found that 4096 threads
    maximizes the performance on most GPUs, while 2048 threads words best on a CPU.
    If you are unsure what to do, just use only your CPU, setting device_loads to [1.0].

HiddenHealthEstimation.py : The main code for this project.  Due to some poor structural
    choices early on, a lot of figure-generating code also lives in this file.  To run
    the code, set the parameter file at line 19 to the desired specification (see below),
    and set the boolean variables around line 3300 to choose what kind of work is done.
    If you want to produce figures, make sure to (un)comment the appropriate lines of
    makeFigures() around line 1023 to choose which to make; figures will only be saved to
    disk if the save_figs option is set to True.

HiddenHealthLL.cl : OpenCL kernels for the log-likelihood function and constructing
    transition probabilities among discretized latent health values.  This is imported
    by HiddenHealthEstimation.py and used in the model estimation.

MakeTables.py : Functions for making the parameter estimate tables in the paper.

MakeCrossDatasetFigures.py : Functions for producing figures that depend on data from
    multiple specifications/datasets, rather than just one.



SPECIFICATIONS:

The "TwoStudyXXXHetero" specifications below are the ones reported in the main paper text. 

MEPSmenOver18HeteroParams.py : Model parameters for men in the MEPS aged 18-84.5.  Biannual frequency.

MEPSwomenOver18HeteroParams.py : Model parameters for women in the MEPS aged 18-84.5.  Biannual frequency.

MEPSallOver18HeteroParams.py : Model parameters for everyone in the MEPS aged 18-84.5.  Biannual frequency.

HRSmenOver50HeteroParams.py : Model parameters for men in the HRS aged 50-90.  Annual frequency.

HRSwomenOver50HeteroParams.py : Model parameters for women in the HRS aged 50-90.  Annual frequency.

HRSallOver50HeteroParams.py : Model parameters for everyone in the HRS aged 50-90.  Annual frequency.

PSIDmenOver23HeteroParams.py : Model parameters for men in the PSID aged 23-85.  Annual frequency.

PSIDwomenOver23HeteroParams.py : Model parameters for women in the PSID aged 23-85.  Annual frequency.

PSIDallOver23HeteroParams.py : Model parameters for everyone in the PSID aged 23-85.  Annual frequency.

TwoStudyMenOver23HeteroParams.py : Model parameters for HRS & PSID data men.  Annual frequency.

TwoStudyWomenOver23HeteroParams.py : Model parameters for HRS & PSID data women.  Annual frequency.

TwoStudyAllOver23HeteroParams.py : Model parameters for HRS & PSID data, both sexes.  Annual frequency.

TwoStudyMenOver23aParams.py : Model parameters for HRS & PSID data men.  Annual frequency, basic model.

TwoStudyWomenOver23aParams.py : Model parameters for HRS & PSID data women.  Annual frequency, basic model.

TwoStudyAllOver23aParams.py : Model parameters for HRS & PSID data, both sexes.  Annual frequency, basic model.


Each specification file defines the latent health grid parameters, the data file to be loaded,
text labels and filename bases for results, exogenous parameters describing the structure of
the dataset and how the code should interpret it, a vector of model parameters, a vector of
integers indicating which parameters should be estimated, and information about the extent of
type heterogeneity and whether to use a mixed normal distribution for health shocks.


AUXILIARY FILES:

Utilities.py : A few functions that I copy-pasted from an old version of the HARK package, so that
    you don't have to install HARK for the sake of a few small utility functions.

Optimizers.py : Same, with some custom work.

EvalCount.py : Electronic proof that I am a terrible programmer.

UnusedCode/ : Directory with a bunch of old specifications that I experimented with at
    various points in the project's life-cycle.  Some of these might have outdated formatting
    and need to be updated with new/missing parameters for them to run properly.  These
    include versions of the HRS and PSID specifications at a biannual frequency, versions
    with all three panel datasets (the MEPS-SAQ, PSID, and HRS), and specifications with
    type heterogeneity but no mixed normal health shocks.
 
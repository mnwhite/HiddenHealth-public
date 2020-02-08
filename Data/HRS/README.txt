This folder contains Stata scripts that produce the HRS estimation files used by the Python code.
The raw HRS data files are large, publicly available (with registration), and not allowed to be redistributed by me.
Note that the capitalization style of the .da and .dct varies from wave to wave; this is not a
problem on Windows, which is not case sensitive, but adjustments might need to be made on Mac/Linux.
To reproduce all of these HRS estimation files (in the directory above this one), do the following:

1) Download the raw HRS files listed below and put them into this directory.
2) Run MakeHRSdataset.do in Stata; this is called by MakeEstimationDataset.do.

TRK2016TR_R.da (2016 cross-wave tracker file)
H96B_R.da (1996 health status data file)
H98B_R.da (1998 health status data file)
H00B_R.da (2000 health status data file)
H02C_R.da (2002 health status data file)
H04C_R.da (2004 health status data file)
H06C_R.da (2006 health status data file)
H08C_R.da (2008 health status data file)
H10C_R.da (2010 health status data file)
H12C_R.da (2012 health status data file)
H14C_R.da (2014 health status data file)
H16C_R.da (2016 health status data file)
H96G_R.da (1996 jobs / work status data file)
H98G_R.da (1998 jobs / work status data file)
H00G_R.da (2000 jobs / work status data file)
H02J_R.da (2002 jobs / work status data file)
H04J_R.da (2002 jobs / work status data file)
H06J_R.da (2002 jobs / work status data file)
H08J_R.da (2002 jobs / work status data file)
H10J_R.da (2010 jobs / work status data file)
H12J_R.da (2012 jobs / work status data file)
H14J_R.da (2014 jobs / work status data file)
H16J_R.da (2016 jobs / work status data file)

The *.dct files in this directory are lightly edited versions of the Stata programming
statements provided by ISR, distributed alongside the raw HRS files.
This folder contains Stata scripts that produce the MEPS estimation files used by the Python code.
The raw MEPS data files are large, publicly available, and not allowed to be redistributed by me.
To reproduce all of these MEPS estimation files (in the directory above this one), do the following:

1) Download the raw MEPS files listed below and put them into this directory.
2) Run MakeMEPSdataset.do in Stata; this is called by MakeEstimationDatasets.do.

H012.DAT (1996 full year consolidated data file)
H020.DAT (1997 full year consolidated data file)
H028.DAT (1998 full year consolidated data file)
H038.DAT (1999 full year consolidated data file)
H050.DAT (2000 full year consolidated data file)
H060.DAT (2001 full year consolidated data file)
H070.DAT (2002 full year consolidated data file)
H079.DAT (2003 full year consolidated data file)
H089.DAT (2004 full year consolidated data file)
H097.DAT (2005 full year consolidated data file)
H105.DAT (2006 full year consolidated data file)
H113.DAT (2007 full year consolidated data file)
H121.DAT (2008 full year consolidated data file)
H129.DAT (2009 full year consolidated data file)
H138.DAT (2010 full year consolidated data file)
H147.DAT (2011 full year consolidated data file)
H155.DAT (2012 full year consolidated data file)
H163.DAT (2013 full year consolidated data file)
H171.DAT (2014 full year consolidated data file)
H181.DAT (2015 full year consolidated data file)
H192.DAT (2016 full year consolidated data file)

The unpackYYYY.do files in this directory are lightly edited versions of the Stata programming
statements provided by AHRQ, distributed alongside the raw MEPS files.
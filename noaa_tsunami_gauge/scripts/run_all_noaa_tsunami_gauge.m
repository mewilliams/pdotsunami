% run_all_noaa_tsunami_gauge.m
%
% created 5/11/2013 (should have been created a day or two earlier)
% m. williams
%
% run all tsunami spectra and data analysis stuff on NOAA tsunami capable
% stations around the 3/11/2011 tsunami that reached california. 

clear all; close all;

% get the data into mat file from the "raw" but edited csv files downloaded
% from the internet.  the csv files are only available in 3 day increments,
% so a few have to be blended together once.
get_tsunami_noaa_from_csv.m

% then we can take spectra for all of them.  using the Monterey station as
% closest and without erroneous-looking data:
spectra_tsunami_mry.m

% the other two sites:
spectra_tsunami_sfo.m
spectra_tsunami_arc.m
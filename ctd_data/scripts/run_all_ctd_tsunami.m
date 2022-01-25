% 9/8/2013
% need to make some order here...


clear all;

close all;

spectra_tsunami_US_ctd
spectra_tsunami_US_ctd_windows

plot_tsunami_ctd_DS

% older files.. adjusted 9.10.13
get_ctds_tsunami
get_pressure_10364_tsunami
% ../edited_data/DS_ctd_tsunami.mat should have 5 sensors.  all 5 should 
% have depth records because both get_ctds_tsunami.m and 
% get_pressure_10364_tsunami.m have been run.  
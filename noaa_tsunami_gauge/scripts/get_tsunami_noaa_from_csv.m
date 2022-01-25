% function [] = get_tsunami_noaa_from_csv(file)
% 5/9/2013
% m. williams
%
close all; 

clear all; 

%input files have been edited in a text editor first.  still raw data
%because not being edited in matlab.
%pre-tsunami data
m = csvread('../raw_data/9413450_Monterey_2011-03-07_12:00_to_2011-03-10_11:59_edited.csv',1,0);
%first tsunami dataset...
station.id = 9413450;
station.name = 'Monterey';
td = m(:,1:5);
td(:,6) = 0;
t_gmt = datenum(td);
% t_pst = gmt_to_pacific(t_gmt);
one_min = m(:,6);
len = length(one_min);
figure
plot(t_gmt,one_min)

% piece two datasets together. 
m = csvread('../raw_data/9413450_Monterey_2011-03-10_12:00_to_2011-03-13_12:00_edited.csv',1,0);
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

len = length(one_min);
figure
plot(t_gmt,one_min)

% and piece the third in. 
m = csvread('../raw_data/9413450_Monterey_2011-03-13_12:01_to_2011-03-16_12:00_edited.csv',1,0); 
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

figure
plot(t_gmt,one_min)


save ../edited_data/mry_tsunami_noaa_gauge.mat t_gmt one_min station




clear all; 

% ARENA COVE:  9416841_Arena Cove

%input files have been edited in a text editor first.  still raw data
%because not being edited in matlab.
%pre-tsunami data
m = csvread('../raw_data/9416841_Arena Cove_2011-03-07_12:00_to_2011-03-10_11:59_edited.csv',1,0);
%first tsunami dataset...
station.id = 9416841;
station.name = 'Arena Cove';
td = m(:,1:5);
td(:,6) = 0;
t_gmt = datenum(td);
% t_pst = gmt_to_pacific(t_gmt);
one_min = m(:,6);
len = length(one_min);
figure
plot(t_gmt,one_min)

% piece two datasets together. 
m = csvread('../raw_data/9416841_Arena Cove_2011-03-10_12:00_to_2011-03-13_12:00_edited.csv',1,0);
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

len = length(one_min);
figure
plot(t_gmt,one_min)

% and piece the third in. 
m = csvread('../raw_data/9416841_Arena Cove_2011-03-13_12:01_to_2011-03-16_12:00_edited.csv',1,0); 
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

figure
plot(t_gmt,one_min)


save ../edited_data/arc_tsunami_noaa_gauge.mat t_gmt one_min station






clear all; 

% SAN FRANCISCO:  9414290_San Francisco

%input files have been edited in a text editor first.  still raw data
%because not being edited in matlab.
%pre-tsunami data
m = csvread('../raw_data/9414290_San Francisco_2011-03-07_12:00_to_2011-03-10_11:59_edited.csv',1,0);
%first tsunami dataset...
station.id = 9414290;
station.name = 'San Francisco';
td = m(:,1:5);
td(:,6) = 0;
t_gmt = datenum(td);
% t_pst = gmt_to_pacific(t_gmt);
one_min = m(:,6);
len = length(one_min);
figure
plot(t_gmt,one_min)

% piece two datasets together. 
m = csvread('../raw_data/9414290_San Francisco_2011-03-10_12:00_to_2011-03-13_12:00_edited.csv',1,0);
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

len = length(one_min);
figure
plot(t_gmt,one_min)

% and piece the third in. 
m = csvread('../raw_data/9414290_San Francisco_2011-03-13_12:01_to_2011-03-16_12:00_edited.csv',1,0); 
clear td
td = m(:,1:5);
td(:,6) = 0;
ltd = length(td);
t_gmt(len+1:len+ltd) = datenum(td);
one_min(len+1:len+ltd) = m(:,6);

figure
plot(t_gmt,one_min)


save ../edited_data/sfo_tsunami_noaa_gauge.mat t_gmt one_min station
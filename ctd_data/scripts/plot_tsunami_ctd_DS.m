% plot_tsunami_ctd_DS.m
% m. williams
% 9.8.2013
%

clear all; close all;

load ../edited_data/DS_ctd_tsunami.mat

plot(t_gmtds1,d_ds1)
hold all
plot(t_gmtds2,d_ds2)
plot(t_gmtds3,d_ds3)
plot(t_gmtds4,d_ds4)
plot(t_gmtds5,d_ds5)
datetick2('x')
legend('1','2','3','4')
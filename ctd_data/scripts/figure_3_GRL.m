% 9.11.2013
% m. williams
% 

grl_figure_startup

clear all;
close all;
load ../edited_data/DS_ctd_tsunami.mat
% file should have 5 sensors.  all 5 should have depth records because both
% get_ctds_tsunami.m and get_pressure_10364_tsunami.m have been run.  

f1 = figure(56);
sp(1) = subplot(4,1,1);
plot(t_gmtds1,d_ds1)
hold all
plot(t_gmtds2,d_ds2)
plot(t_gmtds3,d_ds3)
plot(t_gmtds4,d_ds4)
plot(t_gmtds5,d_ds5)
ylabel('H [m]')
ylim([0 2.5])
xlim([datenum(2011,3,11) datenum(2011,3,12)])
set(gca,'TickDir','out')

datetick('x','keeplimits')

sp(2) = subplot(4,1,2);
plot(t_gmtds1,s_ds1)
hold all
plot(t_gmtds2,s_ds2)
plot(t_gmtds3,s_ds3)
plot(t_gmtds4,s_ds4)
plot(t_gmtds5,s_ds5)
set(gca,'TickDir','out')

ylabel('Salinity')
xlabel('March 11, 2011 - GMT')

ylim([0 35])
xlim([datenum(2011,3,11) datenum(2011,3,12)])
datetick('x','keeplimits')

sp(3) = subplot(4,1,3);
plot(t_gmtds1,d_ds1)
hold all
plot(t_gmtds2,d_ds2)
plot(t_gmtds3,d_ds3)
plot(t_gmtds4,d_ds4)
plot(t_gmtds5,d_ds5)
ylabel('H [m]')
ylim([0 2.5])
xlim([datenum(2011,3,11,23,52,0) datenum(2011,3,12,23,52,0)])
datetick('x','keeplimits')

sp(4) = subplot(4,1,4);
plot(t_gmtds1,s_ds1)
hold all
plot(t_gmtds2,s_ds2)
plot(t_gmtds3,s_ds3)
plot(t_gmtds4,s_ds4)
plot(t_gmtds5,s_ds5)
ylabel('Salinity')
xlabel('March 12, 2011 - GMT')

ylim([0 35])
xlim([datenum(2011,3,11,23,52,0) datenum(2011,3,12,23,52,0)])
datetick('x','keeplimits')

saveas(f1,'../images/figure3_a','epsc')
saveas(f1,'../images/figure3_a','jpg')

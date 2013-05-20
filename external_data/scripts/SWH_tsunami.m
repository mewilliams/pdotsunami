% SWH_tsunami.m
% 5/18/2013
%
% m. williams
%
%
% to plot significant wave height at NOAA 46012 around March 2011 tsunami.

clear all; close all;

[time_zulu,wv_ht,wave_dir,dpd] = get_wavegauge_46012(2011,3,3);

save ../edited_data/noaa46012_tsunami time_zulu wv_ht wave_dir dpd

limits = [datenum(2011,3,1) datenum(2011,3,21)];


f = figure;
plot(time_zulu,wv_ht,'k')
xlim(limits)
title('NDBC Buoy Half Moon Bay 46012')
ylabel('Significant Wave Height [m]')
xlabel('2011 - GMT')
datetick2('x','keeplimits')
filename= '../images/SWH_46012';
saveas(f,filename,'eps')
saveas(f,filename,'png')


xlim([datenum(2011,3,10,20,0,0) datenum(2011,3,16,7,0,0)])
datetick2('x','keeplimits')
filename= '../images/SWH_46012_adcp_window';
saveas(f,filename,'eps')
saveas(f,filename,'png')
% 5/19/2013
%
% m. williams
% get the MRY tides... 


clear all; close all;

[t_gmt,tide_pred_m,tide_act_m] = get_MRY_tide(2011,3,1,2011,3,20);
save ../edited_data/tideMRY_tsunami t_gmt tide_pred_m tide_act_m



f = figure;
plot(t_gmt,tide_act_m,'k')
title('NOAA Tides - Monterey, CA - 9413450')
ylabel('Tide height - MLLW [m]')
xlabel('2011 - GMT')
datetick2('x','keeplimits')
filename= '../images/tides_Pescadero_tsunami';
saveas(f,filename,'eps')
saveas(f,filename,'png')


xlim([datenum(2011,3,10,20,0,0) datenum(2011,3,16,7,0,0)])
datetick2('x','keeplimits')
filename= '../images/tides_Pescadero_tsunami_adcp_window';
saveas(f,filename,'eps')
saveas(f,filename,'png')
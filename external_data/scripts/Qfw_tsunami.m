% 5/18/2013
%
% m. williams
%
%
% to plot freshwater discharge into the Pescadero estuary.

clear all; close all;

[t_gmt,Q_cfs,H_ft,site_no,t_local] = get_usgs_gauge_pdo(2011,3,1,2011,3,20);

Q_m3s = cfs_to_cms(Q_cfs);

save ../edited_data/usgsQ_tsunami t_gmt Q_m3s H_ft site_no t_local

f = figure;
semilogy(t_gmt,Q_m3s)
title('USGS Gauge Pescadero 11162500')
ylabel('Q_{fw} [m^3 s^{-1}]')
xlabel('2011 - GMT')
datetick2('x','keeplimits')
filename= '../images/Q_m3s_Pescadero_unscaled';
saveas(f,filename,'eps')
saveas(f,filename,'png')

xlim([datenum(2011,3,10,20,0,0) datenum(2011,3,16,7,0,0)])
datetick2('x','keeplimits')
filename= '../images/Q_m3s_Pescadero_adcp_window';
saveas(f,filename,'eps')
saveas(f,filename,'png')


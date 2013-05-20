% plot_external_sensors_together_tsunami.m
% m. williams
% 5.19.2013

clear all;
close all;

load ../edited_data/noaa46012_tsunami.mat

f = figure;
subplot(3,1,1)
plot(time_zulu,wv_ht,'k')
ylabel('SWH [m]')

load ../edited_data/usgsQ_tsunami.mat
subplot(3,1,2)
plot(t_gmt,Q_m3s,'k')
ylabel('Q_{fw} [m^3 s^{-1}]')

load ../edited_data/tideMRY_tsunami.mat
subplot(3,1,3)
plot(t_gmt,tide_act_m,'k')
ylabel('MLLW [m]')
xlabel('2011 - GMT')
ylim([-0.5 1.75])
xlim([datenum(2011,3,10,20,0,0) datenum(2011,3,16,7,0,0)])

datetick2('x','keeplimits')

filename = '../images/three_external_variables_plotted_adcp_window';
saveas(f,filename,'eps')
saveas(f,filename,'png')

% figure_2_GRL.m
% plot spectra. created from plot_spectra_CERF_2013.m
% which is located in the noaa_tsunami_gauge/scripts 
% folder
%
% November 18, 2013
% M. Williams
%

% sets axes fontsizes, etc.
grl_figure_startup

clear all;
close all;

load ../edited_data/pdo_vps_data
[t_grid_ctd,f_grid_ctd] = meshgrid(ta_win,freq_cph);

f = figure;
subplot(4,1,2:4)
pcolor(ta_win,freq_cph,data'.*f_grid_ctd)
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
shading flat
set(gca, 'YScale', 'log')
set(gca,'fontsize',6)
set(gca,'TickDir','out')

caxis([0 .00001])
subplot(4,1,1)
plot(t_gmt,depth,'k')
set(gca,'fontsize',6)

ylim([1 2.5])
xlim([70 76.5])
ylabel('depth [m]')


load ../../noaa_tsunami_gauge/edited_data/mry_vps_data.mat
t_gmt_mry = t_gmt-365;
ta_30 = ta_30-365;
f = figure;
pcolor(ta_30,freq_30*3600,data_30')
shading flat
set(gca, 'YScale', 'log')
set(gca,'TickDir','out')
% set(gca,'yticklabel'
 labels = [' 1 ';'10 '; '100'];
set(gca,'YTickLabel',lbls);
caxis([0 .01])
datetick2('x','keeplimits')
[t_grid,f_grid] = meshgrid(ta_30,freq_30);

f = figure;
subplot(4,1,2:4)
pcolor(ta_30,freq_30*3600,data_30'.*f_grid), shading flat
shading flat
set(gca, 'YScale', 'log')

caxis([0 .0001])
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
subplot(4,1,1)
plot(t_gmt_mry,one_min_intp,'k')
ylabel('tide [m]')
ylim([-0.5 2])
xlim([70 76.5])

datetick2('x','keeplimits')


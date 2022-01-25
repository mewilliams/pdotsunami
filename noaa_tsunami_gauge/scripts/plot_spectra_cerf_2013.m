% plot_spectra_cerf_2013.m
%
% 11/3/2013

clear all;
close all;

load ../edited_data/mry_vps_data.mat
t_gmt_mry = t_gmt-365;
ta_30 = ta_30-365;
f = figure;
pcolor(ta_30,freq_30*3600,data_30')
shading flat
set(gca, 'YScale', 'log')
caxis([0 .01])
datetick2('x','keeplimits')
[t_grid,f_grid] = meshgrid(ta_30,freq_30);

f = figure;
subplot(4,1,1:3)
pcolor(ta_30,freq_30,data_30'.*f_grid), shading flat
shading flat
set(gca, 'YScale', 'log')
caxis([0 .0001])
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
subplot(4,1,4)
plot(t_gmt_mry,one_min_intp,'k')
ylabel('tide [m]')
ylim([-0.5 2])
xlim([70 76.5])

datetick2('x','keeplimits')

saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra','jpg')
colorbar
subplot(4,1,1:3)
colorbar

saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra_w_colorbar','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra_w_colorbar','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/mry_spectra_w_colorbar','jpg')

load ../../ctd_data/edited_data/pdo_vps_data
f = figure;
pcolor(ta_win,freq_cph,data')
[t_grid_ctd,f_grid_ctd] = meshgrid(ta_win,freq_cph);
shading flat
set(gca, 'YScale', 'log')
datetick2('x','keeplimits')
f = figure;
subplot(4,1,1:3)
pcolor(ta_win,freq_cph,data'.*f_grid_ctd)
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
shading flat
set(gca, 'YScale', 'log')
caxis([0 .00001])
subplot(4,1,4)
plot(t_gmt,depth,'k')
ylim([1 2.5])
xlim([70 76.5])
ylabel('depth [m]')
datetick2('x','keeplimits')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra','jpg')
colorbar
subplot(4,1,1:3)
colorbar
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra_w_colorbar','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra_w_colorbar','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/pdo_spectra_w_colorbar','jpg')



f = figure;
set(gcf,'Position',[100 500 1000 800])
subplot(8,1,2:4)
pcolor(ta_30,freq_30,data_30'.*f_grid), shading flat
shading flat
set(gca, 'YScale', 'log')
caxis([0 .0001])
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
subplot(8,1,1)
plot(t_gmt_mry,one_min_intp,'k')
ylabel('tide [m]')
ylim([-0.5 2])
xlim([70 76.5])

subplot(8,1,5:7)
pcolor(ta_win,freq_cph,data'.*f_grid_ctd)
ylabel({'Power Spectral Density [m^2]','frequency [Hz]'})
shading flat
set(gca, 'YScale', 'log')
caxis([0 .00001])
subplot(8,1,8)
plot(t_gmt,depth,'k')
ylim([1 2.5])
xlim([70 76.5])
ylabel('depth [m]')

datetick2('x','keeplimits')

saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra','jpg')

subplot(8,1,5:7)
colorbar 
subplot(8,1,2:4)
colorbar

saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra_w_colorbar','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra_w_colorbar','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/both_spectra_w_colorbar','jpg')



figure
set(gcf,'Position',[100 500 1000 800])
subplot(2,1,1)
plot(t_gmt_mry,one_min_intp,'k')
ylabel('tide [m]')
ylim([-0.5 2])
subplot(2,1,2)
plot(t_gmt,depth,'k')
ylabel('depth [m]')

ylim([1 2.5])

xlim([70 76.5])
xlabel('2011, GMT')
datetick2('x','keeplimits')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_1','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_1','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_1','jpg')


ttsu = datenum(0,3,11,16,05,0);
subplot(2,1,2)
hold all
plot([ttsu ttsu],[1 2.5],'r--','linewidth',2)
xlabel('2011, GMT')

subplot(2,1,1)
hold all
plot([ttsu ttsu],[-0.5 2],'r--','linewidth',2)


saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_2','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_2','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_2','jpg')
clf

subplot(2,1,1)
plot(t_gmt_mry,one_min_intp,'k')
ylabel('tide [m]')
ylim([-0.5 2])

subplot(2,1,2)
plot(t_gmt,depth,'k')
ylabel('depth [m]')
ylim([1 2.5])
xlabel('March 11-12, 2011, GMT')

xlim([71 73])
datetick2('x','keeplimits')

saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_3','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_3','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_3','jpg')

xlim([ttsu-0.05 ttsu+0.2])
datetick2('x','keeplimits')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_4','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_4','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_4','jpg')


xlim([ttsu-0.05 ttsu+1])
datetick2('x','keeplimits')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_5','epsc')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_5','png')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_5','jpg')
saveas(gcf,'~/Dropbox/cerf_2013/images/tsunami/two_depth_records_5','fig')


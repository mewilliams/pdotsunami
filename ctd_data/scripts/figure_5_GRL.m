% figure 5

clear all; 
close all;
load ../edited_data/DS_ctd_tsunami.mat

f5 = figure(5);
sp(1) = subplot(3,1,2);
plot(t_gmtds1,d_ds1)
hold all
plot(t_gmtds2,d_ds2)
plot(t_gmtds3,d_ds3)
plot(t_gmtds4,d_ds4)
plot(t_gmtds5,d_ds5)
ylabel('depth [m]')
ylim([0 2.5])
xlim([datenum(2011,3,11) datenum(2011,3,18)])
text(datenum(2011,3,11)+.05,1.8,'(b)','fontsize',10)

datetick('x','keeplimits')

sp(2) = subplot(3,1,3);
plot(t_gmtds1,s_ds1)
hold all
plot(t_gmtds2,s_ds2)
plot(t_gmtds3,s_ds3)
plot(t_gmtds4,s_ds4)
plot(t_gmtds5,s_ds5)
ylabel('Salinity')

ylim([0 35])
xlim([datenum(2011,3,11) datenum(2011,3,18)])
text(datenum(2011,3,11)+.05,23,'(c)','fontsize',10)
datetick('x','keeplimits')


load ~/Research/Pescadero/ADCP/20110412/edited_data/rotated_princ_dir_depth_avg_vel.mat
load ~/Research/Pescadero/ADCP/20110412/edited_data/depth_average_tsunami_data.mat
sp(2) = subplot(3,1,1);

time_adcp_gmt = pacific_to_gmt(time_adcp);
plot(time_adcp_gmt,rotU,'k');
xlim([datenum(2011,3,11) datenum(2011,3,18)])
ylim([-0.4 0.6])
text(datenum(2011,3,11)+.05,0.4,'(a)','fontsize',10)
datetick('x','keeplimits')

saveas(f5,'~/Research_new/tsunami/figure5','epsc')
saveas(f5,'~/Research_new/tsunami/figure5','jpg')





f6 = figure(6);
sp(1) = subplot(3,1,2);
plot(t_gmtds1,d_ds1,'linewidth',2)
hold all
plot(t_gmtds2,d_ds2,'linewidth',2)
plot(t_gmtds3,d_ds3,'linewidth',2)
plot(t_gmtds4,d_ds4,'linewidth',2)
plot(t_gmtds5,d_ds5,'linewidth',2)
ylabel({'sensor','depth [m]'})
ylim([0 2.5])
xlim([datenum(2011,3,11) datenum(2011,3,18)])
text(datenum(2011,3,11)+.05,1.8,'(b)','fontsize',10)

datetick('x','keeplimits')

sp(2) = subplot(3,1,3);
plot(t_gmtds1,s_ds1,'linewidth',2)
hold all
plot(t_gmtds2,s_ds2,'linewidth',2)
plot(t_gmtds3,s_ds3,'linewidth',2)
plot(t_gmtds4,s_ds4,'linewidth',2)
plot(t_gmtds5,s_ds5,'linewidth',2)
ylabel('Salinity')

ylim([0 35])
xlim([datenum(2011,3,11) datenum(2011,3,18)])
text(datenum(2011,3,11)+.05,23,'(c)','fontsize',10)
datetick('x','keeplimits')


load ~/Research/Pescadero/ADCP/20110412/edited_data/rotated_princ_dir_depth_avg_vel.mat
load ~/Research/Pescadero/ADCP/20110412/edited_data/depth_average_tsunami_data.mat
sp(2) = subplot(3,1,1);

time_adcp_gmt = pacific_to_gmt(time_adcp);
plot(time_adcp_gmt,rotU,'k');
ylabel('ubar [m/s]')
xlim([datenum(2011,3,11) datenum(2011,3,18)])
ylim([-0.4 0.6])
xlim([datenum(2011,3,11) datenum(2011,3,12)])

text(datenum(2011,3,11)+.05,0.4,'(a)','fontsize',10)
datetick2('x','keeplimits')


saveas(f6,'~/Dropbox/cerf_2013/pre_tsu','epsc')
saveas(f6,'~/Dropbox/cerf_2013/pre_tsu','png')

xlim([datenum(2011,3,12) datenum(2011,3,13)])
datetick2('x','keeplimits')

saveas(f6,'~/Dropbox/cerf_2013/tsu','epsc')
saveas(f6,'~/Dropbox/cerf_2013/tsu','png')

xlim([datenum(2011,3,11,9,0,0) datenum(2011,3,11,10,0,0)])
datetick2('x','keeplimits')

saveas(f6,'~/Dropbox/cerf_2013/sb_zoom','epsc')
saveas(f6,'~/Dropbox/cerf_2013/sb_zoom','png')



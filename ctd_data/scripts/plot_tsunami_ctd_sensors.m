% plot_tsunami_ctd_sensors.m
% written april 2, 2013 to plot data from sensors in pescadero during the
% March 2011 Tohoku tsunami's arrival to California. 
% edited 9/8/13
% 
% clear all;
% close all;


load 017295_20110516_1308
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
tS = pacific_to_gmt(tS);
% tS = tS - datenum(2010,12,30);

% Need to adjust for atmospheric pressure!

fDS = figure(90)
subplot(3,1,1), plot(t_gmt,depth), hold all
subplot(3,1,2), plot(t_gmt,salt), hold all
subplot(3,1,3), plot(t_gmt,temp), hold all


load 009620_20110516_1321
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);

subplot(3,1,1), plot(t_gmt,depth)
subplot(3,1,2), plot(t_gmt,salt)
subplot(3,1,3), plot(t_gmt,temp)
% 

load 010364_ds_051111
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);

subplot(3,1,1), plot(t_gmt,depth)
subplot(3,1,2), plot(t_gmt,salt)
subplot(3,1,3), plot(t_gmt,temp)

load 017015_20110516_1333
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);

subplot(3,1,1), plot(t_gmt,depth)
subplot(3,1,2), plot(t_gmt,salt)
subplot(3,1,3), plot(t_gmt,temp)


load 017294_20110516_1301
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);
figure(90)
subplot(3,1,1), plot(t_gmt,depth)
ylim([0 3])
ylabel('depth')
title('Downstream CTD station')
subplot(3,1,2), plot(t_gmt,salt)
ylim([0 33])
ylabel('salt')
subplot(3,1,3), plot(t_gmt,temp)
ylim([8 15])
ylabel('temperature')

xlim([70.5 76])
datetick2('x','keeplimits')

filename = ['../images/ctd_downstream_tsunami_window']
saveas(fDS,filename,'eps')
saveas(fDS,filename,'png')


% other station
load 017293_20110419_1941
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);
fUS = figure(91)
subplot(3,1,1), plot(t_gmt,depth,'--'), hold all
subplot(3,1,2), plot(t_gmt,salt,'--'), hold all
subplot(3,1,3), plot(t_gmt,temp,'--'), hold all

load 017296_20110415_1202
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);

[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;
% tS = tS - datenum(2010,12,30);
figure(91)
subplot(3,1,1), plot(t_gmt,depth,'--')
ylim([0 3])
ylabel('depth')
title('Downstream CTD station')

subplot(3,1,2), plot(t_gmt,salt,'--')
ylim([0 33])
ylabel('salt')
subplot(3,1,3), plot(t_gmt,temp,'--')
ylim([8 15])
ylabel('temperature')

xlim([70.5 76])
datetick2('x','keeplimits')
filename = ['../images/ctd_upstream_tsunami_window'];
saveas(fUS,filename,'eps')
saveas(fUS,filename,'png')


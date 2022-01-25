% 5/9/2013
% spectra - tsunami stations - noaa stations
% m. williams

clear all;
close all;

load 017296_20110415_1202
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;


% NOAA data I'm using: 07-Mar-2011 12:00:00  to 16-Mar-2011 12:00:00

% match_noaa = find(and(t_gmt>=datenum(2011,3,7,12,0,0),t_gmt<=datenum(2011,3,17,12,0,0)));
match_noaa = find(and(t_gmt>=datenum(2011,3,7,12,0,0),t_gmt<=datenum(2011,3,16,12,0,0)));


t_gmt = t_gmt(match_noaa);
depth = depth(match_noaa);
d = depth;
salt = salt(match_noaa);
temp = temp(match_noaa);

save ../edited_data/ctd_matched_noaa_for_tsunami_spectra t_gmt d salt temp


depth = detrend(depth,'linear');




% i know that the sampling period is 1 minute
% 1 minute = 60 seconds
% pdo at 15:30 on 3/11
m= find(t_gmt<datenum(2011,3,11,16,0,0));
fs = 1/60;
Pxx = periodogram(depth(m));
H_pre = dspdata.psd(Pxx,'Fs',fs);
fH_pdo = plot(H_pre);
saveas(fH_pdo,'../images/PSD_pdo_pre_tsu.png');

floglog_psd_pdo = figure(87);
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power Spectral Density [m^2 Hz^{-1}]')
xlabel('Frequency [Hz]')
% title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
saveas(floglog_psd_pdo,'../images/log_log_PSD_pdo_pre_tsu.eps');


% post-tsunami only
m= find(t_gmt>=datenum(2011,3,11,16,0,0));  % by inspection
Pxx = periodogram(depth(m));
H_tsu = dspdata.psd(Pxx,'Fs',fs);
figure
fH_pdo_tsu_only = plot(H_tsu);
saveas(fH_pdo_tsu_only,'../images/PSD_pdo_tsu_only.png');


floglog_psd_pdo_tsu_only = figure(81);
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])

ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
% title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'tsunami conditions'})
saveas(floglog_psd_pdo_tsu_only,'../images/log_log_PSD_pdo_tsu_only.png');


side_by_side = figure(12);
subplot(1,2,1)
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power Spectral Density [m^2 Hz^{-1}]')
xlabel('Frequency [Hz]')
title({'March 7-11, 2011','normal'})

subplot(1,2,2)
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])
xlabel('Frequency [Hz]')
title({'March 11-16, 2011','tsunami'})
saveas(side_by_side,'../images/normal_and_tsunami_pdo_loglog_psd.eps')



side_by_side_plus_timeseries = figure;
 set(side_by_side_plus_timeseries, 'Position', [100 500 960 820])

subplot(3,2,1:2)
plot(t_gmt,d,'k')
datetick2('x','keeplimits')
ylim([1.15 2.25])
ylabel('Depth [m]')
xlabel('2011, GMT')
title('Pescadero depth sensor')

subplot(3,2,[3 5])
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power Spectral Density [m^2 Hz^{-1}]')
xlabel('Frequency [Hz]')
title({'March 7-11, 2011','normal'})

subplot(3,2,[4 6])
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])
xlabel('Frequency [Hz]')
title({'March 11-16, 2011','tsunami'})
filename = '../images/normal_and_tsunami_pdo_loglog_psd_with_timeseries';
saveas(side_by_side_plus_timeseries,filename,'eps')
saveas(side_by_side_plus_timeseries,filename,'png')

side_by_side_plus_timeseries_cheat1 = figure;
 set(side_by_side_plus_timeseries_cheat1, 'Position', [100 500 960 720])

subplot(3,2,1:2)
plot(t_gmt,d,'k')
xlim([datenum(2011,3,7,12,0,0) datenum(2011,3,16,12,0,0)])
datetick('x','keeplimits')
ylim([1.15 2.25])
ylabel('Depth [m]')
xlabel('2011, GMT')
title('Pescadero depth sensor')

filename = '../images/normal_and_tsunami_pdo_loglog_psd_with_timeseries_cheat1';
saveas(side_by_side_plus_timeseries_cheat1,filename,'eps')
saveas(side_by_side_plus_timeseries_cheat1,filename,'png')




side_by_side_plus_timeseries_cheat2 = figure;
 set(side_by_side_plus_timeseries_cheat2, 'Position', [100 500 960 720])

subplot(3,2,[3 5])
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power Spectral Density [m^2 Hz^{-1}]')
xlabel('Frequency [Hz]')
title({'March 7-11, 2011','normal'})

subplot(3,2,[4 6])
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])
xlabel('Frequency [Hz]')
title({'March 11-16, 2011','tsunami'})
filename = '../images/normal_and_tsunami_pdo_loglog_psd_with_timeseries_cheat2';
saveas(side_by_side_plus_timeseries_cheat2,filename,'epsc')
saveas(side_by_side_plus_timeseries_cheat2,filename,'png')


% variance preserving
fvp = figure(763);
semilogx(H_tsu.Frequencies,H_tsu.Data.*H_tsu.Frequencies,'color',[0.7 0.7 0.7]);
hold on
semilogx(H_pre.Frequencies,H_pre.Data.*H_pre.Frequencies,'k','linewidth',2);

ylabel('Power Spectral Density [m^2]')
xlabel('Frequency [Hz]')
% title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
filename = '../images/var_preserve_spectra_pdo';
saveas(fvp,filename,'epsc');
saveas(fvp,filename,'jpg');






% 5/9/2013
% spectra - tsunami stations - noaa stations
% m. williams
% 8/20/2013 - going to try to make the spectra variance-preserving.


clear all;
close all;

load ../edited_data/mry_tsunami_noaa_gauge.mat

% first throw out some bad data points:
z = find(one_min == 0);
for i = 1:length(z)
    if abs(one_min(z(i))-one_min(z(i)-1))>0.5
        one_min(z(i)) = NaN;
    elseif and(one_min(z(i))==0,isnan(one_min(z(i)-1)))
        one_min(z(i)) = NaN;
    end
end
% sanity check:
f = figure(7);
plot(t_gmt,one_min,'k'), hold all
z = find(one_min == 0);
plot(t_gmt(z),one_min(z),'rp')
m = find(isnan(one_min));
plot(t_gmt(m),zeros(size(m)),'go')

f = figure(99);
plot(t_gmt,one_min,'k')
datetick2('x','keeplimits')
ylabel('[m]')
xlabel('2010, GMT')
title(['NOAA tsunami-capable gauge - ',station.name,' ',num2str(station.id)])
saveas(f,'../images/time_record_mry.eps')

% fill in NaNs (after you made them.  way to go, megan)     
one_min_intp = interp1(t_gmt(isfinite(one_min)),one_min(isfinite(one_min)),t_gmt);
figure
plot(t_gmt,one_min_intp,'r')
hold all
plot(t_gmt,one_min)


% i know that the sampling period is 1 minute
% 1 minute = 60 seconds
m= find(t_gmt<datenum(2011,3,11,15,50,0));  %adjusted 8/21/13
fs = 1/60;
Pxx = periodogram(one_min_intp(m));
H_pre = dspdata.psd(Pxx,'Fs',fs);
fH_mry = plot(H_pre);
saveas(fH_mry,'../images/PSD_mry_pre_tsu.png');

floglog_psd_mry = figure(87);
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
saveas(floglog_psd_mry,'../images/log_log_PSD_mry_pre_tsu.eps');


% post-tsunami only
m= find(t_gmt>datenum(2011,3,11,15,52,0));  % by inspection
Pxx = periodogram(one_min_intp(m));
H_tsu = dspdata.psd(Pxx,'Fs',fs);

% variance preserving?

fvp = figure;
semilogx(H_pre.Frequencies,H_pre.Data.*H_pre.Frequencies,'k');
hold on
semilogx(H_tsu.Frequencies,H_tsu.Data.*H_tsu.Frequencies,'r');

loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power Spectral Density [m^2]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
saveas(fvp,'../images/var_preserve_spectra_arc.eps');





figure
fH_mry_tsu_only = plot(H_tsu);
saveas(fH_mry_tsu_only,'../images/PSD_mry_tsu_only.png');


floglog_psd_mry_tsu_only = figure(81);
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])

ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'tsunami conditions'})
saveas(floglog_psd_mry_tsu_only,'../images/log_log_PSD_mry_tsu_only.png');


side_by_side = figure(12);
subplot(1,2,1)
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
title({'March 7-11, 2011','normal'})

subplot(1,2,2)
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])
xlabel('Frequency [Hz]')
title({'March 11-16, 2011','tsunami'})
saveas(side_by_side,'../images/normal_and_tsunami_mry_loglog_psd.eps')



side_by_side_plus_timeseries = figure;
 set(side_by_side_plus_timeseries, 'Position', [100 500 960 820])

subplot(3,2,1:2)
plot(t_gmt,one_min,'k')
datetick2('x','keeplimits')
ylim([-1.5 2.0])
ylabel('MLLW [m]')
xlabel('2011, GMT')
title(['NOAA tsunami-capable gauge - ',station.name,' ',num2str(station.id)])

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
filename = '../images/normal_and_tsunami_mry_loglog_psd_with_timeseries';
saveas(side_by_side_plus_timeseries,filename,'eps')
saveas(side_by_side_plus_timeseries,filename,'png')

side_by_side_plus_timeseries_cheat1 = figure;
 set(side_by_side_plus_timeseries_cheat1, 'Position', [100 500 960 720])

subplot(3,2,1:2)
plot(t_gmt,one_min,'k')
xlim([datenum(2011,3,7,12,0,0) datenum(2011,3,16,12,0,0)])
datetick('x','keeplimits')
ylim([-1.5 2.0])
ylabel('MLLW [m]')
xlabel('2011, GMT')
title(['NOAA tsunami-capable gauge - ',station.name,' ',num2str(station.id)])

filename = '../images/normal_and_tsunami_mry_loglog_psd_with_timeseries_cheat1';
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
filename = '../images/normal_and_tsunami_mry_loglog_psd_with_timeseries_cheat2';
saveas(side_by_side_plus_timeseries_cheat2,filename,'eps')
saveas(side_by_side_plus_timeseries_cheat2,filename,'png')

% variance -preserving

fvp = figure(810);
semilogx(H_tsu.Frequencies,H_tsu.Data.*H_tsu.Frequencies,'color',[0.7 0.7 0.7]);
hold on
semilogx(H_pre.Frequencies,H_pre.Data.*H_pre.Frequencies,'k','linewidth',2);


ylabel('Power Spectral Density [m^2]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
filename = '../images/var_preserve_spectra_mry';
saveas(fvp,filename,'epsc');
saveas(fvp,filename,'jpg');
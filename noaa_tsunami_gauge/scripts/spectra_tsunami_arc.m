% 5/9/2013
% spectra - tsunami stations - noaa stations
% m. williams

clear all;
% close all;

load ../edited_data/arc_tsunami_noaa_gauge.mat

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
saveas(f,'../images/time_record_arc.eps')

% fill in NaNs (after you made them.  way to go, megan)     
one_min_intp = interp1(t_gmt(isfinite(one_min)),one_min(isfinite(one_min)),t_gmt);
figure
plot(t_gmt,one_min_intp,'r')
hold all
plot(t_gmt,one_min)


% i know that the sampling period is 1 minute
% 1 minute = 60 seconds
% ARC at 15:30 on 3/11
m= find(t_gmt<datenum(2011,3,11,15,30,0));
fs = 1/60;
Pxx = periodogram(one_min_intp(m));
H_pre = dspdata.psd(Pxx,'Fs',fs);
fH_arc = plot(H_pre);
saveas(fH_arc,'../images/PSD_arc_pre_tsu.png');

floglog_psd_arc = figure(87);
loglog(H_pre.Frequencies,H_pre.Data,'k')
ylim([1E-8 1E2])
ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'normal conditions'})
saveas(floglog_psd_arc,'../images/log_log_PSD_arc_pre_tsu.eps');


% post-tsunami only
m= find(t_gmt>datenum(2011,3,11,16,20,0));  % by inspection
Pxx = periodogram(one_min_intp(m));
H_tsu = dspdata.psd(Pxx,'Fs',fs);
figure
fH_arc_tsu_only = plot(H_tsu);
saveas(fH_arc_tsu_only,'../images/PSD_arc_tsu_only.png');


floglog_psd_arc_tsu_only = figure(81);
loglog(H_tsu.Frequencies,H_tsu.Data,'k')
ylim([1E-8 1E2])

ylabel('Power/Frequency [dB Hz^{-1}]')
xlabel('Frequency [Hz]')
title({[station.name,' NOAA tsunami capable station, ',num2str(station.id)],'tsunami conditions'})
saveas(floglog_psd_arc_tsu_only,'../images/log_log_PSD_arc_tsu_only.png');


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
saveas(side_by_side,'../images/normal_and_tsunami_arc_loglog_psd.eps')


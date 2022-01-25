% 5/9/2013
% spectra - tsunami stations - noaa stations
% m. williams
% 8/20/2013 - going to try to make the spectra variance-preserving.


clear all;
% close all;

load ../edited_data/mry_tsunami_noaa_gauge.mat
t_gmt = t_gmt - datenum(2009,12,30);

% one minute NOAA data

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

% fill in NaNs (after you made them.  way to go, megan)     
one_min_intp = interp1(t_gmt(isfinite(one_min)),one_min(isfinite(one_min)),t_gmt);

figure
plot(t_gmt,one_min_intp,'r')
hold all
plot(t_gmt,one_min)

m= find(t_gmt<datenum(2011,3,11,15,50,0));  %adjusted 8/21/13
fs = 1/60;
l = length(t_gmt);
T = 1/fs;

% windows:

% window...
window_minutes = 100;
overlap = 20;

wind = make_time_window_minute(window_minutes,overlap,T,l);
L = length(wind);
ta_30 = NaN(1,L);
if wind(2,1)-wind(1,1)<256
    nfreq = 129;
end

data_30 = NaN(L,nfreq);

i = 2;

for i = 1:L
    ta_30(i) = mean(t_gmt(wind(1,i):wind(2,i)));
    t_30_win = t_gmt(wind(1,i):wind(2,i));
    d_30 = one_min_intp(wind(1,i):wind(2,i));
    d_30 = detrend(d_30,'linear');
    
    pxx = periodogram(d_30);
    H30 = dspdata.psd(pxx,'Fs',fs);
    data_30(i,:) = H30.data;
    
    
    
    fvp = figure(99);
    subplot(4,1,1:3)
    semilogx(H30.Frequencies,H30.Data.*H30.Frequencies,'k')
    filename = ['../images/window_spectra/overlapping_window_vps_',num2str(i)];
title({[datestr(ta_30(i),'dd-mmm HH:MM')],[num2str(window_minutes),' minute window, ',num2str(overlap),' minute overlap']})
    ylabel('Power Spectral Density [m^2]')
    xlabel('Frequency [Hz]')
%     ylim([0 1.2E-3])
    subplot(4,1,4)
    plot(t_gmt,one_min_intp,'color',[.7 .7 .7]), hold on
    plot(t_30_win,one_min_intp(wind(1,i):wind(2,i)),'k')
    datetick('x','keeplimits')
    
    saveas(fvp,filename,'jpg')
    saveas(fvp,filename,'epsc')
    clf
    
end
freq_30 = H30.frequencies;

f_pcolor = figure;
 set(f_pcolor, 'Position', [100 500 960 820])
subplot(4,1,1:3)
pcolor(ta_30,freq_30,data_30'.*freq_30), shading flat
caxis([0 .01])
set(gca, 'YScale', 'log')
title({[num2str(window_minutes),' minute window, ',num2str(overlap),' minute overlap']})
ylabel('frequency [hz]')
subplot(4,1,4)
plot(t_gmt,one_min_intp,'k')
ylabel('tide [m]')
datetick2('x','keeplimits')
filename = '../images/spectra_time_mry_pcolor_w_tide';
saveas(f_pcolor,filename,'epsc')
saveas(f_pcolor,filename,'jpg')



save ../edited_data/mry_vps_data *_30 t_gmt one_min_intp



% % variance -preserving

% fvp = figure(810);
% semilogx(H_tsu.Frequencies,H_tsu.Data.*H_tsu.Frequencies,'color',[0.7 0.7 0.7]);
% hold on
% semilogx(H_pre.Frequencies,H_pre.Data.*H_pre.Frequencies,'k','linewidth',2);

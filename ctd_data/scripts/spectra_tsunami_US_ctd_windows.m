

clear all;
close all;

load ../edited_data/ctd_matched_noaa_for_tsunami_spectra

t_gmt = t_gmt';
% datestr(t_gmt(1))
t_gmt = t_gmt - datenum(2010,12,30);
% datestr(t_gmt(1))

depth = d;

% window...
window_minutes = 100;
overlap = 20;
T = 60;
l = length(t_gmt);

wind = make_time_window_minute(window_minutes,overlap,T,l);
L = length(wind);
ta_win = NaN(1,L);
size_window = wind(2,1)-wind(1,1);
if size_window<256
    nfreq = 129;
else
   pow = nextpow2(size_window)-1;
   nfreq = 2^pow + 1;
end

data = NaN(L,nfreq);

fs = 1/T;

for i = 1:L
    ta_win(i) = mean(t_gmt(wind(1,i):wind(2,i)));
    t_win = t_gmt(wind(1,i):wind(2,i));
    d_win = d(wind(1,i):wind(2,i));
    d_win = detrend(d_win,'linear');
    
    pxx = periodogram(d_win);
    H = dspdata.psd(pxx,'Fs',fs);
    data(i,:) = H.data;
%     
%    fvp = figure(99);
%     set(fvp, 'Position', [100 500 750 500])
% 
%     subplot(4,1,1:3)
%     semilogx(H.Frequencies,H.Data.*H.Frequencies,'k')
%     
%     title({['Pescadero ',datestr(ta_win(i),'dd-mmm HH:MM')],[num2str(window_minutes),' minute window, ',num2str(overlap),' minute overlap']})
%     ylabel('Power Spectral Density [m^2]')
%     xlabel('Frequency [Hz]')
% %     ylim([0 1.2E-3])
%     subplot(4,1,4)
%     plot(t_gmt,depth,'color',[.7 .7 .7]), hold on
%     plot(t_win,depth(wind(1,i):wind(2,i)),'k')
%     datetick('x','keeplimits')
%     
%     filename = ['../images/window_spectra/overlapping_window_vps_pdo_',num2str(i)];
%     saveas(fvp,filename,'jpg')
%     saveas(fvp,filename,'epsc')
%     clf

    
    
end


f_pcolor = figure;
set(f_pcolor,'Position',[100 500 1000 600])
freq = H.Frequencies;
freq_cph = freq;
subplot(4,1,1:3)
pcolor(ta_win,freq_cph,data'), shading flat
set(gca, 'YScale', 'log')
ylabel('freq [hz]')
xlim([min(t_gmt) max(t_gmt)])    
datetick2('x','keeplimits')
title({['Pescadero --',num2str(window_minutes),' minute window, ',num2str(overlap),' minute overlap variance-preserving power spectra']})


subplot(4,1,4)
plot(t_gmt,depth,'k')
xlim([min(t_gmt) max(t_gmt)])    
datetick2('x','keeplimits')

filename =  ['../images/pcolor_variance_spectra_pescadero_',num2str(window_minutes),'_win_',num2str(overlap),'_ol'];
saveas(f_pcolor,filename,'jpg')
saveas(f_pcolor,filename,'epsc')

save ../edited_data/pdo_vps_data ta_win freq_cph data t_gmt depth

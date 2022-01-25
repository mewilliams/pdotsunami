% close all

load 017295_20110516_1308
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
[depth_adj] = adjust_depth_with_air_pressure_internet(pres,t_gmt);
depth = depth_adj;


figure
plot(t_gmt, depth)

m= find(and(t_gmt>datenum(2011,3,10,19,30,0),t_gmt<datenum(2011,3,29,0,0,0)));
depth = depth(m);
tS = tS(m);
t_gmt = t_gmt(m);

l = length(tS);
% 30 minute window
n_30m = 1800/RBR.sampleperiod;
window_30 = 1:n_30m/3:l;
window_30(2,:) = window_30(1,:)+n_30m-1;
L = length(window_30);

% 90 minute window
n_90m = 5400/RBR.sampleperiod;
window_90 = 1:n_90m/3:l;
window_90(2,:) = window_90(1,:)+n_90m-1;
L90 = length(window_90);

% 180 minute window
n_180m = (180*60)/RBR.sampleperiod;
window_180 = 1:n_180m/3:l;
window_180(2,:) = window_180(1,:)+n_180m-1;
L180 = length(window_180);


fs = 1/RBR.sampleperiod;
% 
% for i = 1:L
% % for i = 17
% d = depth(window_30(1,i):window_30(2,i));
% t = t_gmt(window_30(1,i):window_30(2,i));
% 
% X = detrend(d,'linear');
% 
% % [pxx,f] = pwelch(X,15,5,15,fs);
% 
% Pxx = periodogram(X);
% figure(99)
% H = dspdata.psd(Pxx,'Fs',fs);
% 
% loglog(H.Frequencies,H.Data)
% hold all
% end
    
for i = 10:16
    d180 = depth(window_180(1,i):window_180(2,i));
    t180 = t_gmt(window_180(1,i):window_180(2,i));
    X180 = detrend(d180,'linear');
    Pxx = periodogram(X180);
    H = dspdata.psd(Pxx,'Fs',fs);
    figure(991)
    loglog(H.Frequencies,H.Data), hold all
end
    
    

f1 = figure;
plot(tS,depth,'k')
datetick2('x','keeplimits')
ylabel('depth [m]')
title('data window used for spectra?')
saveas(f1,'../images/depth_data_for_spectra.png')


fs = 1/RBR.sampleperiod;

Pxx = periodogram(depth);
H_pre = dspdata.psd(Pxx,'Fs',fs);
fH_pdo = figure;
plot(H_pre);
saveas(fH_pdo,'../images/PSD_try1.png');

floglog_psd_mry = figure(87);
loglog(H_pre.Frequencies,H_pre.Data,'k')

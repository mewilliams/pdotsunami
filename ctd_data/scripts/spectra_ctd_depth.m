close all

load 017295_20110516_1308
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
% figure
% plot(tS, depth)

m= find(and(tS<datenum(2011,3,12,6,0,0),tS>datenum(2011,3,11,12,0,0)));
depth = depth(m);
tS = tS(m);
f1 = figure;
plot(tS,depth,'k')
datetick2('x','keeplimits')
ylabel('depth [m]')
title('data window used for spectra?')
saveas(f1,'../images/depth_data_for_spectra.png')


fs = 1/RBR.sampleperiod;

Pxx = periodogram(depth);
H_pre = dspdata.psd(Pxx,'Fs',fs);
fH_pdo = figure
plot(H_pre);
saveas(fH_pdo,'../images/PSD_try1.png');

floglog_psd_mry = figure(87);
loglog(H_pre.Frequencies,H_pre.Data,'k')

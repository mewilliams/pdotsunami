% spectra on depth sensors in pescadero - march 2011

clear all;
close all;

load 017296_20110415_1202  %upstream bed sensor?
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);



M(1) = find(tS>datenum(2011,1,29),1,'first');
M(2) = find(tS>datenum(2011,3,26),1,'first');

m = M(1):M(2);
sampleperiod = RBR.sampleperiod;

% % % % data changed to 0.1 Hz
% m = M(1):10:M(2);
% sampleperiod = RBR.sampleperiod*10;
% % %


tS = tS(m)';
tS = tS-datenum(2010,12,30);
salt = salt(m);
temp = temp(m);
pres = pres(m);
depth = depth(m);

clear  m RBR M



T = sampleperiod;
Fs = 1/T;
L = length(tS);
t = (0:L-1)*T;
figure
plot(t(1:500),depth(1:500))
title('signal')
xlabel('seconds')
nfft = 2^nextpow2(L);
depth_zeroed = depth-nanmean(depth);

%10 minute smooth:
depth_smooth_10min = smooth(depth_zeroed,600/sampleperiod);
waves_10 = depth_zeroed - depth_smooth_10min;
figure
plot(tS,waves_10)
datetick2('x')


Y = fft(depth_zeroed,nfft)/L;
f = Fs/2*linspace(0,1,nfft/2+1);

figure
semilogx(f,2*abs(Y(1:nfft/2+1)),'.')



n1 = 1:512:length(tS);
n2 = n1+1023;
Ln1 = length(n1);  
n1 = n1(1:Ln1-2);   %length that actually stays within the data...
n2 = n2(1:Ln1-2);   
save_fft = NaN(length(n1),1024/2+1);
time_i = NaN(size(n1));

for i = 1:length(n1)
% i = 1;
di = waves_10(n1(i):n2(i));

L = length(tS(n1(i):n2(i)));
t = (0:L-1)*T;
nfft = 2^nextpow2(L);
Y = fft(di,nfft)/L;
f = Fs/2*linspace(0,1,nfft/2+1);

save_fft(i,1:length(f)) = 2*abs(Y(1:nfft/2+1));
time_i(i) = nanmean(tS(n1(i):n2(i)));

depth_all = depth(n1(i):n2(i));
Y_whole_spectra = fft(depth_all,nfft)/L;
save_fft_whole_spectra(i,1:length(f)) = 2*abs(Y_whole_spectra(1:nfft/2+1));

end

ylim([70 80])

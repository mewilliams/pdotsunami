% created 04/25/2013
% m. williams

clear all; close all;

% Upstream CTD bed sensor.
load 017296_20110415_1202
[t,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
% still needs to be adjusted for atmospheric pressure!

%data period around tsunami
m = 5.5e4:6.6e4;

figure, plot(t(m),depth(m))
fs = 1/RBR.sampleperiod;
x = depth - mean(depth);

[pxx,f] = pwelch(x,fs);
figure
semilogx(f,10*log10(pxx))
hold all
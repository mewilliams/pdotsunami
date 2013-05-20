clear all; 
close all;

load 017295_20110516_1308
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
f = figure;
subplot(3,1,1), plot(tS,depth), hold all
ylabel('depth [m]')
subplot(3,1,2), plot(tS,salt), hold all
subplot(3,1,3), plot(tS,temp), hold all
datetick2('x')
ylabel('salt')
xlim([datenum(2011,3,10,3,23,0) datenum(2011,3,15,3,45,0)])

load 017296_20110415_1202
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);

subplot(3,1,1), plot(tS,depth)
subplot(3,1,2), plot(tS,salt)
subplot(3,1,3), plot(tS,temp)

datetick2('x','keeplimits')

filename = '../images/bed_sensors_DST';

saveas(f,filename,'png')
saveas(f,filename,'eps')

xlim([datenum(2011,3,11,20,0,0) datenum(2011,3,12,12,0,0)])

datetick2('x','keeplimits')

filename = '../images/bed_sensors_DST_march12_vs';

saveas(f,filename,'png')
saveas(f,filename,'eps')


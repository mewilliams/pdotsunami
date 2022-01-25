% 11/19/2013
%
% M. Williams

grl_figure_startup

clear all;
close all;






f = figure;


set(gcf,'units','centimeters')
set(gcf,'paperunits','centimeters')
set(gcf,'position',[0 0 19.5 8]);
pos = get(gcf,'position');
ppos = get(gcf, 'paperposition');
ppos(3:4) = pos(3:4);
set(gcf,'paperposition',ppos);
set(gcf,'paperpositionmode','manual');
% set(gcf, 'Renderer', 'zbuffer');

% for grey lines.. 
cb = [0;.4;.525;.65;.8]; 
cb = [cb cb cb];

load ../edited_data/DS_ctd_tsunami.mat
% file should have 5 sensors.  all 5 should have depth records because both
% get_ctds_tsunami.m and get_pressure_10364_tsunami.m have been run.  

% get rid of early sensor data before ctd was in the water.
d_ds5(1:250) = NaN;  
s_ds5(1:250) = NaN;  

d_ds4(1:50) = NaN;  
s_ds4(1:50) = NaN;  

d_ds3(1:60) = NaN;  
s_ds3(1:60) = NaN;  

d_ds2(1:70) = NaN;  
s_ds2(1:70) = NaN;  

d_ds1(1:80) = NaN;  
s_ds1(1:80) = NaN;  

% year zero
zeroyear = datenum(2010,12,30);
t_gmtds1 = t_gmtds1 - zeroyear;
t_gmtds2 = t_gmtds2 - zeroyear;
t_gmtds3 = t_gmtds3 - zeroyear;
t_gmtds4 = t_gmtds4 - zeroyear;
t_gmtds5 = t_gmtds5 - zeroyear;



% plot c - pretsunami salt
sp(3) = subplot(2,1,1);
N=5;
C = linspecer(N);
% axes('NextPlot','replacechildren', 'ColorOrder',C);
plot(t_gmtds1,s_ds1,'color',C(1,:))
hold all
plot(t_gmtds2,s_ds2,'color',C(2,:))
plot(t_gmtds3,s_ds3,'color',C(3,:))
plot(t_gmtds4,s_ds4,'color',C(4,:))
plot(t_gmtds5,s_ds5,'color',C(5,:))
% set(gca,'TickDir','out')
ylabel('Salinity')
ylim([-1 33])
xlim([70.8 77.8])
text(70.8 + 0.0300*7,(4/5)*34 -1,'(a)')

datetick('x','keeplimits')

% % GRAY SCALE
sp(5) = subplot(2,1,2);
plot(t_gmtds1,d_ds1,'color',C(1,:))
hold all
plot(t_gmtds2,d_ds2,'color',C(2,:))
plot(t_gmtds3,d_ds3,'color',C(3,:))
plot(t_gmtds4,d_ds4,'color',C(4,:))
plot(t_gmtds5,d_ds5,'color',C(5,:))
set(gca,'ticklength',0.5.*get(gca,'ticklength'))
xlabel('2011, GMT')
% 
% % Colors!!!
% sp(5) = subplot(2,1,2);
% plot(t_gmtds1,d_ds1)
% hold all
% plot(t_gmtds2,d_ds2)
% plot(t_gmtds3,d_ds3)
% plot(t_gmtds4,d_ds4)
% plot(t_gmtds5,d_ds5)
% set(gca,'ticklength',0.5.*get(gca,'ticklength'))


% set(gca,'TickDir','out')
ylabel({'Sensor','depth [m]'})
ylim([0 2.6])
xlim([70.8 77.8])
text(70.8 + 0.0300*7,0+(4/5)*2.5,'(b)')

datetick('x','keeplimits')


axesHandles = get(gcf,'children');
set(axesHandles,'ticklength',[.0025 .1])
set(axesHandles,'TickDir','out')


set(axesHandles,'YMinorTick','on')

datetick('x','keeplimits')


packrows(2,1)

datetick('x','keeplimits')


print(gcf,'-depsc','../../paper_final_images/fig4')
print(gcf,'-dpng','../../paper_final_images/fig4')
print(gcf,'-depsc','~/Dropbox/grl_tsunami_paper/paper_final_images/redonedec2014/fig4')

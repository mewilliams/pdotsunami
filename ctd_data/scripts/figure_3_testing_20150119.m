% 11/19/2013
%
% M. Williams
% editing on 01/19/2015.. Is salt advecting in and out, or mixing?


grl_figure_startup

clear all;
close all;



f = figure;

set(gcf,'units','centimeters')
set(gcf,'paperunits','centimeters')
set(gcf,'position',[0 0 19.8 12]);
pos = get(gcf,'position');
ppos = get(gcf, 'paperposition');
ppos(3:4) = pos(3:4);
set(gcf,'paperposition',ppos);
set(gcf,'paperpositionmode','manual');
% set(gcf, 'Renderer', 'zbuffer');

% for grey lines.. 
cb = [0;.4;.525;.65;.8]; 
cb = [cb cb cb];
N=5;
C = linspecer(N);

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
sp(3) = subplot(3,1,2);
plot(t_gmtds1,s_ds1,'color',C(1,:))
hold all
plot(t_gmtds2,s_ds2,'color',C(2,:))
plot(t_gmtds3,s_ds3,'color',C(3,:))
plot(t_gmtds4,s_ds4,'color',C(4,:))
plot(t_gmtds5,s_ds5,'color',C(5,:))
% set(gca,'TickDir','out')
ylabel('Salinity')
ylim([-1 33])
% xlim([70.8 71.8])
text(70.83,(4/5)*34 -1,'(c)')
set(gca,'YMinorTick','on')

datetick('x','keeplimits')
% 
% % plot d - tsunami salt
% sp(4) = subplot(6,1,4);
% plot(t_gmtds1,s_ds1,'color',C(1,:))
% hold all
% plot(t_gmtds2,s_ds2,'color',C(2,:))
% plot(t_gmtds3,s_ds3,'color',C(3,:))
% plot(t_gmtds4,s_ds4,'color',C(4,:))
% plot(t_gmtds5,s_ds5,'color',C(5,:))
% % set(gca,'TickDir','out')
% ylabel('Salinity')
% ylim([-1 33])
% xlim([71.8 72.8])
% text(71.83,(4/5)*34-1,'(d)')
% set(gca,'YMinorTick','on')
% 
% datetick('x','keeplimits')


sp(5) = subplot(3,1,3);
plot(t_gmtds1,d_ds1,'color',C(1,:))
hold all
plot(t_gmtds2,d_ds2,'color',C(2,:))
plot(t_gmtds3,d_ds3,'color',C(3,:))
plot(t_gmtds4,d_ds4,'color',C(4,:))
plot(t_gmtds5,d_ds5,'color',C(5,:))
set(gca,'ticklength',0.5.*get(gca,'ticklength'))

% set(gca,'TickDir','out')
ylabel({'Sensor','depth [m]'})
ylim([0 2.5])
% xlim([70.8 71.8])
text(70.83,0+(4/5)*2.5,'(e)')
set(gca,'YMinorTick','on')

% 
% datetick('x','keeplimits')
% 
% sp(6) = subplot(6,1,6);
% plot(t_gmtds1,d_ds1,'color',C(1,:))
% hold all
% plot(t_gmtds2,d_ds2,'color',C(2,:))
% plot(t_gmtds3,d_ds3,'color',C(3,:))
% plot(t_gmtds4,d_ds4,'color',C(4,:))
% plot(t_gmtds5,d_ds5,'color',C(5,:))
% xlim([71.8 72.8])
% ylabel({'Sensor','depth [m]'})
% ylim([0 2.5])
% text(71.83,(4/5)*2.5,'(f)')
% set(gca,'YMinorTick','on')


datetick('x','keeplimits')

cd ~/Research/Pescadero/ADCP/20110412/scripts/

load ../edited_data/depth_time_data.mat
load ../edited_data/burst_increments.mat
load ../edited_data/rotated_princ_dir_depth_avg_vel.mat

m = find(time_adcp<datenum(2011,3,16));
mb = find(ib>max(m),1,'first');

%shorten the file to exclude somewhat closed conditions.
ib_da = ib(1:mb);

% ta_z = time_adcp-datenum(2010,12,30);
ta_gmt = pacific_to_gmt(time_adcp);
ta_z = ta_gmt - zeroyear;


for i = 1:length(ib_da)-2
    
    subplot(3,1,1)
    plot(ta_z(ib(i):ib(i+1)-1),rotU(ib(i):ib(i+1)-1),'k'), hold on
% 
%     subplot(6,1,2)
%     plot(ta_z(ib(i):ib(i+1)-1),rotU(ib(i):ib(i+1)-1),'k'), hold on

end

cd ~/Research_new/tsunami/ctd_data/scripts

axesHandles = get(gcf,'children');
set(axesHandles,'ticklength',[.0025 .1])
set(axesHandles,'TickDir','out')

subplot(3,1,1)
ylim([-0.4 0.6])
ylabel('u [m s^{-1}]')
% xlim([70.8 71.8])
set(gca,'YTick',[-0.25 0 0.25 0.5])

text(70.83,-0.6 + (4/5)*1.2,'(a)')

% datetick('x','keeplimits')
% 
% subplot(6,1,2)
% ylim([-0.4 0.6])
% ylabel('u [m s^{-1}]')
% xlim([71.8 72.8])
% text(71.83,-0.6 + (4/5)*1.2,'(b)')
% set(gca,'YTick',[-0.25 0 0.25 0.5])
% 


datetick2('x','keeplimits')

% 
% packrows(6,1)
% datetick('x','keeplimits')
% 
% print(gcf,'-depsc','../../paper_final_images/fig3')
% print(gcf,'-dpng','../../paper_final_images/fig3')
% 
% print(gcf,'-depsc','~/Dropbox/grl_tsunami_paper/paper_final_images/redonedec2014/fig3')

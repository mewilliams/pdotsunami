% figure_2_GRL_publishable.m
% 11/20/2013
% m. williams
%
%


grl_figure_startup
set(0,'defaultaxesfontsize',6);

clear all;
close all;

set(gcf,'units','centimeters')
set(gcf,'paperunits','centimeters')
set(gcf,'position',[0 0 15 15]);
pos = get(gcf,'position');
ppos = get(gcf, 'paperposition');
ppos(3:4) = pos(3:4);
set(gcf,'paperposition',ppos);
set(gcf,'paperpositionmode','manual');

% %%  I think this has to be commented out.. code didn't work with it on
% % 11/29/2013.
% make_it_tight = true;
% subplot = @(m,n,p) subtightplot (m, n, p, [0.01 0.05], [0.1 0.1], [0.2 0.01]);
% if ~make_it_tight,  clear subplot;  end
%%

load ../edited_data/mry_vps_data.mat
t_gmt_mry = t_gmt-365;
ta_30 = ta_30-365;
[t_grid,f_grid] = meshgrid(ta_30,freq_30);


% ha = tight_subplot(4,1,[.01 .03],[.1 .01],[.01 .01]);
% ha(1:3)

% h=subtightplot(4,1,1:3,[0.5,0.2]);
subplot(8,1,1:3)
pcolor(ta_30,freq_30*3600,data_30'.*f_grid), shading flat

shading flat
set(gca, 'YScale', 'log')
caxis([0 .0001])
xlim([70 76.5])
xl = xlim;
yl = ylim;
hold on, plot(xl,[3600/30 3600/30],'w--')
plot(xl,[3600/300 3600/300],'w--')
ylim(yl)
text(xl(1) + 1/24, yl(2)-10,'(a)','color','w')
text(xl(1) + 6/24, 3600/300-2,'12 cph','color','w')


ylabel({'Frequency [cph]'})
set(gca,'YTick',[1 10])
set(gca,'YTickLabel',[1 10])


datetick('x','keeplimits')
set(gca,'xticklabel',{}')

% h=subtightplot(4,1,4,[0.5,0.2]);
a4 = subplot(8,1,4);
plot(t_gmt_mry,one_min_intp,'k')
ylabel({'Sea','level [m]'})
ylim([-0.5 2])
xlim([70 76.5])
yl = ylim;
text(xl(1) + 1/24, yl(2)-(yl(2)-yl(1))/4,'(b)')

datetick('x','keeplimits')
set(gca,'xticklabel',{}')


load ../../ctd_data/edited_data/pdo_vps_data
[t_grid_ctd,f_grid_ctd] = meshgrid(ta_win,freq_cph);

subplot(8,1,5:7)
pcolor(ta_win,freq_cph*3600,data'.*f_grid_ctd)
ylabel({'Frequency [cph]'})
set(gca,'YTick',[1 10])
set(gca,'YTickLabel',[1 10])
shading flat
set(gca, 'YScale', 'log')
set(gca,'TickDir','out')
yl = ylim;
hold on, plot(xl,[3600/30 3600/30],'w--')
plot(xl,[3600/300 3600/300],'w--')
ylim(yl)

text(xl(1) + 1/24, yl(2)-10,'(c)','color','w')
text(xl(1) + 6/24, 3600/300-2,'12 cph','color','w')

caxis([0 .00001])
xlim([70 76.5])
datetick('x','keeplimits')
set(gca,'xticklabel',{}')

a8 = subplot(8,1,8);
plot(t_gmt,depth,'k')
set(gca,'fontsize',6)

ylim([1 2.5])
xlim([70 76.5])
yl = ylim;
text(xl(1) + 1/24, yl(2)-(yl(2)-yl(1))/4,'(d)')

ylabel({'Sensor','depth [m]'})
datetick('x','keeplimits')

axesHandles = get(gcf,'children');
set(axesHandles,'ticklength',[.0025 .1])
set(axesHandles,'TickDir','out')


colormap(lbmap(256,'RedBlue'))
colormap(flipud(colormap))

print(gcf,'-depsc','../../paper_final_images/fig2')
print(gcf,'-dpng','../../paper_final_images/fig2')
print(gcf,'-dtiff','~/Dropbox/grl_tsunami_paper/paper_final_images/redonedec2014/fig2','-r450')

figure


set(gcf,'units','centimeters')
set(gcf,'paperunits','centimeters')
set(gcf,'position',[0 0 15 15]);
pos = get(gcf,'position');
ppos = get(gcf, 'paperposition');
ppos(3:4) = pos(3:4);
set(gcf,'paperposition',ppos);
set(gcf,'paperpositionmode','manual');

subplot(8,1,1:3)
h = colorbar
set(get(h,'ylabel'),'string','[m^2]')


colormap(lbmap(256,'RedBlue'))
colormap(flipud(colormap))
caxis([0 .0001])
subplot(8,1,5:7)
h = colorbar
caxis([0 .00001])
set(get(h,'ylabel'),'string','[m^2]')

% subplot(8,1,8)
% delete(a8)
% delete(a4)
% 
% print(gcf,'-depsc','../../paper_final_images/fig2_wcolorbar')
% print(gcf,'-dpng','../../paper_final_images/fig2_wcolorbar')
 print(gcf,'-dtiff','~/Dropbox/grl_tsunami_paper/paper_final_images/redonedec2014/fig2_colorbaronly','-r450')
 


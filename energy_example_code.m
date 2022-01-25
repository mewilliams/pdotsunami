clear all; 

t = 0:1:40*60;
t_min = t/60;
ubar_sin = 0.2*sin((t+3600)*2*pi*1/(12*3600));

tsunami = 1.4*sin(t*2*pi*1/(40*60));
tsun_damp = tsunami;
tsun_damp(tsun_damp<0) = 0;

uIG_plt = ubar_sin +  0.2*sin(t*2*pi*1/120);
uIG = 0.2*sin(t*2*pi*1/120);

uIG_plt_damped = tsun_damp.*uIG_plt;
uIG_damped = tsun_damp.*uIG;

KE_u_tides = 1020*ubar_sin.^2;
KE_uIG = 1020*uIG.^2;
KE_utsun = 1020*uIG_damped.^2;


f = figure;
set(f, 'Position', [100 500 600 600])

subplot(2,1,1)
plot(t_min,ubar_sin,'k','linewidth',2), hold all
plot(t_min,uIG_plt,'--','linewidth',2)
plot(t_min,uIG_plt_damped,'r-.','linewidth',2)
ylim([-0.2 0.5])
ylabel({'U','m s^{-1}'})

subplot(2,1,2)
plot(t_min,1020*ubar_sin.^2,'k','linewidth',2), hold all
plot(t_min,1020*uIG.^2,'--','linewidth',2)
plot(t_min,1020*uIG_damped.^2,'r-.','linewidth',2)
ylabel({'KE ~ \rho U^2','[J m^{-3}]'})
xlabel('Time [minutes]')

saveas(f,'~/Dropbox/energy_example','epsc')
saveas(f,'~/Dropbox/energy_example','png')

% legend('U_{tide}','U_{IG}','U_{tsunami}','Location','EastOutside')
% 
% saveas(f,'~/Dropbox/energy_example_legend','epsc')
% saveas(f,'~/Dropbox/energy_example_legend','png')



f = figure;
set(f, 'Position', [100 500 600 900])
subplot(3,1,1)
plot(t_min,tsunami,'r','linewidth',2)
ylabel('Tsunami wave')

subplot(3,1,2)
% plot(t_min,ubar_sin,'k','linewidth',2), hold all
% plot(t_min,uIG_plt,'--','linewidth',2)
plot(t_min,uIG_plt_damped,'r-.','linewidth',2)
ylim([-0.2 0.5])
ylabel({'U','m s^{-1}'})

subplot(3,1,3)
plot(t_min,1020*ubar_sin.^2,'k','linewidth',2), hold all
plot(t_min,1020*uIG.^2,'--','linewidth',2)
plot(t_min,1020*uIG_damped.^2,'r-.','linewidth',2)
ylabel({'KE ~ \rho U^2','[J m^{-3}]'})
xlabel('Time [minutes]')
ylim([0 80])
saveas(f,'~/Dropbox/energy_example5','epsc')
saveas(f,'~/Dropbox/energy_example5','png')


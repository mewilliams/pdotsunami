clear all;
close all;

load 009783_051111_pressuer
[tS,pres,sn] = get_RBR_depth(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

load ../edited_data/DS_ctd_tsunami.mat

d_ds3 = interp1(t_gmt,da,t_gmtds3);
p_ds3 = interp1(t_gmt,pres,t_gmtds3);

save ../edited_data/DS_ctd_tsunami.mat *ds*
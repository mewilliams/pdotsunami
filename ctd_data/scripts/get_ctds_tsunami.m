% 6/5/13

clear all;
close all;

load 017295_20110516_1308
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtds1 = t_gmt;
d_ds1 = da;
s_ds1 = salt;
temp_ds1 = temp;
SN_ds1 = SN;
p_ds1 = pres;


load 009620_20110516_1321
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtds2 = t_gmt;
d_ds2 = da;
s_ds2 = salt;
temp_ds2 = temp;
p_ds2 = pres;

SN_ds2 = SN;


load 010364_ds_051111
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = NaN(size(t_gmt));

t_gmtds3 = t_gmt;
d_ds3 = da;
s_ds3 = salt;
temp_ds3 = temp;
p_ds3 = pres;

SN_ds3 = SN;


load 017015_20110516_1333
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtds4 = t_gmt;
d_ds4 = da;
s_ds4 = salt;
temp_ds4 = temp;
p_ds4 = pres;

SN_ds4 = SN;



load 017294_20110516_1301
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtds5 = t_gmt;
d_ds5 = da;
s_ds5 = salt;
temp_ds5 = temp;
p_ds5 = pres;


SN_ds5 = SN;


save ../edited_data/DS_ctd_tsunami.mat *ds*
clear all

load 017296_20110415_1202
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtus1 = t_gmt;
d_us1 = da;
s_us1 = salt;
temp_us1 = temp;
p_us1 = pres;

SN_us1 = SN;


load 017293_20110419_1941
[tS,salt,temp,SN,pres,depth] = get_RBR_data(RBR);
t_gmt = pacific_to_gmt(tS);
da = adjust_depth_with_air_pressure_internet(pres,t_gmt);

t_gmtus2 = t_gmt;
d_us2 = da;
s_us2 = salt;
temp_us2 = temp;
p_us2 = pres;

SN_us2 = SN;


save ../edited_data/US_ctd_tsunami.mat *us*



///variables
//create camera
instance_create_depth(x,y,0,o_cam);
//create hands
instance_create_depth(x,y,0,o_playerhands);
//create mouse
instance_create_depth(x,y,-2000,o_crosshair);
//create android controls if device is detected
if(os_type==os_android) instance_create_depth(x,y,-2000,o_touch_controls);

battlemode=false; //if false = movement restricted and sprites are modified to be unarmed
lockmovement=false;

hinput=0;
vinput=0;

spd = 1; //default xy speed, must be changed at sprinting and diagonal reduction too
sprintspd=1.7;

//android sprint detector
touchpadsprint=false;

//android NOT register double tap as right click
device_mouse_dbclick_enable(false);

//android tap timer (for deciding if player is shooting or just aiming)
global.tappingtimer=0;

//sprinting variables
sprinting=false;
sprinttimer=50;
sprintoverheat=false;
shooting =false;
instup   = noone;
instdown = noone;
instleft = noone;
instright=noone;

shootcooldown=0;
maxshootcooldown=20;

color=c_white;

ammo=50;
life=50;
hurt=0;
fastshoot=0;
camzoomtimer=0;

bgalpha=0;
iconalpha=0;
blackalpha=0;
vignette=true;

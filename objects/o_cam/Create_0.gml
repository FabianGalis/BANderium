///set var
global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

//important variable for rotation and depth effect
global.z = 0;

//camera zoom+rotation lock
lockcam=true;

//set speed of camera xy movement(0.01 - 1.00)
spd = 0.05;

camrot_spd = 5; //speed camera rotates
camzoom_spd = 0.009; //speed camera zooms

//camera zoom limits (modified by powerup)
camzoom_limit_close = 0.7;
camzoom_limit_far = 1.3;

//variables for calibrating smoothness
zoom_level = 1;
rot_level=0;
interpolation_rate = 0.06;

//ANDROID TILT CONSTANTS for convenience
//a.k.a. min/max tilt distance until control is registered
min_tilt_y=-0.1;//left
max_tilt_y=0.1;//right
min_tilt_z=0.0;//up
max_tilt_z=0.9;//down
//reverse Y tilt for accessibility options, can be -1 or 1
reverse_tilt_y=1;

default_zoom_width = global.view_width;
default_zoom_height = global.view_height;

direct=true; // instant focus on player at startup

camera_set_view_pos(view_camera[0],o_player.x-global.view_width/2,o_player.y-global.view_height/2);
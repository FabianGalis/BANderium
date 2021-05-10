
if(!global.pause){
	
//z number locked between 0-360
if (global.z < 0)
{
	rot_level+=360;
	global.z = 360;	
}
if (global.z > 360)
{
	rot_level-=360;
	global.z = 0;	
}

//direct focus cam transitioning
if(direct=true)
{
	camera_set_view_pos(view_camera[0],o_player.x-global.view_width/2,o_player.y-global.view_height/2);
	direct=false;
}
else
{
//global cam angle
camera_set_view_angle(view_camera[0],global.z)

//change zoom
if(!lockcam)
{
	//windows specific, for android it is done via pinch in/out gesture
	if(os_type==os_windows) zoom_level = clamp(zoom_level + ((keyboard_check(global.key_up) - keyboard_check(global.key_down)) * camzoom_spd), camzoom_limit_close, camzoom_limit_far);
	//android specific via tilt Z
	else if(os_type==os_android)
	{
		//check if tilt is enough for it to register
		/*if(device_get_tilt_z()>max_tilt_z || device_get_tilt_z()<min_tilt_z)
		zoom_level = clamp(zoom_level - sign(device_get_tilt_z()) * camzoom_spd, camzoom_limit_close, camzoom_limit_far);*/
		zoom_level = camzoom_limit_far; //disabled for now
	}
}

else zoom_level=1.5;
//rotation
if(!lockcam)
{
	//windows specific
	if(os_type==os_windows) rot_level+=((mouse_wheel_down() - mouse_wheel_up())) * camrot_spd;
	//android specific via tilt Y
	else if(os_type==os_android)
	{
		//check if tilt is enough for it to register
		if(device_get_tilt_y()>max_tilt_y || device_get_tilt_y()<min_tilt_y)
		rot_level+=device_get_tilt_y() * camrot_spd * reverse_tilt_y;//can be flipped with reverse_tilt_y, it depends on preference
	}
}
else rot_level=0;
//get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//get new sizes by interpolating current and target zoomed size

global.z  = lerp(global.z, rot_level, interpolation_rate);

var new_w =  lerp(view_w, zoom_level * default_zoom_width, interpolation_rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, interpolation_rate);

//apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);

//re-aligning view
var shift_x = camera_get_view_x(view_camera[0]) - (new_w - view_w) * 0.5;
var shift_y = camera_get_view_y(view_camera[0]) - (new_h - view_h) * 0.5;

//Update the view position
camera_set_view_pos(view_camera[0],shift_x, shift_y);


var _x= clamp(o_player.x-new_w/2,0,room_width-new_w);
var _y= clamp(o_player.y-new_h/2,0,room_height-new_h);
	
var _cr_x = camera_get_view_x(view_camera[0]);
var _cr_y = camera_get_view_y(view_camera[0]);
	
camera_set_view_pos(view_camera[0],lerp(_cr_x,_x,spd),lerp(_cr_y,_y,spd));


}
}
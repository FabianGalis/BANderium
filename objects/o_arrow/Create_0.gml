//device specific point direction
if (os_type==os_android) direction=point_direction(o_player.x,o_player.y,device_mouse_x(1),device_mouse_y(1));
else direction=point_direction(o_player.x,o_player.y,mouse_x,mouse_y);
direction=direction+random_range(-4,4);
speed=12;
image_angle=direction;

deletetimer=300;
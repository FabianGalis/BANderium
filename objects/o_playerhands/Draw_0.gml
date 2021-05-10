if(o_player.shooting)
	{
		//the i variable is for animating hands or not, in case of shooting
		var i=0;
		//the OR condition is for android only
		if((device_mouse_check_button(global.mousedevice,global.key_shoot) || global.tappingtimer!=0) && o_player.ammo>0)i=-1;
		
		//device specific direction
		if(os_type=os_android) draw_sprite_ext(sprite,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,device_mouse_x(1),device_mouse_y(1)),-1,1);
		else draw_sprite_ext(sprite,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,mouse_x,mouse_y),-1,1);
	}

//platform specific coordinates
if(os_type==os_android)
{
	x=device_mouse_x(1);
	y=device_mouse_y(1);
}
else
{
	x=mouse_x;
	y=mouse_y;
}

//device specific
if (device_mouse_check_button(global.mousedevice,global.key_aim)) sprite_index=s_crosshair;
else sprite_index=s_pointer;

if ( instance_place(x,y,o_arrow_barrel)
or instance_place(x,y,o_arkhi)
or instance_place(x,y,o_airag)
or instance_place(x,y,o_healthup))
{
	//check if shooting
	if (!device_mouse_check_button(global.mousedevice,mb_right) and distance_to_object(o_player)<10)
	{
		sprite_index=s_hand;
		if (device_mouse_check_button_pressed(global.mousedevice,mb_left))
		{
			if instance_place(x,y,o_arrow_barrel)
			{
				if(!audio_is_playing(sfx_ammorefill))
				{
					audio_sound_pitch(sfx_ammorefill, random_range(1, 1.2));
					audio_play_sound(sfx_ammorefill,0,false);
				}	
				o_player.ammo=50;
			}
			else if (instance_place(x,y,o_arkhi))
			{
				if(!audio_is_playing(sfx_potiondrink))
				{
					audio_sound_pitch(sfx_potiondrink, random_range(1, 1.2));
					audio_play_sound(sfx_potiondrink,0,false);
				}	
				o_player.fastshoot=50;
				instance_destroy((instance_place(x,y,o_arkhi)));
			}
			else if (instance_place(x,y,o_airag))
			{
				if(!audio_is_playing(sfx_potiondrink))
				{
					audio_sound_pitch(sfx_potiondrink, random_range(1, 1.2));
					audio_play_sound(sfx_potiondrink,0,false);
				}
				o_player.camzoomtimer=100;
				instance_destroy((instance_place(x,y,o_airag)));
			}
			else if (instance_place(x,y,o_healthup))
			{
				if(!audio_is_playing(sfx_potiondrink))
				{
					audio_sound_pitch(sfx_potiondrink, random_range(1, 1.2));
					audio_play_sound(sfx_potiondrink,0,false);
				}	
				
				o_player.life+=20;
				//clamp health between 0 and 50
				o_player.life=clamp(o_player.life,0,50);
				instance_destroy((instance_place(x,y,o_healthup)));
			}
		}
		
	}
}
if ( instance_place(x,y,o_sign))
{
	if (!device_mouse_check_button(global.mousedevice,mb_right) and distance_to_object(o_player)<10)
	{
		sprite_index=s_inspect;
		//the rest of the interaction is in "o_sign"
	}
}
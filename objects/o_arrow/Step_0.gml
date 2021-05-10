event_inherited();

if(instance_place(x,y,o_block_16)) depth=instance_place(x,y,o_block_16).depth-2;

if (image_index>image_number - 1){image_speed=0;speed=0;deletetimer--;}
if (deletetimer<=0) instance_destroy();

if(instance_place(x,y,o_campfire) and image_index<image_number - 1)
{
	sprite_index=s_firearrow;
	if(!audio_is_playing(sfx_firearrow))
		{
			audio_sound_pitch(sfx_firearrow, random_range(0.8, 1.2));
			audio_play_sound(sfx_firearrow,0,false);
		}	
}
else if(instance_place(x,y,o_block_par) and !instance_place(x,y,o_arrow_barrel) and !instance_place(x,y,o_sign) and !instance_place(x,y,o_block_16)) instance_destroy();

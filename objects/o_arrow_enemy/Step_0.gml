event_inherited();

if(instance_place(x,y,o_block_16)) depth=instance_place(x,y,o_block_16).depth-2;

if (image_index>image_number - 1){image_speed=0;speed=0;deletetimer--;}
if (deletetimer<=0) instance_destroy();

if(instance_place(x,y,o_campfire))sprite_index=s_firearrow;
else if(instance_place(x,y,o_block_par) and !instance_place(x,y,o_arrow_barrel) and !instance_place(x,y,o_block_16)) instance_destroy();

if(instance_place(x,y,o_player) and (image_index<image_number - 1))
{
	o_player.hurt=5;
	instance_destroy();
}

//whizz sound
if(distance_to_object(o_player)<20 and (image_index<image_number - 1) and irandom(5)==0)
{
	switch irandom(2)
	{
		case 0:
		audio_sound_pitch(sfx_arrowfly1, random_range(1, 1.2));
		audio_play_sound(sfx_arrowfly1,0,false);
		break;
		case 1:
		audio_sound_pitch(sfx_arrowfly2, random_range(1, 1.2));
		audio_play_sound(sfx_arrowfly2,0,false);
		break;
		case 2:
		audio_sound_pitch(sfx_arrowfly3, random_range(1, 1.2));
		audio_play_sound(sfx_arrowfly3,0,false);
		break;
	}
	

}

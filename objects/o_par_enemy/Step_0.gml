event_inherited();

//regardless of state, check if any enemy is alerted via a shout or arrow
if(instance_place(x,y,o_shout))
{
	if (instance_place(x,y,o_arrow)) or instance_place(x,y,o_shout).image_index > instance_place(x,y,o_shout).image_number-1
	{
		state=2;
	}
}

//BEHAVIOUR DETERMINATION by state
//universal states: idle and alerting
if (state==0)
{
	//IDLE
	
	//check if player is in field of view or is being shot
	//if it is, then alert everyone in range
	if(point_distance(x,y,o_player.x,o_player.y)<150) or (instance_place(x,y,o_arrow)) state=1;
}
else if (state==1)
{
	//ALERT
	if(!instance_exists(o_shout))
	{
		if(!audio_is_playing(sfx_alert)) audio_play_sound(sfx_alert,0,false);
		instance_create_depth(x,y,-1000,o_shout);
	}
}

//check if any enemy type is hit with an arrow in general
if(instance_place(x,y,o_arrow))
{
	//if arrow is not already shot and on ground
	if(instance_place(x,y,o_arrow).image_index < instance_place(x,y,o_arrow).image_number-1)
	{
		//check to see if arrow is on fire for bonus damage
		if(instance_place(x,y,o_arrow).sprite_index==s_firearrow)life-=10;
		else life-=5;
		damagetimer=5;
		//break arrow after impact
		instance_destroy(instance_place(x,y,o_arrow));
	}
}

//color enemy red for a bit if taking damage and play hit sound
if (damagetimer>0)
{
	color=c_red;
	damagetimer--;
	if(!audio_is_playing(sfx_hit))
	{
		audio_sound_pitch(sfx_hit, random_range(0.8, 1.4));
		audio_play_sound(sfx_hit,0,false);
	}
}
else color=c_white;

//check if enemy can despawn
if(state==3 and image_index > image_number - 1)
{
	path_delete(enemypath);
	instance_destroy();
}

//change state BEFORE checking if animation is done (to fix a bug)
if(life<5)
{
	state=3;
	if(!playedfallsound)
	{
		audio_sound_pitch(sfx_bodyfall2, random_range(0.8, 1.2));
		audio_play_sound(sfx_bodyfall2,0,false);
		playedfallsound=true;
	}
	mask_index=s_blank;
}
//EVENT_INHERITED() IS AT THE BOTTOM OF THE PAUSE CHECK CONDITION
if (!global.pause)
{

image_speed=1;

//BEHAVIOUR DETERMINATION by state: specific ones for close combat enemies
if (state==0)
{
	sprite_index=s_idle;
}
else if (state==1)
{
	if (sprite_index=s_idle) image_index=0;
	sprite_index=s_alert;
}
else if (state==2)
{
	//ATTACKING
	
	//create closest path between player and enemy
	scr_define_path(x,y,o_player.x,o_player.y,enemypath);
	path_start(enemypath, 1, path_action_stop, false);
	
	//anti enemy stacking original method
	if instance_place(x,y,o_par_enemy) and point_distance(x,y,o_player.x,o_player.y)>point_distance(instance_place(x,y,o_par_enemy).x,instance_place(x,y,o_par_enemy).y,o_player.x,o_player.y)
	{
		image_index=0;
		path_speed=0;
	}
	else 
	{
		
	//sprite management
	
	//SPRITES configuration based on orientation
	
	//ckecking if attacking to not interrupt animation OR just continue animating if otherwise
	if ((sprite_index==s_attack_e or sprite_index==s_attack_s or sprite_index==s_attack_w or sprite_index==s_attack_n) and image_index>image_number - 1)
	or sprite_index==s_walk_e or sprite_index==s_walk_s or sprite_index==s_walk_w or sprite_index==s_walk_n or sprite_index==s_idle or sprite_index==s_alert
	{
	var orient=(direction+global.z)%360;
	if(orient>=315 || orient<45) sprite_index=s_walk_e;
	if(orient>=45 && orient<135) sprite_index=s_walk_n;
	if(orient>=135 && orient<225)sprite_index=s_walk_w;
	if(orient>=225 && orient<315)sprite_index=s_walk_s;
	}

	//simply move towards player on shortest path
	if(distance_to_object(o_player)>10)
	{
		path_speed=spd;
	}
	//slowing down and attacking at the same time
	else if(distance_to_object(o_player)>5)
	{
		path_speed=spd-0.5;
		if (attackcooldown<1)
		{
			if(o_player.life>0)o_player.hurt=25;
			if (sprite_index==s_walk_e || sprite_index==s_walk_s || sprite_index==s_walk_w || sprite_index==s_walk_n) image_index=0;
			//selective sprite transition to attack
			switch (sprite_index)
			{
				case s_walk_e: sprite_index=s_attack_e;break;
				case s_walk_s: sprite_index=s_attack_s;break;
				case s_walk_w: sprite_index=s_attack_w;break;
				case s_walk_n: sprite_index=s_attack_n;break;
			}
			attackcooldown=50;
		}
		attackcooldown-=1;
	}
	
	//just attacking while standing still
	else
	{
		path_speed=0;
		if (attackcooldown<1)
		{
			if(o_player.life>0)o_player.hurt=25;
			switch (sprite_index)
			{
				case s_walk_e: sprite_index=s_attack_e;break;
				case s_walk_s: sprite_index=s_attack_s;break;
				case s_walk_w: sprite_index=s_attack_w;break;
				case s_walk_n: sprite_index=s_attack_n;break;
			}
			attackcooldown=30;
		}
		attackcooldown-=1;
	}
	
	}
}
else if(state==3)
{
	//DYING
	if(sprite_index!=s_dying_e and sprite_index!=s_dying_w)image_index=0;
	switch (sprite_index)
			{
				case s_idle:
				case s_alert:
				case s_walk_e:
				case s_attack_e:
				case s_walk_n:
				case s_attack_n: sprite_index=s_dying_e;break;
				case s_walk_s:
				case s_attack_s:
				case s_walk_w:
				case s_attack_w: sprite_index=s_dying_w;break;
			}
	path_speed=0;
}


//inherited method called here to delete the specific path BEFORE updating it
//or to delete the arrows BEFORE checking if collision happens
event_inherited();
}

else
{
	path_speed=0;
	image_speed=0;
}
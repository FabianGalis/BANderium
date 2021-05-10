//EVENT_INHERITED() IS AT THE BOTTOM OF THE PAUSE CHECK CONDITION
if (!global.pause)
{

image_speed=1;
//SPRITES configuration

	
	
//BEHAVIOUR DETERMINATION by state: specific ones for archers
if (state==0)
{
	//IDLE
	sprite_index=s_ranged_idle;
}
else if (state==1)
{
	//ALERT
	if (sprite_index=s_ranged_idle) image_index=0;
	sprite_index=s_ranged_alert;
	
}
else if (state==2)
{
	//ATTACKING
	
	//SPRITES configuration based on orientation
	var shootdir=(point_direction(x,y,o_player.x,o_player.y)+global.z)%360;
	
	if (shootdir>=315 || shootdir<30) sprite_index=s_ranged_body_e;
	if(shootdir>=30 && shootdir<135)sprite_index=s_ranged_body_n;
	if(shootdir>=135 && shootdir<225)sprite_index=s_ranged_body_w;
	if(shootdir>=225 && shootdir<315)sprite_index=s_ranged_body_s;
	
	//create closest path between player and enemy
	scr_define_path(x,y,o_player.x,o_player.y,enemypath);
	path_start(enemypath, 1, path_action_stop, false);
	
	//anti enemy stacking original method
	if instance_place(x,y,o_par_enemy) and point_distance(x,y,o_player.x,o_player.y)>point_distance(instance_place(x,y,o_par_enemy).x,instance_place(x,y,o_par_enemy).y,o_player.x,o_player.y) path_speed=0;
	else
	{
		//move towards player
		if(distance_to_object(o_player)>200)
		{
			path_speed=spd;
		}
		//moving and shooting
		else if(distance_to_object(o_player)>150)
		{
			path_speed=spd;
			if(attackcooldown<1)
			{
				instance_create_depth(x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),0,o_arrow_enemy);
				attackcooldown=30;
			}
			attackcooldown-=1;
		}
		//attacking while slowly moving
		else
		{
			path_speed=spd-0.3;
			if(attackcooldown<1)
			{
				instance_create_depth(x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),0,o_arrow_enemy);
				attackcooldown=40;
			}
			attackcooldown-=1;
		}
	}
}
else if(state==3)
{
	//DYING
	if(sprite_index!=s_ranged_dying)image_index=0;
	sprite_index=s_ranged_dying;
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
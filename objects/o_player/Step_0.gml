//par
event_inherited();

//check if user wants to pause the game
if(keyboard_check(vk_escape) or keyboard_check(vk_backspace))global.pause=true;

if(!global.pause){
	
//walking + sprinting + idle sprite drawing 
image_speed=1;
if(lockmovement)
{
	hinput=0;
	vinput=0;
}
else if(os_type==os_windows)
{
	//WINDOWS movement (android movement is in the created object o_touch_cotrols at the dragging event)
	hinput=keyboard_check(global.key_move_right)-keyboard_check(global.key_move_left);
	vinput=keyboard_check(global.key_closer)-keyboard_check(global.key_away);
}

if (shooting)
{
	//device specific direction
	if(os_type==os_android) var shootdir=(point_direction(x,y,device_mouse_x(1),device_mouse_y(1))+global.z)%360;
	else var shootdir=(point_direction(x,y,mouse_x,mouse_y)+global.z)%360;
	
	if (shootdir>=315 || shootdir<30) sprite_index=s_player_shoot_e_body;
	if(shootdir>=30 && shootdir<135)sprite_index=s_player_shoot_n_body;
	if(shootdir>=135 && shootdir<225)sprite_index=s_player_shoot_w_body;
	if(shootdir>=225 && shootdir<315)sprite_index=s_player_shoot_s_body;
	
	if !( hinput!=0 or vinput!=0 ) image_index=0;
}
else if (sprinting)
{
	if ( hinput!=0 or vinput!=0 ){
		switch(point_direction(0,0,hinput,vinput)){
				case 0:   sprite_index=s_player_run_e;break;
				case 45:  sprite_index=s_player_run_e;break;
				case 90:  sprite_index=s_player_run_n;break;
				case 135: sprite_index=s_player_run_w;break;
				case 180: sprite_index=s_player_run_w;break;
				case 225: sprite_index=s_player_run_w;break;
				case 270: sprite_index=s_player_run_s;break;
				case 315: sprite_index=s_player_run_e;break;
			}
	}
	else
	{
		if (sprite_index==s_player_run_e) sprite_index=s_player_walk_e;
		if (sprite_index==s_player_run_n) sprite_index=s_player_walk_n;
		if (sprite_index==s_player_run_w) sprite_index=s_player_walk_w;
		if (sprite_index==s_player_run_s) sprite_index=s_player_walk_s;
		image_index=0;
	}
}
else
{
	if (sprite_index==s_player_shoot_e_body) sprite_index=s_player_walk_e;
	if (sprite_index==s_player_shoot_n_body) sprite_index=s_player_walk_n;
	if (sprite_index==s_player_shoot_w_body) sprite_index=s_player_walk_w;
	if (sprite_index==s_player_shoot_s_body) sprite_index=s_player_walk_s;
	if ( hinput!=0 or vinput!=0 )
	{
		
		if(battlemode) switch(point_direction(0,0,hinput,vinput)){
				case 0:   sprite_index=s_player_walk_e;break;
				case 45:  sprite_index=s_player_walk_e;break;
				case 90:  sprite_index=s_player_walk_n;break;
				case 135: sprite_index=s_player_walk_w;break;
				case 180: sprite_index=s_player_walk_w;break;
				case 225: sprite_index=s_player_walk_w;break;
				case 270: sprite_index=s_player_walk_s;break;
				case 315: sprite_index=s_player_walk_e;break;
			}
		else switch(point_direction(0,0,hinput,vinput)){
				case 0:   sprite_index=s_player_walk_e_unarmed;break;
				case 45:  sprite_index=s_player_walk_e_unarmed;break;
				case 90:  sprite_index=s_player_walk_n_unarmed;break;
				case 135: sprite_index=s_player_walk_w_unarmed;break;
				case 180: sprite_index=s_player_walk_w_unarmed;break;
				case 225: sprite_index=s_player_walk_w_unarmed;break;
				case 270: sprite_index=s_player_walk_s_unarmed;break;
				case 315: sprite_index=s_player_walk_e_unarmed;break;
			}
	}
	else
	{
		image_index=0;
	}
}

//MOVEMENT (+sprite updating when collision happens)

//diagonal speed reduction
diag = hinput != 0 && vinput != 0;

//forbid out of bounds
x=clamp(x,0,room_width);
y=clamp(y,0,room_height);

if(!sprinting) spd=1;
else spd=sprintspd;
if (diag) spd *= 0.707;//if moving diagonally multiply the move speed by the "magical constant"


//sprint sounds BEFORE collision check to fix a bug

if(sprinting) { if(!audio_is_playing(sfx_run))audio_play_sound(sfx_run,0,true);}
else audio_stop_sound(sfx_run);

if(vinput!=0)
{
	///move up or down
	//update instance status
	instup = noone;
	instdown = noone;
	//instance in path
	instup = (instance_place(x+lengthdir_x(spd,-global.z-270),y+lengthdir_y(spd,-global.z-270),o_block_par));
	instdown = (instance_place(x+lengthdir_x(spd,-global.z-90),y+lengthdir_y(spd,-global.z-90),o_block_par));
	if(vinput==-1)
	{
		//move up
		if (!instup)
		{
			//move up according to z
			x += lengthdir_x(spd,-global.z-270);
			y += lengthdir_y(spd,-global.z-270);
		}
		else 
		{
			audio_stop_sound(sfx_run);
			if(sprinting)sprinttimer+=0.2;
			
			if (sprite_index==s_player_run_e) sprite_index=s_player_walk_e;
			if (sprite_index==s_player_run_n) sprite_index=s_player_walk_n;
			if (sprite_index==s_player_run_w) sprite_index=s_player_walk_w;
			if (sprite_index==s_player_run_s) sprite_index=s_player_walk_s;
			
			if(!keyboard_check(global.key_move_right) and !keyboard_check(global.key_move_left))
			or (instleft and (sprite_index=s_player_walk_w or shooting))
			or (instright and (sprite_index=s_player_walk_e or shooting))
			image_index=0;
		}
	}
	else if(vinput==1)
	{
		//move down
		if (!instdown)
		{
			//move down according to z
			x += lengthdir_x(spd,-global.z-90);
			y += lengthdir_y(spd,-global.z-90);
		}
		else
		{
			audio_stop_sound(sfx_run);
			if(sprinting)sprinttimer+=0.2;
			
			if (sprite_index==s_player_run_e) sprite_index=s_player_walk_e;
			if (sprite_index==s_player_run_n) sprite_index=s_player_walk_n;
			if (sprite_index==s_player_run_w) sprite_index=s_player_walk_w;
			if (sprite_index==s_player_run_s) sprite_index=s_player_walk_s;
			
			if(!keyboard_check(global.key_move_right) and !keyboard_check(global.key_move_left))
			or (instleft and (sprite_index=s_player_walk_w or shooting))
			or (instright and (sprite_index=s_player_walk_e or shooting))
			image_index=0;
		}
	}
}

if(hinput!=0)
{
	///move left or right
	//update instance status
	instleft = noone;
	instright = noone;
	//instance in path
	instleft = (instance_place(x+lengthdir_x(spd,-global.z-180),y+lengthdir_y(spd,-global.z-180),o_block_par))
	instright = (instance_place(x+lengthdir_x(spd,-global.z),y+lengthdir_y(spd,-global.z),o_block_par))
	if(hinput==-1)
	{
		if (!instleft) 
		{
			//move left according to z
			x += lengthdir_x(spd,-global.z-180);
			y += lengthdir_y(spd,-global.z-180);
		}
		else
		{
			audio_stop_sound(sfx_run);
			if(sprinting)sprinttimer+=0.2;
			
			if (sprite_index==s_player_run_e) sprite_index=s_player_walk_e;
			if (sprite_index==s_player_run_n) sprite_index=s_player_walk_n;
			if (sprite_index==s_player_run_w) sprite_index=s_player_walk_w;
			if (sprite_index==s_player_run_s) sprite_index=s_player_walk_s;
			
			if(!keyboard_check(global.key_closer) and !keyboard_check(global.key_away)) image_index=0;
		}
	}
	else if(hinput==1)
	{
		if (!instright) 
		{
			//move right according to z
			x += lengthdir_x(spd,-global.z);
			y += lengthdir_y(spd,-global.z);

		}
		else
		{
			audio_stop_sound(sfx_run);
			if(sprinting)sprinttimer+=0.2;
			
			if (sprite_index==s_player_run_e) sprite_index=s_player_walk_e;
			if (sprite_index==s_player_run_n) sprite_index=s_player_walk_n;
			if (sprite_index==s_player_run_w) sprite_index=s_player_walk_w;
			if (sprite_index==s_player_run_s) sprite_index=s_player_walk_s;
			
			if(!keyboard_check(global.key_closer) and !keyboard_check(global.key_away)) image_index=0;
		}
	}
}

//SPRINTING

if(sprinttimer=50)sprintoverheat=false;

if((keyboard_check(global.key_sprint) || touchpadsprint) && battlemode && ( hinput!=0 || vinput!=0 ) && !shooting && sprinttimer>0 && !sprintoverheat)
{
	sprinting=true;
	spd=sprintspd;
	sprinttimer-=0.2;
}
else
{
	sprinting=false;
	spd=1;
	if(sprinttimer=0) sprintoverheat=true;
	if(sprinttimer<50)sprinttimer+=0.2;
}

//AIMING & SHOOTING
if (device_mouse_check_button(global.mousedevice,global.key_aim) && battlemode  && !lockmovement)
{
	shooting=true;
	
	sprinting=false;
	
	//the 2nd OR condition is for android only
	if (device_mouse_check_button(global.mousedevice,global.key_shoot) || global.tappingtimer!=0 ) && (shootcooldown<1) && (ammo>0)
	{
		//SHOOTSOUNDS
		if(!audio_is_playing(sfx_bowshoot1))
		{
			audio_sound_pitch(sfx_bowshoot1, random_range(1, 1.2));
			audio_play_sound(sfx_bowshoot1,0,false);
		}
		instance_create_depth(x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),0,o_arrow);
		if (fastshoot==0) ammo-=1;
		shootcooldown=maxshootcooldown;
	}
	shootcooldown-=1;
}
else
{
	if(global.tappingtimer!=0)global.tappingtimer-=1;
	else shooting=false;
}


//TRANSITIONING BETWEEN ROOMS
var trans=instance_place(x,y,o_transition);
if(trans!=noone)
{
		if(blackalpha<1)blackalpha+=0.01;//0.01 for final, 0.1 for debug
		else
		{
			room_goto(trans.targetroom);
			x=trans.targetx;
			y=trans.targety;
			o_cam.direct=true;
		}
}
else if (blackalpha>0) blackalpha-=0.01;//0.01 for final, 0.1 for debug

//TAKING DAMAGE
if (hurt>0)
{
	if(hurt=5)
	{
		if(!audio_is_playing(sfx_playerhit))
		{
			audio_sound_pitch(sfx_playerhit, random_range(1, 1.2));
			audio_play_sound(sfx_playerhit,0,false);
		}	
		color=c_red;
		life-=5;
	}
	hurt--;
}
else color=c_white;

//TEMP POWERS
//arkhi - fast shooting
if(fastshoot>0)
{
	maxshootcooldown=10;
	fastshoot-=0.1;
}
else maxshootcooldown=20;

//airag - increase visual field
if(camzoomtimer>0)
{
	o_cam.camzoom_limit_far=2;
	camzoomtimer-=0.1;
}
else o_cam.camzoom_limit_far=1.3;

//DYING
if(life==0)
{
	room_goto(rm_intro);
	ammo=50;
	life=50;
	hurt=0;
	fastshoot=0;
	camzoomtimer=0;
	battlemode=false;
	o_cam.lockcam=true;
	x=160;
	y=90;
	o_cam.direct=true;
}

}
else
image_speed=0;
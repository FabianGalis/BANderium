
x=o_player.x;
y=o_player.y;

	if(o_player.sprite_index==s_player_shoot_e_body)
	{
		sprite=s_player_shoot_e_bow;
		depth=o_player.depth-1;
	}
	if(o_player.sprite_index==s_player_shoot_w_body)
	{
		sprite=s_player_shoot_w_bow;
		depth=o_player.depth+1;
	}
	if( o_player.sprite_index==s_player_shoot_n_body)
	{
		sprite=s_player_shoot_n_bow;
		depth=o_player.depth+1;
	}
	if( o_player.sprite_index==s_player_shoot_s_body)
	{
		sprite=s_player_shoot_s_bow;
		depth=o_player.depth-1;
	}
	if(o_player.fastshoot==0) image_speed=1;
	else image_speed=2;

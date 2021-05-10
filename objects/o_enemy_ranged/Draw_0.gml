//enemy hands drawing

var i;
if(distance_to_object(o_player)>200)i=0;
else i=-1;
if(sprite_index==s_ranged_idle or sprite_index==s_ranged_alert or sprite_index==s_ranged_dying)event_inherited();
if(sprite_index==s_ranged_body_e)
{
	event_inherited();
	draw_sprite_ext(s_player_shoot_e_bow,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,o_player.x,o_player.y),-1,1);
}
if(sprite_index==s_ranged_body_w)
{
	draw_sprite_ext(s_player_shoot_w_bow,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,o_player.x,o_player.y),-1,1);
	event_inherited();
}
if(sprite_index==s_ranged_body_n)
{
	draw_sprite_ext(s_player_shoot_n_bow,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,o_player.x,o_player.y),-1,1);
	event_inherited();
}
if(sprite_index==s_ranged_body_s)
{
	event_inherited();
	draw_sprite_ext(s_player_shoot_s_bow,i,x+lengthdir_x(11,-global.z-270),y+lengthdir_y(11,-global.z-270),1,1,point_direction(x,y,o_player.x,o_player.y),-1,1);
}

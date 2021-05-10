function scr_draw_shadow() {
	//draw shadow according to z height and zfloor 
	draw_sprite_ext(s_player_shadow,image_index,x+lengthdir_x(0,-global.z-270),y+lengthdir_y(0,-global.z-270),1,1,-global.z,c_white,1);


}

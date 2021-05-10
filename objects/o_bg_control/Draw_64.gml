if (blackalpha>1)
{
	draw_rectangle_color(0,0,global.view_width,global.view_height,c_black,c_black,c_black,c_black,false);
	blackalpha-=0.01;
}
else if(blackalpha>0)
{
	draw_set_alpha(blackalpha);
	draw_rectangle_color(0,0,global.view_width,global.view_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
	blackalpha-=0.005;
}
if !(o_player.x<75 and o_player.y<260)
{
	if(titlealpha>0) titlealpha-=0.05;
}
else if(titlealpha<1)titlealpha+=0.05;

image_alpha=titlealpha;//draw_sprite_ext(s_title,-1,global.view_width/5,5,0.5,0.5,0,c_white,titlealpha);
if (image_index>image_number - 1)image_speed=0;

draw_self();
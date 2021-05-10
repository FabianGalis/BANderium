draw_set_font(fancy);

//draw vignette
if(vignette)draw_sprite(s_vignette,0,0,0);

if(!global.pause and battlemode)
{
	
//draw the 3 bars: ammo, health, effect duration
if(!sprintoverheat) draw_rectangle_color(4,32,sprinttimer+4,35,c_purple,c_purple,c_purple,c_purple,false);
else draw_rectangle_color(4,32,sprinttimer+4,35,c_purple,c_red,c_red,c_purple,false);
draw_rectangle_color(4,36,life+4,50,c_maroon,c_red,c_red,c_maroon,false);
draw_rectangle_color(4,52,fastshoot+4,55,c_blue,c_blue,c_blue,c_blue,false);

//draw cam filter in case of fast shooting
if(bgalpha!=0)draw_sprite_ext(s_power_blue_filter,0,0,0,1,1,0,-1,bgalpha);

//draw main GUI over the bars
draw_sprite(s_main_GUI,0,0,0);

//draw ammo counter or else, add screen effects
if(fastshoot==0)
{
	draw_text(30,5,ammo);
	if(bgalpha!=0)bgalpha-=0.05;
}
else
{
	if(bgalpha!=1) bgalpha+=0.05;	
	//draw_text_color(30,5,"~",c_navy,c_navy,c_navy,c_navy,1);
}

//draw visual field increase icon
if(iconalpha!=0)draw_sprite_ext(s_eye,0,0,57,1,1,0,-1,iconalpha);

if(camzoomtimer>0 and iconalpha!=1)
{
	if(camzoomtimer<25) iconalpha=(sin(camzoomtimer)+1)/2;
	else iconalpha+=0.05;
}
else if(iconalpha!=0)iconalpha-=0.05;
}

//draw screen fade
if(blackalpha>0)
{
	draw_set_alpha(blackalpha);
	draw_rectangle_color(0,0,global.view_width,global.view_height,c_black,c_black,c_black,c_black,false);
	draw_set_alpha(1);
}

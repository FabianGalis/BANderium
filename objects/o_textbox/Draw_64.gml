var gwidth = global.view_width, gheight = global.view_height;

draw_set_font(fancy);

draw_sprite(s_textbox,0,gwidth/2,gheight-boxHeight);

//DRAW NAME
//draw_set_halign(fa_center);
//draw_text_color(gwidth/2,gheight-14,name,c_gray,c_gray,c_gray,c_gray,1);

draw_set_halign(fa_left);

//DRAW TEXT with fragments
if(type_timer==0)
{
	if(charCount<=string_length(text[| page])) charCount+=0.3;
	textPart=string_copy(string_replace_all(text[| page], "_", ""),1,charCount);
}
	draw_text_ext_color((gwidth-boxWidth)/2+xBuffer,gheight-boxHeight+2,textPart,stringHeight-2,boxWidth - 2*xBuffer,textcolor,textcolor,textcolor,textcolor,1);

//else
if(string_char_at(text[| page], charCount)=="_" )
{
	if(type_timer==0)type_timer=10;
	type_timer-=1;
}

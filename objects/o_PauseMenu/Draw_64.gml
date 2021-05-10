if(!global.pause)exit;

draw_set_font(fancy);

var gwidth = global.view_width, gheight = global.view_height;

var ds_grid = menu_pages[page],ds_height = ds_grid_height(ds_grid);
var y_buffer = 25, x_buffer=16;
var start_y = (gheight/2) - ((((ds_height-1)/2) * y_buffer)), start_x=gwidth/2;


//pause menu bg
draw_sprite_pos(s_pausebg,0,0,0,gwidth,0,gwidth,gheight,0,gheight,1);
var c;

//temporary title
//if(page==0)draw_sprite_ext(s_title,0,gwidth/2,5,0.15,0.15,0,c_white,1);

//left side elements
draw_set_valign(fa_middle);
draw_set_halign(fa_right);

var ltx = start_x - x_buffer, lty; //left text x,y position
var xo;//x offset
var yy = 0; repeat(ds_height)
{
	lty = start_y + (yy*y_buffer);
	c = c_dkgray;
	xo=0;
	
	if(yy==menu_option[page])
	{
		c=c_white;
		xo=-(x_buffer/2);
		draw_sprite(s_cursor,0,ltx,lty);
	}
	draw_text_color(ltx+xo,lty,ds_grid[# 0,yy],c,c,c,c,1);
	
	yy++;
}
//dividing line
draw_line(start_x,start_y-y_buffer, start_x,lty+y_buffer);

//right side elements
draw_set_halign(fa_left);

var rtx = start_x + x_buffer, rty; //right text x,y position

yy=0; repeat (ds_height)
{
	rty = start_y + (yy*y_buffer);
	switch(ds_grid[# 1, yy])
	{
		case menu_element_type.shift: 
			var current_val = ds_grid[# 3, yy];
			var current_val_words = ds_grid[# 4, yy];
			var left_shift = "<< ";
			var right_shift = " >>";
			
			c = c_dkgray;
			
			if(current_val == 0)left_shift="";
			if(current_val == array_length_1d(ds_grid[# 4,yy])-1)right_shift="";
			
			if(inputting and yy== menu_option[page]) c = c_white;
			
			draw_text_color(rtx,rty, left_shift+current_val_words[current_val]+right_shift, c, c, c, c, 1);
			break;
		case menu_element_type.slider:
			c = c_dkgray;
			var len=64;
			var current_val  = ds_grid[# 3, yy];
			//var current_array= ds_grid[# 4, yy];
			draw_line_width(rtx,rty,rtx+len,rty,2);
			
			if(inputting and yy== menu_option[page]) c = c_white;
			
			draw_circle_color(rtx+ (current_val*len),rty,4,c,c,false);
			draw_text_color(rtx+(len*1.2),rty,string(floor(current_val*100))+"%",c,c,c,c,1);
			
			
			break;
		case menu_element_type.toggle:
			var c1,c2;
			var current_val = ds_grid [# 3, yy];
				c=c_gray;
				if(inputting and yy== menu_option[page]) c = c_white;
				if(current_val == 0){c1 = c;c2 = c_dkgray;}
				else				{c1 = c_dkgray;c2 = c;}
			if(page==3)
			{
				draw_text_color(rtx,rty,"Off", c1,c1,c1,c1,1);
				draw_text_color(rtx + 50,rty,"On",c2,c2,c2,c2,1);
			}
			else if(page==4 or page==5 or page==6)
			{
				
				draw_text_color(rtx,rty,"1", c1,c1,c1,c1,1);
				draw_text_color(rtx + 25,rty,"2",c2,c2,c2,c2,1);
			}
			
			break;
		case menu_element_type.input:
			var current_val = ds_grid[# 3,yy];
			var string_val;
			switch(current_val)
			{
				case vk_up:    string_val = "Up"; break;
				case vk_left:  string_val = "Left"; break;
				case vk_right: string_val = "Right"; break;
				case vk_down:  string_val = "Down"; break;
				case vk_space: string_val = "Space"; break;
				case vk_shift: string_val = "Shift"; break;
				case vk_control: string_val = "Ctrl"; break;
				case mb_left: string_val = "Mouse"; break;
				default:       string_val = chr(current_val); break;
			}
			c=c_dkgray;
			
			if(inputting and yy== menu_option[page]) c = c_white;
			
			draw_text_color(rtx,rty,string_val,c,c,c,c,1);
			break;
		case menu_element_type.page_transfer:
			c=c_gray;
			if(page==4 and ds_grid[# 0,yy]=="BACK")draw_text_color(rtx+17,rty,"(1)",c,c,c,c,1);
			else if(page==5 and ds_grid[# 0,yy]=="BACK")draw_text_color(rtx+17,rty,"(2)",c,c,c,c,1);
			//else if(page==6 and ds_grid[# 0,yy]=="BACK")draw_text_color(rtx+17,rty,"(3)",c,c,c,c,1);
			break;
	}
	yy++;
}

draw_set_valign(fa_top);

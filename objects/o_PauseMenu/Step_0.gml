if(!global.pause)exit;

//windows menu input, android is in o_touch_controls
if(os_type==os_windows)
{
	input_up_p    = keyboard_check_pressed(global.key_away);
	input_down_p  = keyboard_check_pressed(global.key_closer);
}

//platform specific enter key
if(os_type==os_android) input_enter_p = tapping;
else input_enter_p = keyboard_check_pressed(global.key_enter);

var ds_grid = menu_pages[page],ds_height = ds_grid_height(ds_grid);

if(inputting)
{
	switch(ds_grid[# 1, menu_option[page]]) 
	{
		case menu_element_type.shift:
			if(os_type==os_windows) hinput = keyboard_check_pressed(global.key_move_right) - keyboard_check_pressed(global.key_move_left);
			if(hinput!=0)
			{
				//audio_play_sound()
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,array_length_1d(ds_grid[# 4, menu_option[page]])-1);
			}
			break;
		case menu_element_type.slider:
			/*
			switch(menu_option[page])
			{
				case 0: if(!audio_is_playing(mas_test)) audio_play_sound(mas_test, 1,false); break;
				case 1: if(!audio_is_playing(sfx_test)) audio_play_sound(sfx_test, 1,false); break;
				case 2: if(!audio_is_playing(mus_test)) audio_play_sound(mus_test, 1,false); break;
			}
			*/
			if(os_type==os_windows) hinput = keyboard_check(global.key_move_right) - keyboard_check(global.key_move_left);
			if(hinput!=0)
			{
				ds_grid[# 3, menu_option[page]] += hinput*0.1;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,1);
				script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]])
			}
			break;
		case menu_element_type.toggle:
			if(os_type==os_windows) hinput = keyboard_check_pressed(global.key_move_right) - keyboard_check_pressed(global.key_move_left);
			if(hinput!=0)
			{
				//audio_play_sound()
				ds_grid[# 3, menu_option[page]] += hinput;
				ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,1);
				//else if(page==4 or page==5 or page==6) ds_grid[# 3, menu_option[page]] = clamp(ds_grid[# 3, menu_option[page]],0,2);
			}
			break;
			
		case menu_element_type.input:
			/*var kk = keyboard_lastkey;
			if (kk!= global.key_enter)
			{
				//if(kk != ds_grid[# 3,menu_option[page]]) audio_play_sound()
				ds_grid[# 3,menu_option[page]] = kk;
				variable_global_set(ds_grid[# 2,menu_option[page]], kk);
			}*/
			break;
	}
}
else
{
	var ochange = input_down_p - input_up_p; // option change
	if (ochange != 0)
	{
		menu_option[page] += ochange;
		if(menu_option[page] > ds_height-1) menu_option[page]=0;
		if(menu_option[page] < 0) menu_option[page]=ds_height-1;
		//audio_play_sound(snd_select,5,false);
	}
}

if(input_enter_p)
{
	switch(ds_grid[# 1, menu_option[page]]) 
	{
		case menu_element_type.script_runner: script_execute(ds_grid[# 2, menu_option[page]]);break;
		case menu_element_type.page_transfer: page = ds_grid[# 2, menu_option[page]];break;
		case menu_element_type.shift:
		case menu_element_type.slider:
		case menu_element_type.toggle: if (inputting) script_execute(ds_grid[# 2, menu_option[page]],ds_grid[# 3, menu_option[page]]);
		case menu_element_type.input:
			inputting = !inputting;
			break;
	}
	
	//audio_play_sound(snd_pickup,5,false);
	
}

tapping=false;
input_up_p=0;
input_down_p=0;
hinput=0;
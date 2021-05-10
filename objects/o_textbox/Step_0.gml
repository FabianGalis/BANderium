if((keyboard_check_pressed(global.key_enter) or tapping) and !global.pause)
{
	if(charCount < string_length(text[| page])){charCount=string_length(text[| page]);type_timer=0;}
	
	else if(page+1 < ds_list_size(text))
	{
		page+=1;
		charCount=0;
	}
	else
	{
		//o_player.lockmovement=false;
		instance_destroy();
		creator.alarm[1]=1;
	}
}

tapping=false;
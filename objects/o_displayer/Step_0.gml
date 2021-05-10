if(sprite_index==s_introanimationEN and (image_index>image_number - 1 or keyboard_check_released(vk_space) or mouse_check_button_released(mb_left)))room_goto(rm_main);
if(sprite_index==s_death)
{
	if(image_index>image_number - 1)
	{
		image_speed=0;
		if((keyboard_check_released(vk_space) or mouse_check_button_released(mb_left)) and !global.pause ) room_goto(rm_main);
	}
}
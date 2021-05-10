event_inherited();

if(distance_to_object(o_player)<10 and !global.pause){
	if(o_crosshair.sprite_index=s_inspect and device_mouse_check_button_pressed(global.mousedevice,mb_left))
	{
	//o_player.lockmovement=true;
	if(currenttextbox==noone)
	{
		currenttextbox = instance_create_layer(x,y,"Text",o_textbox);
		currenttextbox.text=currenttext;
		currenttextbox.creator = self;
		currenttextbox.name = currentname;
		currenttextbox.textcolor=currenttextcolor;
	}
	}
}
else
{
	if(currenttextbox!=noone)
	{
		//o_player.lockmovement=false;
		instance_destroy(currenttextbox);
		currenttextbox=noone;
	}
}
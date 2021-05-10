if(!global.pause && event_data[? "touch"]==0)
{

guiposX = event_data[? "guiposX"];
guiposY = event_data[? "guiposY"];

var jdistance = min(27, point_distance(guistartposX,guistartposY,guiposX,guiposY));
var jdirection = point_direction(guistartposX,guistartposY,guiposX,guiposY);

guiposX = guistartposX + lengthdir_x(jdistance, jdirection);
guiposY = guistartposY + lengthdir_y(jdistance, jdirection);

if(jdistance>8)
{
	//MOVEMENT for o_player
	
	if(jdistance>=27)o_player.touchpadsprint=true;
	else o_player.touchpadsprint=false;
	
	//trigonometrical circle number converting magic! :>
	if (jdirection>=338 || jdirection<22)
	{
		o_player.hinput=1;
		o_player.vinput=0;
	}
	if (jdirection>=22 && jdirection<67)
	{
		o_player.hinput=1;
		o_player.vinput=-1;
	}
	if(jdirection>=67 && jdirection<112)
	{
		o_player.hinput=0;
		o_player.vinput=-1;
	}
	if (jdirection>=112 && jdirection<157)
	{
		o_player.hinput=-1;
		o_player.vinput=-1;
	}
	if(jdirection>=157 && jdirection<202)
	{
		o_player.hinput=-1;
		o_player.vinput=0;
	}
	if (jdirection>=202 && jdirection<247)
	{
		o_player.hinput=-1;
		o_player.vinput=1;
	}
	if(jdirection>=247 && jdirection<292)
	{
		o_player.hinput=0;
		o_player.vinput=1;
	}
	if (jdirection>=292 && jdirection<338)
	{
		o_player.hinput=1;
		o_player.vinput=1;
	}
	//show_debug_message(string(jdirection)+": "+string(o_player.hinput)+" "+string(o_player.vinput));
}
else
{
	o_player.hinput=0;
	o_player.vinput=0;
	o_player.touchpadsprint=false;
}
active = true;

}
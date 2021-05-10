function toggle_vignette(argument0) {
	switch(argument0)
	{
		case 0: o_player.vignette=false;break;
		case 1: o_player.vignette=true;break;
	}
	ini_open("lvlsave.ini");
	ini_write_string("settings","vignette",string(argument0));
	ini_close();


}

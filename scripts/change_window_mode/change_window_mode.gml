///@description change_window_mode
///@arg value
function change_window_mode(argument0) {
	switch(argument0)
	{
		case 0: window_set_fullscreen(false);break;
		case 1: window_set_fullscreen(true);break;
	}
	ini_open("lvlsave.ini");
	ini_write_string("settings","fullscreen",string(argument0));
	ini_close();


}

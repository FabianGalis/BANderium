///@description change_resolution
///@arg value
function change_resolution(argument0) {

	//"320 x 180", "640 x 360", "640 x 480", "1280 x 720","1920 x 1080"

	switch(argument0)
	{
		case 0: window_set_size(320,180);break;
		case 1: window_set_size(640, 360);break;
		case 2: window_set_size(1280, 720);break;
		case 3: window_set_size(1920, 1080);break;
	}
	ini_open("lvlsave.ini");
	ini_write_string("settings","resolution",string(argument0));
	ini_close();


}

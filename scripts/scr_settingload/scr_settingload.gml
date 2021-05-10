function scr_settingload() {
	ini_open("lvlsave.ini");

	if(ini_section_exists("settings"))
	{
		switch(real(ini_read_string("settings","resolution","2")))
		{
			case 0: window_set_size(320,180);break;
			case 1: window_set_size(640, 360);break;
			case 2: window_set_size(1280, 720);break;
			case 3: window_set_size(1920, 1080);break;
		}
		switch(real(ini_read_string("settings","fullscreen","0")))
		{
			case 0: window_set_fullscreen(false);break;
			case 1: window_set_fullscreen(true);break;
		}
	}

	ini_close();


}

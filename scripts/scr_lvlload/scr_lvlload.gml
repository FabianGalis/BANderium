function scr_lvlload() {
	ini_open("lvlsave.ini");
	if(ini_section_exists("save1"))progress=real(ini_read_string("save1","progress","1"));
	else progress=1;
	ini_close();

	return progress;


}

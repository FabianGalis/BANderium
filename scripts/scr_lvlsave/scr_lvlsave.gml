function scr_lvlsave(argument0) {
	newprogress=argument0;

	ini_open("lvlsave.ini");

	if (ini_section_exists("save1")) oldprogress=real(ini_read_string("save1","progress","0"));
	else oldprogress=0;
	if (newprogress>oldprogress) ini_write_string("save1","progress",string(newprogress));

	ini_close();

}

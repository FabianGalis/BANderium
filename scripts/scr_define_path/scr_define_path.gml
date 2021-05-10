function scr_define_path(argument0, argument1, argument2, argument3, argument4) {


	var sx= argument0;
	var sy = argument1;
	var fx= argument2;
	var fy = argument3;
	path=argument4;
	if !mp_grid_path(global.AI_grid, path, sx,sy,fx,fy,true) return false;
	else
	{
		path_set_kind(path, 1);
		path_set_precision(path,8);
		return true;
	}



}

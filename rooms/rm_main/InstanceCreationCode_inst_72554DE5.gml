//IMPORTANT room warps
if(os_type==os_android)
{
	targetroom=rm_lvl1r1;
	targetx=850;
	targety=850;
}
else 
switch (scr_lvlload())
{
	//debug room
	case 0:
	targetroom=rm_test;
	targetx=200;
	targety=200;
	break;
	//no save detected
	case 1:
	instance_destroy();
	break;
	//story checkpoint 1
	case 2:
	targetroom=rm_lvl1r1;
	targetx=850;
	targety=850;
	break;
	case 3:
	targetroom=rm_lv1r4;
	targetx=50;
	targety=50;
	break;
}

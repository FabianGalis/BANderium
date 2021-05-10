drag_end_x = event_data[?"rawposX"];
drag_end_y = event_data[?"rawposY"];

var pd=point_direction(drag_start_x,drag_start_y,drag_end_x,drag_end_y);
	
if (pd>359-swipe_margin && pd<360 || pd<0+swipe_margin)
{
	//Right swipe
	hinput=1;
}
	
if (pd>180-swipe_margin && pd<180+swipe_margin)
{
	//Left swipe
	hinput=-1;
}
	
if (pd>90-swipe_margin && pd<90+swipe_margin)
{
	//Up swipe
	input_up_p=1;
}
	
if (pd>270-swipe_margin && pd<270+swipe_margin)
{
	//Down swipe
	input_down_p=1;
}
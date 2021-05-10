/*
draw_set_alpha(0.1);

mp_grid_draw(global.AI_grid);

for (var i=0; i< room_width; i+=16)
{
	draw_line(i,0,i,room_height);
}
for (i=0;i<room_height;i+=16)
{
	draw_line(0,i,room_width,i);
}
draw_set_alpha(1);

if(instance_exists(o_par_enemy))draw_path(o_par_enemy.enemypath,x,y,true);
*/
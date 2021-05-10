///draw 3d rotating relative to z axis
function scr_draw_sprite_3d(argument0) {
	color=argument0;
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,-global.z,color,1);



}

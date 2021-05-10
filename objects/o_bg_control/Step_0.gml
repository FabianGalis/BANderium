var near=layer_get_id("bg3");
var far=layer_get_id("bg2");
var veryfar=layer_get_id("bg1");
var sky=layer_get_id("sky");

layer_x(near,lerp(0,camera_get_view_x(view_camera[0]),0.5));
layer_x(far,lerp(0,camera_get_view_x(view_camera[0]),0.7));
layer_x(veryfar,lerp(0,camera_get_view_x(view_camera[0]),0.85));
layer_x(sky,camera_get_view_x(view_camera[0])-slowscroll);

slowscroll += 0.2;
if(slowscroll>sprite_get_width(s_bg_sky))slowscroll=0;

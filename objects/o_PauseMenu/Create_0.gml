global.view_width = camera_get_view_width(view_camera[0]);
global.view_height = camera_get_view_height(view_camera[0]);

global.pause=false;

depth=-2000;

inputting = false;

//tap detector for android
tapping=false;

//Swipe margin sets how accurate a swipe must be to be detected
swipe_margin  = 50;

//initial input values
hinput        = 0;
input_up_p    = 0;
input_down_p  = 0;

//windows controls
global.key_enter = vk_space;
global.key_up= vk_space;
global.key_down = vk_control;
global.key_sprint=vk_shift;
global.key_away = ord("W");
global.key_closer=ord("S");
global.key_move_left=ord("A");
global.key_move_right=ord("D");
//device specific (improvisation)
if(os_type==os_android)
{
	global.key_aim=mb_left;
	global.key_shoot=mb_right;
	global.mousedevice=1;
}
else
{
	global.key_aim=mb_right;
	global.key_shoot=mb_left;
	global.mousedevice=0;
}

display_set_gui_size(global.view_width,global.view_height);

enum menu_page{
	main,
	settings,
	audio,
	graphics,
	controls,
	controls2,
	controls3,
	height
}
enum menu_element_type{
	script_runner,
	page_transfer,
	slider,
	shift,
	toggle,
	input
}

//MENU PAGES
ds_menu_main = create_menu_page(
	["Resume",   menu_element_type.script_runner, resume_game],
	["Settings", menu_element_type.page_transfer, menu_page.settings],
	["EXIT",     menu_element_type.script_runner, exit_game]
);

if(os_type==os_android)
{
	ds_settings  = create_menu_page(
		["Audio",      menu_element_type.page_transfer, menu_page.audio],
		//["Preferences", menu_element_type.page_transfer, menu_page.preferences],
		["Key Bindings",   menu_element_type.page_transfer, menu_page.controls],
		["BACK",       menu_element_type.page_transfer, menu_page.main]
	);
}
else
{
	ds_settings  = create_menu_page(
		["Audio",      menu_element_type.page_transfer, menu_page.audio],
		//["Preferences", menu_element_type.page_transfer, menu_page.preferences],
		["Graphics",   menu_element_type.page_transfer, menu_page.graphics],
		["Controls",   menu_element_type.page_transfer, menu_page.controls],
		["BACK",       menu_element_type.page_transfer, menu_page.main]
	);
}
ds_menu_audio = create_menu_page(
	["Master",  menu_element_type.slider,        change_volume, 1, [0,1]],
	["Sounds",  menu_element_type.slider,        change_volume, 1, [0,1]],
	["Music",   menu_element_type.slider,        change_volume, 1, [0,1]],
	["BACK",    menu_element_type.page_transfer, menu_page.settings]
);

/*ds_menu_preferences = create_menu_page(
	["Favourite color", menu_element_type.shift, change_preferences, 0, ["Red","Blue","Green"]],
	["BACK",menu_element_type.page_transfer, menu_page.settings]
);*/

ds_menu_graphics = create_menu_page(
	["Resolution", menu_element_type.shift,  change_resolution, 0, ["320 x 180", "640 x 360", "1280 x 720","1920 x 1080"]],
	["Fullscreen", menu_element_type.toggle,change_window_mode, 0, ["WINDOWED","FULLSCREEN"]],
	["Vignette", menu_element_type.toggle,toggle_vignette   , 0, ["OFF","ON"]],
	["BACK",    menu_element_type.page_transfer, menu_page.settings]
);
ds_menu_controls = create_menu_page(
	["Move up",   menu_element_type.input,"key_up", ord("W")],
	["Move down", menu_element_type.input,"key_down", ord("S")],
	["Move left", menu_element_type.input,"key_move_left", ord("A")],
	["Move right",menu_element_type.input,"key_move_right", ord("D")],
	["Page select",menu_element_type.toggle,control_page_transfer,0,["1","2"]],
	["BACK", menu_element_type.page_transfer , menu_page.settings]
);
ds_menu_controls2 = create_menu_page(
	["Look closer", menu_element_type.input,"key_down", vk_control],
	["Look farther",menu_element_type.input,"key_up", vk_space],
	["Sprint",menu_element_type.input,"key_sprint", vk_shift],
	["Other actions", menu_element_type.input,"mouse", mb_left],
	["Page select",menu_element_type.toggle,control_page_transfer,1,["1","2"]],
	["BACK", menu_element_type.page_transfer , menu_page.settings]
);

page=0;
menu_pages = [ds_menu_main,ds_settings,ds_menu_audio, ds_menu_graphics,ds_menu_controls,ds_menu_controls2];
var i=0, array_len= array_length_1d(menu_pages);
repeat(array_len) {menu_option[i]=0;i++;}

//audio_group_load(audiogroup_music);
//audio_group_load(audiogroup_soundeffects);


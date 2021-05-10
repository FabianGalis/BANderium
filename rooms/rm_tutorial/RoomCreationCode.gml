o_player.battlemode=true;
o_player.sprite_index=s_player_walk_e;
o_cam.lockcam=false;
if(!audio_is_playing(ost_lvl1))
{
	audio_stop_all();
	audio_play_sound(ost_lvl1,0,true);
}

//delete progress
ini_open("lvlsave.ini");
ini_write_string("save1","progress",string(1));
ini_close();
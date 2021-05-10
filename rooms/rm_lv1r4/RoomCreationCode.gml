scr_lvlsave(3);
if(!audio_is_playing(ost_lvl1))
{
	audio_stop_all();
	audio_play_sound(ost_lvl1,0,true);
}
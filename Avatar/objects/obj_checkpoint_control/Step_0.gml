if(room == rm_menu_main)
{
	checked = false;
	roomvalue = Level1;
	
}
else if(room == Level1 || room == Level2 || room == TheFrogFather)
{
	roomvalue = room;	
}

if(!checked)
{
	xvalue = 0;
	yvalue = 0;
}

if(room == TheFrogFather)
{
	audio_stop_sound(snd_music_main);
	if(!audio_is_playing(snd_music_boss))
	{
		audio_play_sound(snd_music_boss,0,true);
	}
}
else
{
	audio_stop_sound(snd_music_boss);
	if(!audio_is_playing(snd_music_main))
	{
		audio_play_sound(snd_music_main,0,true);
	}	
}


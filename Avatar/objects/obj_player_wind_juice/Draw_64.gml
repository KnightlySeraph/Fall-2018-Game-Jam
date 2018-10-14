/// @description Insert description here
if(instance_exists(obj_player))
{
	
	segment = obj_player.windMax / 27;

	if(obj_player.windPower >= (obj_player.windMax - segment))
	{
		draw_sprite(spr_player_wind_juice,26,x,y);
	}
	else
	{
		draw_sprite(spr_player_wind_juice,obj_player.windPower / segment,x,y);
	}
}


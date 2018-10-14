/// @description Insert description here
with (other){
	if(!immune){
		immune = true;
		player_health -= 1;
		alarm[1] = 30;
	}
}

instance_destroy();

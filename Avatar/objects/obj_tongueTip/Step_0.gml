/// @description Insert description here
if (moveLeft){
	x -= moveSpeed;
	if (!alarm_ticking){
		alarm_ticking = true;
		alarm[0] = 5;
	}
}



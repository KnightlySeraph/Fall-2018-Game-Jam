/// @description Move Platform
//For Debug
if (keyboard_check_pressed(ord("D"))) { isMovingRight = true; }
if (keyboard_check_pressed(ord("A"))) { isMovingLeft = true; }
if (keyboard_check(ord("D"))) { x += moveSpeed; }
if (keyboard_check(ord("A"))) { x -= moveSpeed }
//Print Debug Log
if (keyboard_check_pressed(ord("E"))){
	show_debug_message("isMovingRight is : " + string(isMovingRight));
	show_debug_message("isMovingLeft is : " + string(isMovingLeft));
	show_debug_message("isMovingTowardsOrigin is : " + string(isMovingTowardsOrigin));
	show_debug_message("Object Location (x,y) is (" + string(x) + ", " + string(y) + ")"); 
}
//Enforce one or the other type of movement
if(isMovingLeft){
	isMovingRight = false;
	isMovingTowardsOrigin = false;
}
if(isMovingRight){
	isMovingLeft = false;	
	isMovingTowardsOrigin = false;
}
if(isMovingTowardsOrigin){
	isMovingLeft = false;
	isMovingRight = false;
}
//Do the movements
if (isMovingLeft){
	x -= moveSpeed;
	if(x < minRange){
		//Start Alarm of 2 Seconds
		if (!alarm_ticking){
			alarm_ticking = true;
			alarm[0] = 60;
		}
	}
}
if (isMovingRight){
	x += moveSpeed;
	if(x > maxRange){
		//Start Alarm of 2 Seconds
		if (!alarm_ticking){
			alarm_ticking = true;
			alarm[1] = 60;
		}	
	}
}
if (isMovingTowardsOrigin) {
	if (x > originalPosX){
		x -= moveSpeed;
	}
	else{
		x += moveSpeed;	
	}
	if (x == originalPosX){
		//Set all possible states to false
		isMovingLeft = false;
		isMovingRight = false;
		isMovingTowardsOrigin = false;
	}
}

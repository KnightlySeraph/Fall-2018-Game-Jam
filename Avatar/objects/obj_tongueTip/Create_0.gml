/// @description Insert description here
moveLeft = false;
moveRight = false;

moveSpeed = 25;

originX = x;

alarm_ticking = false;

//Catch Player Location
if (instance_exists(obj_player)){
	pX = obj_player.x;
	pY = obj_player.y;
	if(x < pX){
		image_xscale = -1;	
	}
}




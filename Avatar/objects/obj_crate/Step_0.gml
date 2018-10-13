/// @description Allow Falling

if (place_meeting(x, y - 1, obj_balloon)){
	isStatic = true;	
}
else {
	isStatic = false;	
}

//Allow the Object to Fall
if (!isStatic){
	if (!place_meeting(x, y + 1, obj_wall)){
		y += objectGravity;
		if (objectGravity < 0.7) {
			objectGravity += 0.5;	
		}
		else{
			objectGravity = 0.2;	
		}
	}
}

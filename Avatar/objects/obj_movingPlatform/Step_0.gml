///@description Move Platform based on Player Input
//Disallow the ability to perform both inputs
if (receivingLeftFacingInput) { receivingRightFacingInput = false; }
if (receivingRightFacingInput) { receivingLeftFacingInput = false; }

//Testing Controls
if (keyboard_check(vk_space)) { receivingLeftFacingInput = true; allowRight = true; allowLeft = false; }
if (keyboard_check_released(vk_space)) { receivingLeftFacingInput = false; }
//if (keyboard_check(ord("A"))) { receivingRightFacingInput = true; allowLeft = true; allowRight = false; }
//if (keyboard_check_released(ord("A"))) { receivingRightFacingInput = false; }

//For Player Link
//Set Allow Right while receiving Left Facing
if (receivingLeftFacingInput) {
	allowRight = true;
	allowLeft = false;
}

//Set Allow Left while receiving Right Facing
if (receivingRightFacingInput) {
	allowLeft = true;
	allowRight = false;
}

//========================RIGHT MOVEMENT===================
if (allowRight){
	if (receivingLeftFacingInput) {
		if (!receivedInput){
			receivedInput = true;	
		}
		if(place_meeting(x+(moveSpeed / 2), y, obj_player))
		{
			while(!place_meeting(x+sign(moveSpeed / 2), y, obj_player))
			{
				x += sign(moveSpeed / 2);	
			}
			//If moving left or right, big bounce
			if(obj_player.leftright != 0) obj_player.temphsp = 17 * sign(moveSpeed / 2);
			//Else, small bounce
			else obj_player.temphsp = 6 * sign(moveSpeed / 2);

		}
		else
		{
			x += moveSpeed / 2;
		}
		if (moveSpeed < termialSpeed){
			moveSpeed += momentum;	
		}
		//Force a range check
		if ( x >= maxRange){
			x = maxRange;
			receivedInput = false;
			moveSpeed = originalMoveSpeed;
		}
	}


	//Continue moving right under no input
	if (!receivingLeftFacingInput && receivedInput){
		if(place_meeting(x+(moveSpeed / 2), y, obj_player))
		{
			while(!place_meeting(x+sign(moveSpeed / 2), y, obj_player))
			{
				x += sign(moveSpeed / 2);	
			}
			//If moving left or right, big bounce
			if(obj_player.leftright != 0) obj_player.temphsp = 17 * sign(moveSpeed / 2);
			//Else, small bounce
			else obj_player.temphsp = 6 * sign(moveSpeed / 2);

		}
		else
		{
			x += moveSpeed / 2;
		}
		if (moveSpeed > originalMoveSpeed){
			moveSpeed -= momentum; 
		}	
		if (!alarm_ticking){
			alarm_ticking = true;
			alarm[0] = 60;
		}	
	}

	//Move back to origin
	if (!receivingLeftFacingInput && !receivedInput){
		if (x > originalPosX) {
			if(place_meeting(x-(moveSpeed * 10), y, obj_player))
			{
				while(!place_meeting(x-sign(moveSpeed * 10), y, obj_player))
				{
					x -= sign(moveSpeed * 10);	
				}
				//If moving left or right, big bounce
				if(obj_player.leftright != 0) obj_player.temphsp = 17 * -sign(moveSpeed * 10);
				//Else, small bounce
				else obj_player.temphsp = 6 * -sign(moveSpeed * 10);

			}
			else
			{
				x -= moveSpeed * 10;	
			}
		}
	}
}


//====================LEFT MOVEMENT=================
if (allowLeft) {
	if (receivingRightFacingInput) {
		if (!receivedInput){
			receivedInput = true;	
		}
		x -= moveSpeed / 2;
		if (moveSpeed < termialSpeed){
			moveSpeed += momentum;	
		}
		//Force a range check
		if ( x <= minRange){
			x = minRange;
			receivedInput = false;
			moveSpeed = originalMoveSpeed;
		}
	}



	//Continue moving right under no input
	if (!receivingRightFacingInput && receivedInput){
		x -= moveSpeed / 2;
		if (moveSpeed > originalMoveSpeed){
			moveSpeed -= momentum; 
		}	
		if (!alarm_ticking){
			alarm_ticking = true;
			alarm[0] = 60;
		}	
	}

	//Move back to origin
	if (!receivingRightFacingInput && !receivedInput){
		if (x < originalPosX) {
			x += moveSpeed * 10;	
		}
	}


}

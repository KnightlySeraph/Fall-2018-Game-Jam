///@description Move Wall Based on Played Input
//Disallow the ability to perform both inputs
if (receivingBottomFacingInput) { receivingTopFacingInput = false; }
if (receivingTopFacingInput) { receivingBottomFacingInput = false; }

//Testing Controls
if (keyboard_check(vk_up)) { receivingBottomFacingInput = true; allowUp = true; allowDown = false; }
if (keyboard_check_released(vk_up)) { receivingBottomFacingInput = false; }
//if (keyboard_check(vk_down)) { receivingRightFacingInput = true; allowLeft = true; allowRight = false; }
//if (keyboard_check_released(vk_down)) { receivingRightFacingInput = false; }

//Console Log Controls
if (keyboard_check_pressed(ord("T"))) { show_debug_message ("Object Y Pos is: " + string(y) + "		Original Y is: " + string(originalPosY) + "		maxRange is: " + string(maxRange)); }

//Player Links
if (receivingBottomFacingInput){
	allowUp = true;
	allowDown = false;
}
//Set Allows down
if (receivingTopFacingInput) {
	allowDown = true;
	allowUp = false;
}

//========================UPWARDS MOVEMENT===========================
if (allowUp){
	//show_debug_message("allowUp Entered");
	if (receivingBottomFacingInput) {
		//show_debug_message("Entered bottom facing");
		if (!receivedInput){
			receivedInput = true;	
		}
		//Player Collision Interaction --Alex
			if(place_meeting(x, y + (moveSpeed / 2), obj_player))
			{
				while(!place_meeting(x, y + sign(moveSpeed / 2), obj_player))
				{
					//show_debug_message("Player Collision Block");
					y -= sign(moveSpeed / 2);	
				}
				//If moving left or right, big bounce
				if(obj_player.updown != 0) obj_player.tempvsp = 17 * sign(moveSpeed / 2);
				//Else, small bounce
				else obj_player.tempvsp = 6 * sign(moveSpeed / 2);

			}
			else
			{
				//show_debug_message("Moving Up");
				y -= moveSpeed / 2;
			}
		//--End Player Collision
		if (moveSpeed < termialSpeed){
			moveSpeed += momentum;	
		}
		//Force a range check
		if ( y <= maxRange){
			y = maxRange;
			receivedInput = false;
			moveSpeed = originalMoveSpeed;
		}
	}


	//Continue moving right under no input
	if (!receivingBottomFacingInput && receivedInput){
		//Player Collsion Block --Alex
		if(place_meeting(x, y+(moveSpeed / 2), obj_player))
		{
			while(!place_meeting(x, y+sign(moveSpeed / 2), obj_player))
			{
				y -= sign(moveSpeed / 2);	
			}
			//If moving left or right, big bounce
			if(obj_player.leftright != 0) obj_player.temphsp = 17 * sign(moveSpeed / 2);
			//Else, small bounce
			else obj_player.temphsp = 6 * sign(moveSpeed / 2);

		}
		else
		{
			y -= moveSpeed / 2;
		}
		// --End Player Collision Block
		if (moveSpeed > originalMoveSpeed){
			moveSpeed -= momentum; 
		}	
		if (!alarm_ticking){
			alarm_ticking = true;
			alarm[0] = 60;
		}	
	}

	//Move back to origin
	if (!receivingBottomFacingInput && !receivedInput){
		if (y < originalPosY) {
			//Player Collision Block	--Alex
			if(place_meeting(x, y - (moveSpeed * 10), obj_player))
			{
				while(!place_meeting(x, y - sign(moveSpeed * 10), obj_player))
				{
					y += sign(moveSpeed * 10);	
				}
				//If moving left or right, big bounce
				if(obj_player.leftright != 0) obj_player.temphsp = 17 * -sign(moveSpeed * 10);
				//Else, small bounce
				else obj_player.temphsp = 6 * -sign(moveSpeed * 10);

			}
			else
			{
				y += moveSpeed * 10;	
			}
			//--End Player Collision Block
		}
	}
}
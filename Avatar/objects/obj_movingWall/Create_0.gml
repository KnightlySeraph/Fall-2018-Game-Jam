/// @description Object Documentation
///Documentation
//Platform moves based on main variables
//receivingLeftFacingInput AND
//receivingRightFacingInput
//To move the platform to the right set LeftFacingInput to true
//To move to the left set RightFacingInput to true
//Turn off either variable to slowly return the platform to the original position

//WARNINGS
//Do not make both LeftFacing and RightFacing true at the same time, untested

originalPosX = x;	//Original X Position
originalPosY = y;
moveSpeed = 1;	//Original Move Speed
originalMoveSpeed = moveSpeed;	//reference to original move speed
range = 300;	//+- Range for allow movement of the platform
maxRange = y + range; //Upper bound range
minRange = y - range;	//Lower bound range
alarm_ticking = false;	//Alarm is not running
receivingTopFacingInput = false; //Receives input from the left side, will move down
receivingBottomFacingInput = false; //Receives input from the right side, will move up
receivedInput = false; //Used for realistic physics and momentum
momentum = 0.3;	//Rate of speed increaded
termialSpeed = 10; //Maximum allowed speed
allowUp = false; //Allow left movement, used in step
allowDown = true; //Allow right movement, used in step

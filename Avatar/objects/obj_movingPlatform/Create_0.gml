/// @description Object Documentation
///Documentation
//Platform moves based on main variables
//receivingLeftFacingInput AND
//receivingRightFacingInput
//To move the platform to the right set LeftFacingInput to true
//To move to the left set RightFacingInput to true
//Turn off either variable to slowly return the platform to the original position

puzzle_num = 0;  //Must have same value as coorespponding pinwheel

//WARNINGS
//Do not make both LeftFacing and RightFacing true at the same time, untested

originalPosX = x;	//Original X Position
moveSpeed = 1;	//Original Move Speed
originalMoveSpeed = moveSpeed;	//reference to original move speed
range = 300;	//+- Range for allow movement of the platform
maxRange = x + range; //Upper bound range
minRange = x - range;	//Lower bound range
alarm_ticking = false;	//Alarm is not running
receivingLeftFacingInput = false; //Receives input from the left side, will move right
receivingRightFacingInput = false; //Receives input from the right side, will move left
receivedInput = false; //Used for realistic physics and momentum
momentum = 0.3;	//Rate of speed increaded
termialSpeed = 10; //Maximum allowed speed
allowLeft = false; //Allow left movement, used in step
allowRight = true; //Allow right movement, used in step


/// @description Documentation
//Set popBalloon to true to play the animation for the popping balloon.
//The object will destroy itself after the animation has played
popBalloon = false; // Used for destroying the balloon

//Create Crate Underneath the Balloon
instance_create_depth(x, y + 1, obj_crate, obj_balloon.depth);

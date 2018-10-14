/// @description Insert description here

if (trigger && !createOnce) { 
	instance_create_depth(8736,11076,0,obj_windParticles2);
	instance_create_depth(9146,11076,0,obj_windParticles2);
	instance_create_depth(9608,11076,0,obj_windParticles2);
	
	createOnce = true;
	alarm[0] = 60;
}


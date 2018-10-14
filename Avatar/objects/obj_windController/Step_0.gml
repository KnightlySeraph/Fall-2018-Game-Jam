/// @description Insert description here

if (keyboard_check_pressed(ord("I"))) { 
	show_message("Deact");
	
	with ( inst_38CF98F0 ){
		emitting = true;	
	}
	with ( inst_22690477){
		emitting = true;	
	}
	
	instance_create_depth(11880,6119,0,obj_windParticles);
	instance_create_depth(12999,6119,0,obj_windParticles);
}


/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_escape))
{
	if(!global.pause && global.pausestep == 0)
	{
		global.pause = true;
		global.pausestep += 1;
		instance_deactivate_all(true);
		instance_activate_object(obj_menu_pause);
	}
	else if(global.pause && global.pausestep == 1)
	{
		global.pause = false;
		global.pausestep -= 1;
		instance_activate_all();
		instance_deactivate_object(obj_menu_pause);
		instance_deactivate_object(obj_menu_options);
		instance_deactivate_object(obj_menu_volume);
		instance_deactivate_object(obj_menu_brightness);
		instance_deactivate_object(obj_menu_screen);
	}
	else if(global.pause && global.pausestep == 2)
	{
		global.pausestep -= 1;
		instance_activate_object(obj_menu_pause);
		instance_deactivate_object(obj_menu_options);
		instance_deactivate_object(obj_menu_volume);
		instance_deactivate_object(obj_menu_brightness);
		instance_deactivate_object(obj_menu_screen);
	}
	else if(global.pause && global.pausestep == 3)
	{
		global.pausestep -= 1;
		instance_activate_object(obj_menu_options);
		instance_deactivate_object(obj_menu_volume);
		instance_deactivate_object(obj_menu_brightness);
		instance_deactivate_object(obj_menu_screen);
	}
}
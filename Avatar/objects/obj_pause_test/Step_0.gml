/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_escape))
{
	if(!global.pause)
	{
		global.pause = true;
		instance_deactivate_all(true);
		instance_activate_object(obj_menu_pause);
	}
	else if(global.pause)
	{
		global.pause = false;
		instance_activate_all();
		instance_deactivate_object(obj_menu_pause);
	}
}
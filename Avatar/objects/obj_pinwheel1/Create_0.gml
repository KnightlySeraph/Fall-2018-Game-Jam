puzzle_num = 0; //Must be teh same as cooresponding wall
searchfor = 1;  //Determines whether searching for a platform (0) or wall (1)
wall = noone;

if(searchfor == 0)
{
	for (i = 0; i < instance_number(obj_movingPlatform); i += 1)
	{
		if(instance_find(obj_movingPlatform,i).puzzle_num == puzzle_num)
		{
			wall = instance_find(obj_movingPlatform,i);
		}
	}
}
else
{
	for (i = 0; i < instance_number(obj_movingWall); i += 1)
	{
		if(instance_find(obj_movingWall,i).puzzle_num == puzzle_num)
		{
			wall = instance_find(obj_movingWall,i);
		}
	}
}

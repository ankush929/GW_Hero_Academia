/// @description Update position follow player

if instance_exists(parentId)
{
	x = parentId.x + (sprite_width/2)*parentId.facing;
	y = parentId.y + parentId.z - parentId.sprite_height/2 - 5;
}
else
	instance_destroy();		// Destroy if Player instance doesn't exists

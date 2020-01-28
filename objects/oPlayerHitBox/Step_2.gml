/// @description Update position according player

if instance_exists(parentId)
{
	if parentId.state != parentId.HITWEAPON		// Hitbox positioning without weapon
	{
		var xPos = parentId.x + (sprite_width/2)*parentId.facing;
		var yPos = parentId.y + parentId.z - (parentId.sprite_height/2 + 5);	
	}
	else					// Hitbox positioning with weapon
	{
		var xPos = parentId.x + (sprite_width/2 + 14)*parentId.facing;
		var yPos = parentId.y + parentId.z - (parentId.sprite_height/2 - 10);
	}
	
	x = xPos;
	if parentId.onGround
		y = yPos;			// Place the hit box next to the hands on punches
	else
		y = yPos + 20;		// Place the hit box next to the feet on air kick
}
else
	instance_destroy();		// Destroy if Player instance doesn't exists

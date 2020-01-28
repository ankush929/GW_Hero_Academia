/// Player depth updates with Y position. This way a lower Y, means a farther depth and a greater Y, a closer depth
/// But there are exceptions according collisions with scenario objects

var colDown3D = position_meeting_3d(x, y, z + sign(vz), o3DCollider);			// Steping On an object/platform
var colLateral = position_meeting(x + 1, y, o3DCollider);						// Colliding horizontally with an object/wall
var colUp3D = position_meeting_3d(x, y, z - sprite_height/4, o3DCollider);		// Colliding a roof/platform from below

if colDown3D or colLateral or colUp3D
{
	if colDown3D or colUp3D
		col3D = instance_position(x, y, o3DCollider)
	else if colLateral
		col3D = instance_position(x + 1, y, o3DCollider);
	
	if (x < col3D.x + 1) or onPlatform						// If player is colliding with object from the Left OR is over a platform...
	{
		depth = -1*(col3D.y + col3D.sprite_height + 1);		// ...player's depth will be lower thant collision depth
	}
	else
		depth = -1*y;										// In any other case, reset depth to relative to Y position
}
else
	depth = -1*y;											// And if no collisions, depth is always relative to Y position
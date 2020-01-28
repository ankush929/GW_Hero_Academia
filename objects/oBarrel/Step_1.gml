/// @description Create the collision box for this object

// Each platform object has its own collision box...
// ...and it is a slightly wider than the object width
// Don't mislead with the object's hit box! its hitbox is defined by its sprite. Collision box is for player collisions and (maybe) platforms
if collisionBox = 0
{
	collisionBox = instance_create_depth(x, y,depth - 1, o3DCollider);
	collisionBox.parId = id;
	collisionBox.image_xscale = (sprite_width/sprite_get_width(s3DCollider)) + 1;
	collisionBox.image_yscale = 1;
	collisionBox.x = x - size_margin;
	collisionBox.y = y + z;
	collisionBox.z = -z;
	collisionBox.height = height;
}

/// @description Create the collision box for this object

if collisionBox = 0
{
	collisionBox = instance_create_depth(x, y,depth - 1, o3DCollider);
	collisionBox.image_xscale = (sprite_width/sprite_get_width(s3DCollider)) + 0.5;
	collisionBox.image_yscale = (sprite_height/sprite_get_height(s3DCollider))/6.5;
	collisionBox.parId = id;
	collisionBox.x = x - size_margin;
	collisionBox.y = y;
	collisionBox.z = z;
	collisionBox.height = height;
}


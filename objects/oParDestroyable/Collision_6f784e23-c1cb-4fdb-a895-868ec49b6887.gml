/// @description Destroy if enemy crashes againt it
opponent = other.id;
if abs(depth - other.depth) <= PlayerLayerSize and y + sprite_height >= other.y
and !destroy
and other.state = other.KO
{
	if resistance > 0		// decrease object's resistance
		resistance -= resistance;
}

if resistance <= 0			// and if resistance is 0, destroy it!
	destroy = true;
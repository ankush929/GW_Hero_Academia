/// @description Hit enemy and apply damage
if other.state != other.DEAD and other.state != other.KO		// A Player can't hit enemies who are DEAD or KO
and parentId != other.id 										// Hit any other Player but not the owner one
{
	/// -------- Manage enemy life ------------
	if abs(other.depth - parentId.depth) <= PlayerLayerSize 
	and (abs(other.y - parentId.y) <= PlayerLayerSize)			// Check if Player punch and Enemy are in the depth and Y range to receive hit
	{
		if !parentId.canGrab	// If Player is grabbing someone...
		{
			if other.grabbed	// ..hit collision affects only to this opponent
				hitEnemies();
		}
		else					// For regular hits, affects to all near enought to Hitbox
			hitEnemies();
	}
}
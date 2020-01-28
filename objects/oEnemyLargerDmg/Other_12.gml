/// @description Stop and choose opponent to face
speed = 0; // Stop walking

if instance_exists(oParPlayer)									// if there's any Player instance alive
	nearestOpponent = instance_nearest(x, y + z, oParPlayer);	// the enemy looks for the nearest one

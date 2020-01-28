/// @description Count enemies in this area
if !populated
{
	if instance_exists(oParEnemy)				// Check if there are enemies in the room
	{
		with (oParEnemy) {						// Look if they are IN this Battle Area...
			if (place_meeting(x, y, other)) {
				other.enemyId[other.enemiesInArea] = id;	// ...store the id of the enemy instance
				other.enemiesInArea += 1;					// ...count the number of enemies
				instance_deactivate_object(id);	// Once checked population, deactivate all enemies to optimize game performance
			}
		}
	}
}

// If there are enemies, then this area is populated!
if enemiesInArea > 0
{
	enemiesNumber = enemiesInArea;
	populated = true;
}
/// @description Battle area properties

enemiesInArea = 0;		// Counter of the enemies in a Battle area
enemiesNumber = 0;		// Used to check how many enemies are placed in a Battle area
enemyId = 0;			// Will store the Id of enemies to be able to reactivate them
populated = false;		// Set the Area as unpopulated by enemies (we use this to not show Win messages if level designer haven't placed any enemies or if they are placed dynamically) 
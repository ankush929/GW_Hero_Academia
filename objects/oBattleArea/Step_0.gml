/// @description Manages Battle Area properties

// When camera reaches this Battle area...
if (camera_get_view_x(cam) + camera_get_view_width(cam) > x) and enemiesInArea = enemiesNumber
and !instance_exists(oParEnemy)
{
	// Activate all this Battle Area enemies
	var i;
	for (i = 0; i < enemiesNumber; i++)		// Check into the stored enemies array
	{
		if !instance_exists(enemyId[i])
			instance_activate_object (enemyId[i]);
	}
}

// When oCamera enters in a Battle area...
if (camera_get_view_x(cam) > x) or (oCamera.x >= x /*+ sprite_width/3*/)
{
	oGame.lastBattleAreaX = x;					// Store this Battle area X position
	oGame.lastBattleAreaWidth = sprite_width;	// Store this Battle area width 
	oGame.inBattleArea = true;					// Activate inBattleArea
}

// When there's no more enemies alive in a populated area, prepare to kill it
if populated and enemiesInArea <= 0
{
	oCamera.cameraDir = 0;						// Set oCamera temporary to not any direction (either 1 nor -1)
	oGame.lastBattleAreaWidth = 0;				// Reset the lastBattleAreaWidth to 0
	if instance_number(oBattleArea) > 1			// If thera are more Battle Areas in the game...
	{
		guiMsg = instance_create_layer(0,0,"GUI",oGUImsg);	// ..Create a GO! message
		guiMsg.type = guiMsg.GO;
	}
	else										// If this was the last Battle area...
	{
		guiMsg = instance_create_layer(0,0,"GUI",oGUImsg);	// ..Create a WIN message
		guiMsg.type = guiMsg.STAGECLEAR;
	}
	
	populated = false;							// The battle area is not populated anymore!
	oGame.inBattleArea = false;					// Deactivate inBattleArea flag
	instance_destroy();							// Finally destroy this battle area
}

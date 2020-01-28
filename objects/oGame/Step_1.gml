/// @description Check Game over
if !instance_exists(oParPlayer) and playersFromStart and !continueMsg
{
	guiMsg = instance_create_layer(0,0,"GUI",oGUImsg);	// ..Create a CONTINUE message
	guiMsg.type = guiMsg.CONTINUE;
	guiMsg.alarm[1] = room_speed;						// Start CONTINUE countdown with 1 sec timing
	continueMsg = true;
}

if continueMsg and instance_exists(oParPlayer)			// If added a new Player while CONTINUE countdown...
{
	with oGUImsg										// Delete guiMsg
	{
		if type = CONTINUE
			instance_destroy();
	}
	continueMsg = false;								// Set CONTINUE to false
}
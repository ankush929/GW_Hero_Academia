
var camX1 = camera_get_view_x(cam);
var camX2 = camera_get_view_x(cam) + camera_get_view_width(cam);
// Current Battle Area X boundaries (temporary variables)
var btaX1 = oGame.lastBattleAreaX;
var btaX2 = oGame.lastBattleAreaX + oGame.lastBattleAreaWidth;

if (oGame.inBattleArea and ((camX2 >= btaX2 and cameraDir = 1) or (camX1 < btaX1 and cameraDir = -1)))	// If inBattleArea and camera crosses the Battle area boundaries when moving...
or (camX1 < btaX1 and cameraDir = -1) 																	// ..or camera tries to go back to the lastBattleAreaX (no matter if inBattleArea or not)...
{
	camSpeedX = 0;																						// ..Stop camera!
}
else																									// Else if...
if (x > btaX1 + xBorder and cameraDir = 1)																// ..oCamera (which follows Player/s) passes the Right xBorder...
or (x < camX1 + xBorder and cameraDir = -1)																// ..or oCamera tries to go back to the Left xBorder...
or cameraDir = 0																						// ..or camera is not triyin to move at all...
{																										// ...let the Camera move!
	if !oGame.inBattleArea																				// If the last BattleZone has just been destroyed...
		camSpeedX = Approach(camSpeedX, 10, 0.2);														// ...will do it smoothly
	else
		camSpeedX = 10;																					// In any other case, directly reset tha caera speed to its standard value.
}
/*
if global.DebugGUIOn		// camera debug info in Game Maker console (not mandatory to work)
	trace("X: " + string(x) + " | CamX: " + string(camX1) + " | LastX: " + string(btaX1) + " | BeyondX: " + string(btaX2 - xBorder) + "| BeforeX: " + string(btaX1 + xBorder) + " | CameraDir: " + string(cameraDir));

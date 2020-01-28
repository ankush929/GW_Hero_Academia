/// @description Check camera direction

///According which was its last x position
if x < lastX
	cameraDir = -1;
else if x > lastX
	cameraDir = 1;

// This is a tweak so as in BeU games, when you advance you can't go back. (except inBattleAreas, where camera can scroll through all BA width) 
if !oGame.inBattleArea and cameraDir != -1 
	oGame.lastBattleAreaX =  camera_get_view_x(cam);
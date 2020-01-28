/// @description Read me and Game inits


randomize();

// Globals
global.DebugGUIOn = false;
global.InfoGUIOn = false;
global.animFPS = 20 / game_get_speed(gamespeed_fps);		// Set the base animation speed for every sprite animation

global.friendlyFire = false;								// Set friendlyFire flag. Will check if Players can hit each other
global.playerLives = 3;

// Battle Zones vars
inBattleArea = false;
lastBattleAreaX = 0;
lastBattleAreaWidth = 0;

// Check Win/Loose and Go!conditions
letsGo = false;
playersFromStart = instance_exists(oParPlayer);				// Check that there are Player/s from the beggining for a better Loose condition
continueMsg = false;
global.gameOver = false;											// Will activate if CONTINUE timer reaches zero
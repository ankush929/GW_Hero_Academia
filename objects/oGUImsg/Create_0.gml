/// @description Init Gui msg properties

depth = -10000;

// Message types
GO			= 0;
STAGECLEAR	= 1;
CONTINUE	= 2;

text  = "";
text2 = "";
counterText = 9;		// Text counter for continueMsg
posX = 0;
posY = 0;
endScreenX = camera_get_view_x(cam) + camera_get_view_width(cam);
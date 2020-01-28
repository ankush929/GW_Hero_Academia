/// @description Manage according text type

switch (type)
{
	case GO:
		text = "GO!";				// Set text
		posX = camera_get_view_x(cam) + camera_get_view_width(cam) - 20;	// Place text X
		posY = camera_get_view_y(cam);			// Place text Y
		
		if alarm[0] = -1			// Call alarm to blinking text
			alarm[0] = 30;
		
		if oCamera.x > endScreenX	// If oCamera overpasses thest position...
			instance_destroy();		// ...delete this message
	break;
	case STAGECLEAR:
		text = "STAGE CLEARED!";	// Set text		
		posX = camera_get_view_x(cam) + camera_get_view_width(cam)/2;	// Place text X
		posY = camera_get_view_y(cam) + 100;		// Place text Y
	break;
	case CONTINUE:
		text = "CONTINUE?";	// Set text		
		text2 = "Insert Coin (Press '1')";	// Set text	
		posX = camera_get_view_x(cam) + camera_get_view_width(cam)/2;	// Place text X
		posY = camera_get_view_y(cam) + 100;		// Place text Y
	break;
}


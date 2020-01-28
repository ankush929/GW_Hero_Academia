/// @description Make camera follow Player/s

// Place camera debug info in front of everything!
depth = -10000;

// Camera position updates
lastX = x;				// store the last x position of oCamera to check its direction

if instance_exists(oParPlayer)
{
	if instance_number(oParPlayer) <= 1						// In case of 1 Player
	{
		x = oParPlayer.x;
		y = oParPlayer.y - yDisp;
	}
	else													// In case of multiplayer (from now, only basic code for 2 players)
	{
		var i;
		for (i = 0; i < instance_number(oParPlayer); i++)
		{
			player[i] = instance_find(oParPlayer,i);
		}
		x = abs(player[0].x + player[1].x)/2;
		y = abs(player[0].y + player[1].y)/2 - yDisp;
	}
}

camera_set_view_size(cam,view_width,view_height);			// Update camera size (in case of zoom or fullscreen)
camera_set_view_speed(cam, camSpeedX, -1);					// Update camera speed


/// @description Position and rotation updates

image_angle = angle;	// Update rotation

repeat(abs(vx)) 
{  
	//x += sign(vx);
	
	// X Update
	if !position_meeting(x + sign(vx), y, oParSolid)			// If weapon don't collide left or right..
		x += sign(vx);											// ..update x position
	else { 														// BUT if he collides..
		vx = 0;													// ..can't go further...
		break;
	}
	
}

repeat(abs(vy)) 
{  
	// Y Update
	if y < dy													// If weapon don't reach the floor
		y += sign(vy);											// ..update y position
	else { 														// Else stop falling
		vy = 0;
		onGround = true;										// Flag onGround as true
		angle = 0;
		break;
	}
}

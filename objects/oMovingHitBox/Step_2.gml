/// @description Update position

// Destroy if Player instance doesn't exists
if !instance_exists(parentId)
	instance_destroy();		

// Destroy if get out of the camera
var rightCam = camera_get_view_x(cam) + camera_get_view_width(cam);
var leftCam = camera_get_view_x(cam);
if x > rightCam or x < leftCam
	instance_destroy();
	
// Horizontal movement
repeat(abs(vx)) {
	if !place_meeting(x - (sprite_width/2*sign(vx)) + sign(vx), y, oParSolid)
		x += sign(vx);															// ..update x position
	else 
	{
		vx = 0;
		addParticles(0, x, y - fakeYDisp + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);		// Hit particles
		instance_destroy();														// Destroy on Hit obstacles
		break;
	}
}

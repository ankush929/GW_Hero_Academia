/// @description Previous collisions

colLeft		= position_meeting(x - 1, y, oParSolid);
colRight	= position_meeting(x + 1, y, oParSolid);
colUp		= position_meeting(x, y - 1, oParSolid) or position_meeting(x, y - 1, oBgCollider);
colDown		= position_meeting(x, y + 1, oParSolid) or y > camera_get_view_y(cam) + camera_get_view_height(cam);

var dist = irandom_range(200,400);		// Set the flee distance within a range
if colLeft or colRight or colUp or colDown	// Detect if there's any obstacle (oParSolid or oBgCollider) collision
{
	if !flee
	{
		flee = true;					// Start fleeing the obstacle
		alarm[5] = room_speed;			// Flee for 1 second
		spdMult = 0.5;					// While fleeing, RUN anbimation will run at half speed
	}
	
	/// Flee directions depending on collision side
	if colLeft
	{
		dirY = y + choose(dist,-dist);
		dirX = x + 100;
	}
	if colRight
	{
		dirY = y + choose(dist,-dist)
		dirX = x - 100;
	}
	if colUp
	{
		dirX = x + choose(dist,-dist)
		dirY = y + 100;
	}
	if colDown
	{
		dirX = x + choose(dist,-dist)
		dirY = y - 100;
	}
}

// Reset IDLE enemy is not grabbed anymore
if state = GRABBED 
{
	if !grabbed or grabberId.state != 20 // Hardcoded fix: grabberId.GRAB value is 20 so this line forces this condition
		state = IDLE;
}


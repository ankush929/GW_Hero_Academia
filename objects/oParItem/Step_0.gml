/// @description Update momentum
vx = Approach(vx, 0, 0.025);	// Friction stops horizontal speed
vy = Approach(vy, 4, 0.25);		// Gravity affects vertical speed
angle -= vx*10;
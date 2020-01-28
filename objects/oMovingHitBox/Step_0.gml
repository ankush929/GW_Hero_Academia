/// @description Movement
vx = Approach(8*spd, spd, 0.1);		// decelerate speed
angle -= 30*sign(spd);				// rotate projectile
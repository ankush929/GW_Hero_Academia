/// @description Update changes

gforce = Approach(gforce, grav, 0.1);

vh = lerp(vh, 0, 0.05);
vv = lerp(vv, gforce, 0.5);

if vanish
	alpha = lerp(alpha, 0, 0.25);

if decrease
	size = lerp(size, 0, 0.05);
	
if rotate
	angle -= vh + 1;
	
// Destroy
if alpha <= 0
	instance_destroy();
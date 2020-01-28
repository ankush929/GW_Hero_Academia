

var char = argument[0];
char.wResistance--;

if char.wResistance <= 0
{
	// Weapon break particles ------------
	var xx = char.x + (char.sprite_width/2 + 10)*char.facing;
	var yy = char.y - char.sprite_height/2;
	var color1 = make_color_hsv(150,80,180);
	var color2 = make_color_hsv(150,80,200);
	var color3 = make_color_hsv(150,80,240);
	var frame = irandom(sprite_get_number(sBrokenPiece));
	
	addParticles(0, xx, yy + random_range(5,-5), 0, 0, 0.5, c_white, 0.75, other.depth - 1, 1, true, sHitParticle, 0, 0, true);
	repeat (8)
		addParticles(0, xx, irandom_range(yy - 5,yy + 5), irandom_range(-1, 4), irandom_range(-20, 10), random_range(0.25,0.5), choose(color1, color2, color3), 1, depth + choose(1,-1), 30, true, sBrokenPiece, frame, 1, true);
	// ------------------------------------
}
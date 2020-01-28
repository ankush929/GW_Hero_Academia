/// @description Particles on destroy

event_inherited();				// This object can create an item on destroy. Look at oParDestroyable

// Destroy particles
var xx = x + sprite_width/2;
var yy = opponent.y - opponent.sprite_height/2;
var color1 = make_color_hsv(0,0,128);
var color2 = make_color_hsv(0,0,96);
var color3 = make_color_hsv(0,0,144);
var dir = opponent.facing;

// Pieces FX
repeat (15)
{
	var frame = irandom(sprite_get_number(sBrokenPiece));
	addParticles(0, xx, irandom_range(yy,y+sprite_height), irandom_range(2*-dir, 6*dir), irandom_range(-10, 0), random_range(0.1,1), choose(color1, color2, color3), 1, depth + choose(1,-1), 10, false, sBrokenPiece, frame, 2, true);
}
// Destroy FX
addParticles(0, xx, y+sprite_height/2, 0, 0, 2, c_white, 1, depth - 1, 1, true, sHitParticle, 0, 0, false);


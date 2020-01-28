/// @description Draw Item and shadow
if onGround	// Show shadow and sprite only when weapon is on ground
{
	draw_sprite_ext(sCharShadow, image_index, x, y, 0.85, 0.85, 0, c_black, 0.75);
}
draw_self();

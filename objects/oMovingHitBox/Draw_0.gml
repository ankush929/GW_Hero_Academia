/// @description Draw projectile sprite and HitBox on debug
if global.DebugGUIOn
	draw_self();
draw_sprite_ext(weaponSprite, image_index, x, y - fakeYDisp, sign(spd), image_xscale, angle, image_blend, image_alpha);

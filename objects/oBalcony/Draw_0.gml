/// @description Draw shadow and sprite
// Shadow
var yscale = 0.5;
draw_sprite_ext(sprite_index,image_index, x - 2, y + z + sprite_height*yscale + 1, image_xscale, yscale, image_angle, c_black, 0.2);
// Sprite
draw_self();

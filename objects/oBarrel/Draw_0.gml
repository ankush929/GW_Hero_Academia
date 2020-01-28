/// @description Draw sprite and shadow
var shadowLarge = sprite_height/64;
draw_sprite_ext(sCylinderShadow,image_index,x + 3, y + sprite_height - sprite_get_height(sCylinderShadow) + 5*shadowLarge + z, image_xscale, image_yscale, image_angle, image_blend, 0.5);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);

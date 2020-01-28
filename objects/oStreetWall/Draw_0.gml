/// @description Draw shadow and sprite

// Shadow
draw_set_alpha(0.2);
draw_rectangle_color(x, y + sprite_height - 20, x + sprite_width - 1, y + sprite_height + 8, c_black, c_black, c_black, c_black, false);
draw_set_alpha(1);
// Sprite
draw_self();

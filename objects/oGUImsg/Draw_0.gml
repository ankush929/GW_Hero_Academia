/// @description Manage draw according type
draw_set_font(largeBoldText);

switch (type)
{
	case GO:
		draw_text_outlined(posX - string_width(text), posY, text, c_yellow, c_gray, 1, 1, image_angle, image_alpha, 0);
	break;
	case STAGECLEAR:
		draw_set_halign(fa_center);
		draw_text_outlined(posX, posY, text, c_yellow, c_gray, 1, 1, image_angle, image_alpha, 0);
		draw_set_halign(fa_left);
	break;
	case CONTINUE:
		draw_set_halign(fa_center);
		draw_text_outlined(posX, posY, text, c_yellow, c_black, 1, 1, image_angle, image_alpha, 0);
		draw_text_outlined(posX, posY + font_get_size(largeBoldText) + 20, counterText, c_white, c_black, 1, 1, image_angle, image_alpha, 0);
		draw_set_font(-1);
		draw_text_outlined(posX, posY + font_get_size(largeBoldText)*2 + 40, text2, c_white, c_black, 1, 1, image_angle, image_alpha, 0);
		draw_set_halign(fa_left);
	break;
}

draw_set_font(-1);
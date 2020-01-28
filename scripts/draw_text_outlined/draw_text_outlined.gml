
var xx = argument0;
var yy = argument1;
var str = argument2;
var xScale = argument5;
var yScale = argument6;
var angle = argument7;
var alpha = argument8;
var sep = argument9;
var width = view_get_wport(view_camera[0]);
draw_set_colour(argument4);
draw_text_ext_transformed_colour(xx-1, yy, str, sep, width, xScale, yScale, angle, argument4, argument4, argument4, argument4, alpha);
draw_text_ext_transformed_colour(xx+1, yy, str, sep, width, xScale, yScale, angle, argument4, argument4, argument4, argument4, alpha);
draw_text_ext_transformed_colour(xx, yy-1, str, sep, width, xScale, yScale, angle, argument4, argument4, argument4, argument4, alpha);
draw_text_ext_transformed_colour(xx, yy+1, str, sep, width, xScale, yScale, angle, argument4, argument4, argument4, argument4, alpha);
draw_set_colour(argument3);
draw_text_ext_transformed_colour(xx, yy, str, sep, width, xScale, yScale, angle, argument3, argument3, argument3, argument3, alpha);
draw_set_colour(c_white);
/// @description Show camera boundaries on Debug
if global.DebugGUIOn
{
	/*draw_self();
	draw_set_color(c_lime);
	draw_line_width(oGame.lastBattleAreaX,0,oGame.lastBattleAreaX,room_height,2);
	draw_set_color(c_white);
	draw_set_halign(fa_center);
	draw_text(x, y - 30, string(x));
	draw_text(x, y - 50, string("x0:" + string(oGame.lastBattleAreaX) + "|x1:" + string(oGame.lastBattleAreaX + oGame.lastBattleAreaWidth)));
	draw_set_halign(fa_left);
	
	#region Raycast (Experiemntal)
	if instance_exists(oPlayer1)
	{
		var plray = oPlayer1.ray;
		if(ds_exists(plray, ds_type_map))
		{
			var startPosition = plray[? "startPosition"];
			var hitPosition = plray[? "hitPosition"];
			if(array_length_1d(hitPosition) > 0)
			{
				draw_line(startPosition[0], startPosition[1], hitPosition[0], hitPosition[1]);
				draw_line_color(hitPosition[0],
								hitPosition[1],
								hitPosition[0] + lengthdir_x(32, plray[? "normal"]),
								hitPosition[1] + lengthdir_y(32, plray[? "normal"]),
								c_red,
								c_red);
				var reflectionAngle = plray[? "reflectionAngle"];
				draw_line(hitPosition[0],
						  hitPosition[1],
						  hitPosition[0] + lengthdir_x(32, reflectionAngle),
						  hitPosition[1] + lengthdir_y(32, reflectionAngle));
			}
		}
	}
	#endregion*/
}

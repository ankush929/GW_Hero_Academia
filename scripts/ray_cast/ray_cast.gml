var map = ds_map_create();
ds_map_add(map, "startPosition", argument[0]); 
ds_map_add(map, "hitPosition", []); 
ds_map_add(map, "object", noone); 
ds_map_add(map, "direction", 0); 
ds_map_add(map, "reflectionAngle", 0); 
ds_map_add(map, "normal", 0); 
ds_map_add(map, "distance", 0); 

var currentDistance = 0;
var startPosition = argument[0];
if(!is_array(startPosition) || array_length_1d(startPosition) != 2)
{
	show_error("argument0 in ray_cast (startPosition) must be an array with two values (x and y)", true);
}
var maxDistance;
var rayDirection;
var object = argument[2];
var precise = argument[3];
var notMe = argument[4];
if(is_array(argument[1]))
{
	if(array_length_1d(argument[1]) != 2)
	{
		show_error("argument1 in ray_cast (endPosition) must have exactly two values (x and y)", true);
	}
	var endPosition = argument[1];
	rayDirection = point_direction(startPosition[0], startPosition[1], endPosition[0], endPosition[1]);
	maxDistance = point_distance(startPosition[0], startPosition[1], endPosition[0], endPosition[1]);
}
else
{
	rayDirection = argument[1];
	if(argument_count == 6)
	{
		maxDistance = argument[5];
	}
	else
	{
		show_debug_message("ray_cast maxDistance (argument[4]) is not defined. Will use the default 500.");
		maxDistance = 500;
	}
}

if(collision_line(startPosition[0], 
	 			  startPosition[1], 
	 			  startPosition[0] + lengthdir_x(maxDistance, rayDirection), 
	 			  startPosition[1] + lengthdir_y(maxDistance, rayDirection), 
				  object, 
				  precise, 
				  notMe) == noone)
{
	return map;
}


while(collision_line(startPosition[0], 
		 			 startPosition[1], 
		 			 startPosition[0] + lengthdir_x(maxDistance * .5, rayDirection), 
		 			 startPosition[1] + lengthdir_y(maxDistance * .5, rayDirection), 
					 object, 
					 precise, 
					 notMe) == noone && maxDistance > 1)
{
	startPosition[0] += lengthdir_x(maxDistance * .5, rayDirection);
	startPosition[1] += lengthdir_y(maxDistance * .5, rayDirection);
	maxDistance *= .5;
}

var hitSomething = false;
while(currentDistance < maxDistance && hitSomething == false)
{
	currentDistance += 1;
	var currentX = startPosition[0] + lengthdir_x(currentDistance, rayDirection);
	var currentY = startPosition[1] + lengthdir_y(currentDistance, rayDirection);
	var hitObject = collision_point(currentX, currentY, object, precise, notMe);
	if(hitObject != noone)
	{
		ds_map_replace(map, "hitPosition", [currentX, currentY]);
		ds_map_replace(map, "object", hitObject);
		var radAngle = degtorad(hitObject.image_angle);
		
		var _x = hitObject.x - ((hitObject.sprite_xoffset * cos(radAngle)) + (hitObject.sprite_yoffset * sin(radAngle)));
		var _y = hitObject.y + ((hitObject.sprite_xoffset * sin(radAngle)) - (hitObject.sprite_yoffset * cos(radAngle)));

		var centerX = _x + ((hitObject.sprite_width * .5 * cos(radAngle)) + (hitObject.sprite_height * .5 * sin(radAngle)));
		var centerY = _y - ((hitObject.sprite_width * .5 * sin(radAngle)) - (hitObject.sprite_height * .5 * cos(radAngle)));

		var angle = radtodeg(arctan2(hitObject.sprite_height * .5, hitObject.sprite_width * .5));
		var distance = sqrt(sqr(hitObject.sprite_width * .5) + sqr(hitObject.sprite_height * .5));
		
		var corners = [centerX + lengthdir_x(distance, hitObject.image_angle + angle),
					   centerY + lengthdir_y(distance, hitObject.image_angle + angle),
					   centerX + lengthdir_x(distance, hitObject.image_angle + 180 - angle),
					   centerY + lengthdir_y(distance, hitObject.image_angle + 180 - angle),
					   centerX + lengthdir_x(distance, hitObject.image_angle - angle),
					   centerY + lengthdir_y(distance, hitObject.image_angle - angle),
					   centerX + lengthdir_x(distance, hitObject.image_angle - 180 + angle),
					   centerY + lengthdir_y(distance, hitObject.image_angle - 180 + angle)];
					   
		var distanceToLines = ds_list_create();
		ds_list_add(distanceToLines, 
					abs((corners[3] - corners[7]) * currentX - (corners[2] - corners[6]) * currentY + (corners[2] * corners[7]) - (corners[3] * corners[6])) / (sqrt(sqr(corners[3] - corners[7]) + sqr(corners[2] - corners[6]))),
					abs((corners[7] - corners[5]) * currentX - (corners[6] - corners[4]) * currentY + (corners[6] * corners[5]) - (corners[7] * corners[4])) / (sqrt(sqr(corners[7] - corners[5]) + sqr(corners[6] - corners[4]))),
					abs((corners[1] - corners[5]) * currentX - (corners[0] - corners[4]) * currentY + (corners[0] * corners[5]) - (corners[1] * corners[4])) / (sqrt(sqr(corners[1] - corners[5]) + sqr(corners[0] - corners[4]))),
					abs((corners[1] - corners[3]) * currentX - (corners[0] - corners[2]) * currentY + (corners[0] * corners[3]) - (corners[1] * corners[2])) / (sqrt(sqr(corners[1] - corners[3]) + sqr(corners[0] - corners[2]))));
		
		var lowest = 0;
		for(var i = 1; i < ds_list_size(distanceToLines); i ++)
		{
			if(distanceToLines[| i] < distanceToLines[| lowest])
				lowest = i;
		}
		
				 
		var normalX = lowest % 2 == 0 ? lowest - 1 : 0;
		var normalY = lowest % 2 == 1 ? lowest - 2 : 0;
		

		
		var normal = radtodeg(arctan2(normalY, normalX));
		normal += hitObject.image_angle;
		ds_map_replace(map, "reflectionAngle", normal - (rayDirection - normal) + 180);
		ds_map_replace(map, "normal", normal);
		ds_map_replace(map, "distance", point_distance(startPosition[0], 
													   startPosition[1],
													   currentX,
													   currentY));
		return map;
	}
}
return map;
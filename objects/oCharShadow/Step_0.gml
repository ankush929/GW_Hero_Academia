/// @description Manage destroy
if !instance_exists(parId)	// If player doesn't exist anymore
	instance_destroy();		// destroy this shadow too
else
{
	if(ds_exists(parId.ray, ds_type_map))
	{
		var hitPosition = parId.ray[? "hitPosition"];
		yDist = parId.ray[? "distance"];
		obj = parId.ray[? "object"];
		if(array_length_1d(hitPosition) > 0)
		{
			yCol = hitPosition[1];
		}
	}
}
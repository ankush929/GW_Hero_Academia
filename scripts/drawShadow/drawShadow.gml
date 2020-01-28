/// Experimental shadow placement

if parId.z = 0					// onGround
{
	//trace("onGround");
	draw_sprite_ext(sCharShadow, image_index, x, y + z, shadow_size, shadow_size, 0, c_black, shadow_size);
}
else if parId.onPlatform and parId.z = z			// onPlatform
{
	if obj = lastColZ		// There's a bug here: obj detects more than one collision
	{
		//trace("onPlatform inside");
		draw_sprite_ext(sCharShadow, image_index, x, yCol + ((y - yCol) + z), shadow_size, shadow_size, 0, c_black, shadow_size);
	}
	else
	{
		//trace("onPlatform edge");
		draw_sprite_ext(sCharShadow, image_index, x, yCol, shadow_size, shadow_size, 0, c_black, shadow_size);
	}
}
else if parId.onPlatform and parId.z != z		// Jump onPlatforms
{
	if obj = lastColZ
	{
		//trace("Jump onPlatforms same than before");
		draw_sprite_ext(sCharShadow, image_index, x, y + z, shadow_size, shadow_size, 0, c_black, shadow_size);
	}
	else
	{
		//trace("Jump onPlatforms new");
		//draw_sprite_ext(sCharShadow, image_index, x, yCol + ((y - yCol) + z), shadow_size, shadow_size, 0, c_black, shadow_size);
	}
}
else							// Jump onGround
{
	//trace("Jump onGround");
	draw_sprite_ext(sCharShadow, image_index, x, y + z, shadow_size, shadow_size, 0, c_black, shadow_size);
}
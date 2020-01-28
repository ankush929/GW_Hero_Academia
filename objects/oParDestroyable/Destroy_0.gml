/// @description Create item
// If an item was set for the object, create it before destroy its parent
if item != ""
{
	switch (item)
	{
		case "Heart":
			var objItem = asset_get_index("oItem" + item);
			instance_create_depth(x + sprite_width/2, y + sprite_height, depth, objItem);
		break;
		case "Bar":
			var objItem = asset_get_index("oItem" + item);
			instance_create_depth(x + sprite_width/2, y + sprite_height, depth, objItem);
		break;
		case "Knife":
			var objItem = asset_get_index("oItem" + item);
			instance_create_depth(x + sprite_width/2, y + sprite_height, depth, objItem);
		break;
	}
}
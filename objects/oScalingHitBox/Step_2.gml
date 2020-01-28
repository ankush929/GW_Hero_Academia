/// @description Updates

// Destroy if Player instance doesn't exists
if !instance_exists(parentId)
	instance_destroy();		

if image_xscale >= endXscale
	instance_destroy();
/// @description Manage destroy
if destroy
{
	if instance_exists(collisionBox)
	{
		with(collisionBox)
			instance_destroy();		// We destroy de collision box...
	}
	instance_destroy();				// ...and the object itself
}

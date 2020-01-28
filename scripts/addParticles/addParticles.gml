

for (i = 0; i <= argument[0]; i++)
{
	myParticle = instance_create_depth(argument[1] + irandom_range(-5,5), argument[2] + irandom_range(-5,5), argument[8], oParticles);
	myParticle.vh = argument[3];
	myParticle.vv = argument[4];
	myParticle.size = argument[5];
	myParticle.color = argument[6];
	myParticle.alpha = argument[7];
	myParticle.alarm[0] = argument[9];
	myParticle.decrease = argument[10];
	myParticle.sprite_index = argument[11];
	myParticle.image_index = argument[12];
	myParticle.grav = argument[13];
	myParticle.rotate = argument[14];
}
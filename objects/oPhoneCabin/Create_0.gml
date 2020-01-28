/// @description Init properties

// Inherit the parent event
event_inherited();

randomize();

resistance = 3;
image_speed = 0;

// Each platform object has its own collision box...
// ...and it is a slightly wider than the object width
// Don't mislead with the object's hit box! its hitbox is defined by its sprite. Collision box is for player collisions and (maybe) platforms
size_margin = 8;
z = 0;
height = sprite_height - 16;
collisionBox = 0;


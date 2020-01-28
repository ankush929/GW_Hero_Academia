/// @description Draw Lives Left
// You can write your code in this editor
	dispLives = global.playerLives

if(global.playerLives==0)
{
	global.gameOver = true;
}
for(i=0;i<dispLives;i++)
{
	if(global.gameOver = false)
	{
		draw_sprite(sPlayerLife,1,400 + (i*25),70);
	}
}


/// @description draw block swapping
draw_self();

// Draw the block the player is holding
if(movingTile) {
	// Draw the tile we're moving
	draw_sprite(spr_GrassBlock, 0, x - 2, y - 8);
	
	// And draw a placement radius circle
	draw_set_color(c_white);
	draw_circle(floor(x), floor(y) - (sprite_get_height(sprite_index) / 2), currentRadius, true);
}

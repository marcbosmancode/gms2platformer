/// @description draw block swapping
draw_sprite_ext(sprite_index, image_index, floor(x), ceil(y), spriteDirection, image_yscale, image_angle, image_blend, image_alpha);

// Draw sweat if cannot swap anymore tiles
if(remainingTileSwaps < 1) {
	draw_sprite_ext(spr_Sweat, 0, floor(x), ceil(y), spriteDirection, image_yscale, image_angle, image_blend, image_alpha);
}

// Draw the block the player is holding
if(movingTile) {
	// Draw the tile we're moving
	draw_sprite_ext(spr_MiniBlock, 0, floor(x), ceil(y), spriteDirection, image_yscale, image_angle, image_blend, image_alpha);
	
	// And draw a placement radius circle
	draw_set_color(c_white);
	draw_circle(floor(x), ceil(y) - (sprite_get_height(sprite_index) / 2), currentRadius, true);
}

/// @description draw tile cursor
if(!instance_exists(global.player)) exit;

if(global.player.movingTile) {
	// Check if mouse is within placement range
	if(global.player.mouseDistance > global.player.radius) exit;
	
	var _color = c_white;
	if(hoveringPlayer) _color = c_red;
	if(hoveringTile) _color = c_red;
	// If so draw the tile placement cursor
	draw_sprite_ext(spr_TileCursor, 0, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE, image_xscale, image_yscale, image_angle, _color, image_alpha);
}

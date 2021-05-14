/// @description tile placement
if(!instance_exists(global.player)) exit;

var _result = false;

var _layId = layer_get_id("Collisions");
var _mapId = layer_tilemap_get_id(_layId);

// Don't do anything if outside of block placement range or hovering player
if(global.player.mouseDistance > global.player.radius) exit;
if(hoveringPlayer) exit;

// Select a tile to remove and temporarily store it in a variable
if(!global.player.movingTile) {
	// Don't take a tile if there are no tile swaps remaining
	if(global.player.remainingTileSwaps <= 0) exit;
	
	// Don't do anything if not hovering a tile
	if(!hoveringTile) exit;

	// Remove collision
	tilemap_set_at_pixel(_mapId, 0, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	
	// Remove and store the actual tile
	_layId = layer_get_id("Main_Tileset");
	_mapId = layer_tilemap_get_id(_layId);
	global.player.savedTile = tilemap_get_at_pixel(_mapId, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	tilemap_set_at_pixel(_mapId, 0, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	
	// Update surrounding tiles
	UpdateSurroundingTiles(hoveredTile);
	
	// Remove vegetation on top
	_layId = layer_get_id("Top_Tileset");
	_mapId = layer_tilemap_get_id(_layId);
	tilemap_set_at_pixel(_mapId, 0, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE - TILE_SIZE);
	
	// Make radius circle on player
	global.player.currentRadius = 0;
	
	global.player.remainingTileSwaps--;
	_result = true;
}

// Place the stored tile in the map
if(global.player.movingTile) {
	// If it's a filled tile do nothing
	var _collisionTile = tilemap_get_at_pixel(_mapId, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	if(_collisionTile != 0) exit;
	
	// Place the collision
	tilemap_set_at_pixel(_mapId, 1, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	
	// And also place the tile
	_layId = layer_get_id("Main_Tileset");
	_mapId = layer_tilemap_get_id(_layId);
	tilemap_set_at_pixel(_mapId, Autotile(hoveredTile, "Collisions"), hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	
	// Update surrounding tiles
	UpdateSurroundingTiles(hoveredTile);
	
	// Remove vegetation inside the placed block
	_layId = layer_get_id("Top_Tileset");
	_mapId = layer_tilemap_get_id(_layId);
	tilemap_set_at_pixel(_mapId, 0, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);
	
	global.player.movingTile = false;
}

if(_result) global.player.movingTile = true;

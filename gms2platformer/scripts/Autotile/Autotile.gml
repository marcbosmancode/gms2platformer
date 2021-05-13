/// @function Autotile(tilePosition, tileMap);
/// @param {real} tilePosition Vector2 of the tile position
/// @param {string} tileMap the tilemap to check surrounding tiles
function Autotile(_tilePosition, _tileMap){
	var _result = 1;
	
	var _layId = layer_get_id(_tileMap);
	var _mapId = layer_tilemap_get_id(_layId);
	
	// Check tiles around the given tiles position
	var _currentTile;
	
	// Up
	_currentTile = tilemap_get_at_pixel(_mapId, global.cursor.hoveredTile.x * TILE_SIZE, (global.cursor.hoveredTile.y - 1) * TILE_SIZE);
	if(_currentTile != 0) _result += 1;
	
	// Left
	_currentTile = tilemap_get_at_pixel(_mapId, (global.cursor.hoveredTile.x - 1) * TILE_SIZE, global.cursor.hoveredTile.y * TILE_SIZE);
	if(_currentTile != 0) _result += 2;
	
	// Right
	_currentTile = tilemap_get_at_pixel(_mapId, (global.cursor.hoveredTile.x + 1) * TILE_SIZE, global.cursor.hoveredTile.y * TILE_SIZE);
	if(_currentTile != 0) _result += 4;
	
	// Down
	_currentTile = tilemap_get_at_pixel(_mapId, global.cursor.hoveredTile.x * TILE_SIZE, (global.cursor.hoveredTile.y + 1) * TILE_SIZE);
	if(_currentTile != 0) _result += 8;
	
	return _result;
}

/// @function AutotileMap()
function AutotileMap(){
	var _layId = layer_get_id("Main_Tileset");
	var _mapId = layer_tilemap_get_id(_layId);
	
    var _horTiles = ceil(room_width / TILE_SIZE);
    var _verTiles = ceil(room_height / TILE_SIZE);

    for(var i = 0; i < _verTiles; i++) {
        for (var ii = 0; ii < _horTiles; ii++) {
			
            var _result = Autotile(new Vector2(ii, i), "Collisions");
			if(tilemap_get_at_pixel(_mapId, ii * TILE_SIZE, i * TILE_SIZE != 0)) {
				tilemap_set_at_pixel(_mapId, _result, ii * TILE_SIZE, i * TILE_SIZE);
			}
        }
    }
}
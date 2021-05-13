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
	_currentTile = tilemap_get_at_pixel(_mapId, _tilePosition.x * TILE_SIZE, (_tilePosition.y - 1) * TILE_SIZE);
	if(_currentTile != 0) _result += 1;
	
	// Left
	_currentTile = tilemap_get_at_pixel(_mapId, (_tilePosition.x - 1) * TILE_SIZE, _tilePosition.y * TILE_SIZE);
	if(_currentTile != 0) _result += 2;
	
	// Right
	_currentTile = tilemap_get_at_pixel(_mapId, (_tilePosition.x + 1) * TILE_SIZE, _tilePosition.y * TILE_SIZE);
	if(_currentTile != 0) _result += 4;
	
	// Down
	_currentTile = tilemap_get_at_pixel(_mapId, _tilePosition.x * TILE_SIZE, (_tilePosition.y + 1) * TILE_SIZE);
	if(_currentTile != 0) _result += 8;
	
	return _result;
}

/// @function AutotileMap()
function AutotileMap(){
	var _layId = layer_get_id("Main_Tileset");
	var _mapId = layer_tilemap_get_id(_layId);
	
	var _layIdCol = layer_get_id("Collisions");
	var _mapIdCol = layer_tilemap_get_id(_layIdCol);
	
    var _horTiles = ceil(room_width / TILE_SIZE);
    var _verTiles = ceil(room_height / TILE_SIZE);
	
	// Loop through all the tiles in the map
    for(var i = 0; i < _verTiles; i++) {
        for (var ii = 0; ii < _horTiles; ii++) {
			// Autotile the current tile
            var _result = Autotile(new Vector2(ii, i), "Collisions");
			tilemap_set_at_pixel(_mapId, _result, ii * TILE_SIZE, i * TILE_SIZE);
			
			// If the tile has no collision make it empty
			if(tilemap_get_at_pixel(_mapIdCol, ii * TILE_SIZE, i * TILE_SIZE) == 0) {
				tilemap_set_at_pixel(_mapId, 0, ii * TILE_SIZE, i * TILE_SIZE);
			}
        }
    }
}

/// @function UpdateSurroundingTiles(tilePosition)
/// @param {pointer} tilePosition Vector2 of the tile position
function UpdateSurroundingTiles(_tilePosition) {
	var _layId = layer_get_id("Main_Tileset");
	var _mapId = layer_tilemap_get_id(_layId);
	
	// Up
	var _otherTilePosition = new Vector2(_tilePosition.x, _tilePosition.y - 1);
	
	var _tile = Autotile(_otherTilePosition, "Collisions");
	var _currentTile = tilemap_get_at_pixel(_mapId, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	if(_currentTile != 0) {
		tilemap_set_at_pixel(_mapId, _tile, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	}
	
	// Left
	_otherTilePosition = new Vector2(_tilePosition.x - 1, _tilePosition.y);
	
	var _tile = Autotile(_otherTilePosition, "Collisions");
	var _currentTile = tilemap_get_at_pixel(_mapId, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	if(_currentTile != 0) {
		tilemap_set_at_pixel(_mapId, _tile, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	}
	
	// Right
	var _otherTilePosition = new Vector2(_tilePosition.x + 1, _tilePosition.y);
	
	var _tile = Autotile(_otherTilePosition, "Collisions");
	var _currentTile = tilemap_get_at_pixel(_mapId, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	if(_currentTile != 0) {
		tilemap_set_at_pixel(_mapId, _tile, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	}
	
	// Down
	var _otherTilePosition = new Vector2(_tilePosition.x, _tilePosition.y + 1);
	
	var _tile = Autotile(_otherTilePosition, "Collisions");
	var _currentTile = tilemap_get_at_pixel(_mapId, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	if(_currentTile != 0) {
		tilemap_set_at_pixel(_mapId, _tile, _otherTilePosition.x * TILE_SIZE, _otherTilePosition.y * TILE_SIZE);
	}
}
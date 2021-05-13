/// @description update position
global.guiMouseX = device_mouse_x_to_gui(0);
global.guiMouseY = device_mouse_y_to_gui(0);

// Get the position of the currently hovered tile
var _camX = global.camera.x - global.camera.camWidthHalf;
var _camY = global.camera.y - global.camera.camHeightHalf;

// Store the mouse position too
global.mouseX = global.guiMouseX + _camX;
global.mouseY = global.guiMouseY + _camY;

hoveredTile = new Vector2(floor((global.guiMouseX + _camX) / TILE_SIZE), floor((global.guiMouseY + _camY) / TILE_SIZE));

// Check if the mouse is hovering the player
var _playerHorTile = floor(global.player.x / TILE_SIZE);
var _playerVerTile = floor(global.player.y / TILE_SIZE);
	
var _horHover = false;
var _verHover = false;
	
if(_playerHorTile == hoveredTile.x) _horHover = true;
if(_playerVerTile == hoveredTile.y) _verHover = true;

hoveringPlayer = false;
if(_horHover and _verHover) hoveringPlayer = true;

// Check if mouse is hovering a tile
var _layId = layer_get_id("Collisions");
var _mapId = layer_tilemap_get_id(_layId);
var _collisionTile = tilemap_get_at_pixel(_mapId, hoveredTile.x * TILE_SIZE, hoveredTile.y * TILE_SIZE);

hoveringTile = false;
if(_collisionTile != 0) hoveringTile = true;

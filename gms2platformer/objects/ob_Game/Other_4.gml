/// @description get collisionmap

layer_set_visible("Collisions", false);

// Get collisionmap for the player
global.collisionMap = layer_tilemap_get_id(layer_get_id("Collisions"));

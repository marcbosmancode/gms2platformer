/// @description game initialization

// Randomize seed
randomize();

// Make application surface the same size as the camera
surface_resize(application_surface, RES_WIDTH, RES_HEIGHT);

#region global variables

// Setup particle system
global.partSystem = part_system_create_layer("Instances", true);

// Collisionmap tile layer
global.collisionMap = layer_tilemap_get_id(layer_get_id("Collisions"));

#endregion

#region other manager objects

global.cursor = instance_create_layer(0, 0, "Instances", ob_Cursor);
global.camera = instance_create_layer(0, 0, "Instances", ob_Camera);
global.messages = instance_create_layer(0, 0, "Instances", ob_Messages);
global.timer = instance_create_layer(0, 0, "Instances", ob_Timer);
global.player = noone;

#endregion

room_goto(STARTING_ROOM);

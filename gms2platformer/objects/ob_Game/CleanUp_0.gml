/// @description prevent mem leak

// Destroy particle system
part_system_destroy(global.partSystem);

// Destroy other manager objects
instance_destroy(global.cursor);
instance_destroy(global.camera);

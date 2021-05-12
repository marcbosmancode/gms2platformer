// Everything outside of a function loads on game startup

#region particle types

// Basic particle
var _p = part_type_create();
part_type_shape(_p, pt_shape_disk);
part_type_size(_p, 0.1, 0.2, 0, 0);
part_type_life(_p, 20, 24);
part_type_alpha2(_p, 1, 0);
part_type_speed(_p, 0.5, 0.6, 0, 0);
part_type_direction(_p, 180, 360, 0, 0);

global.partBasic = _p;

#endregion

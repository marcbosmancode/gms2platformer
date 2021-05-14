/// @description Show interface
draw_set_font(fo_Pixelfont);
draw_set_halign(fa_left);
draw_sprite(spr_UISweat, 0, 4, 8);
draw_text(12, 4, "x " + string(remainingTileSwaps));

draw_sprite(spr_Fly, 0, -1, 20);
draw_text(12, 20, "x " + string(instance_number(ob_Fly)));

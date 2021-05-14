/// @description draw message

// Draw message in the middle of the screen
draw_set_font(fo_Pixelfont);
draw_set_color(c_white);

draw_set_alpha(messageAlpha);
draw_set_halign(fa_center);

draw_text(camera_get_view_width(view_camera[0]) / 2, camera_get_view_height(view_camera[0]) / 2 + messageHeight, currentMessage);

// Revert back draw variables
draw_set_alpha(1);
draw_set_halign(fa_left);

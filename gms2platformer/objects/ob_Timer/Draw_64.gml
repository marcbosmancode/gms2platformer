/// @description draw timer
draw_set_color(c_white);
draw_set_halign(fa_right);
draw_set_font(fo_Pixelfont);

// Draw minutes and seconds
var _minutes0s = "";
var _seconds0s = "";

if string_length(string(minutes)) = 1 {
	_minutes0s = "0";
}
if string_length(string(seconds)) = 1 {
	_seconds0s = "0";
}

draw_text(RES_WIDTH - 16, 4, _minutes0s + string_format(minutes, 1, 0) + ":" + _seconds0s + string_format(seconds, 1, 0));

// Draw milliseconds
draw_set_font(fo_SmallPixelFont);
draw_set_halign(fa_left);
draw_text(RES_WIDTH - 15, 7, string_format(timer * 16.667, 1, 0));

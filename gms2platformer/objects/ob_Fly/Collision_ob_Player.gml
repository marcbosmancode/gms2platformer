/// @description clear room
if(room != room_last) {
	room_goto_next();
} else {
	show_message("You cleared the game!");
	game_restart();
}

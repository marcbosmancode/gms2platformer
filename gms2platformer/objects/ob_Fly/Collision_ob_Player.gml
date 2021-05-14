/// @description clear room

if(instance_number(ob_Fly) > 1) {
	instance_destroy();
	exit;
}

if(room != room_last) {
	room_goto_next();
} else {
	show_message("You cleared the game!");
	game_restart();
}

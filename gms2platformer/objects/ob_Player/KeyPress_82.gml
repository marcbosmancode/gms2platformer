/// @description restart game

if(clearedGame or room == STARTING_ROOM) {
	game_restart();
} else {
	room_restart();
}

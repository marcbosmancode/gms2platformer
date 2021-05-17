/// @description clear room

if(instance_number(ob_Fly) > 1) {
	instance_destroy();
	exit;
}

if(room != room_last) {
	room_goto_next();
} else {
	ShowMessage("You cleared the tutorial!\nPress R to go back to the main menu");
	global.player.clearedGame = true;
	global.timer.timerRunning = false;
	instance_destroy();
}

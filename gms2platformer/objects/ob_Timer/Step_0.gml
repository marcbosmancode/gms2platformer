/// @description increase timer
if(!timerRunning) exit;

timer++;

// Increase the seconds and minutes
if(timer > FRAME_RATE) {
	timer = 0;
	seconds++;
	
	if(seconds > 60) {
		seconds = 0;
		minutes++;
	}
}

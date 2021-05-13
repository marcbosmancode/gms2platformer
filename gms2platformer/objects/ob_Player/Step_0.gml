/// @description state machine

KeyInput();
script_execute(state);

// Smoothly increase the circle radius
if(currentRadius < radius) {
	currentRadius += ceil((radius - currentRadius) / 15);
}

// Get the distance from the mouse
mouseDistance = floor(point_distance(floor(x), floor(y) - (sprite_get_height(sprite_index) / 2), global.mouseX, global.mouseY));

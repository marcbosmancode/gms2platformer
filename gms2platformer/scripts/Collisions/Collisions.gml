/// @function HorizontalCollision()
function HorizontalCollision() {
	var _collision = false;

	// Check for collision tiles
	if(tilemap_get_at_pixel(global.collisionMap, x + hSpeed, y)) {
		while(!tilemap_get_at_pixel(global.collisionMap, x + sign(hSpeed), y)) x += sign(hSpeed);
		_collision = true;
	}

	// Check for room borders
	if(x + hSpeed > room_width - 1) {
		x = room_width - 1;
		_collision = true;
	}
	// Left side too
	if(x + hSpeed < 0) {
		x = 0;
		_collision = true;
	}

	if(_collision) hSpeed = 0;

	return _collision;
}

/// @function VerticalCollision()
function VerticalCollision() {
	var _collision = false;

	// Check for collision tiles
	if(tilemap_get_at_pixel(global.collisionMap, x, y + vSpeed)){
		while(!tilemap_get_at_pixel(global.collisionMap, x, y + sign(vSpeed))) y += sign(vSpeed);
		_collision = true;
	}

	// Check for bottom room border
	if(y + vSpeed > room_height){
		y = room_height;
		_collision = true;
	}

	if(_collision) vSpeed = 0;

	return _collision;
}

/// @function touchingGround()
function touchingGround() {
	return tilemap_get_at_pixel(global.collisionMap, x, y + 1);
}
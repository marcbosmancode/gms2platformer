/// @description move camera

// Set target position based on the position of the following object
if (instance_exists(follow)){
	targetX = follow.x;
	targetY = follow.y;
}

// Smoothly move towards the target position
x += (targetX - x) / 15;
y += (targetY - y) / 15;

// Prevent the camera from moving half pixels
x = round(x);
y = round(y);

// Limit camera movement
if(global.limitedView){
	x = clamp(x, camWidthHalf, room_width - camWidthHalf);
	y = clamp(y, camHeightHalf, room_height - camHeightHalf);
}

// Screenshake effect
x += random_range(-shakeRemain, shakeRemain);
y += random_range(-shakeRemain, shakeRemain);
shakeRemain = max(0, shakeRemain - ((1 / shakeLength) * shakeMagnitude));

// Set the position of the actual camera
camera_set_view_pos(cam, x - camWidthHalf, y - camHeightHalf);

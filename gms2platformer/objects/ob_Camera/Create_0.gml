/// @description create camera

// If the camera is limited within room borders
global.limitedView = true;

cam = view_camera[0];

// Tracking variables
follow = ob_Player;

targetX = 0;
targetY = 0;

// Calculations for limiting camera movement
camWidthHalf = camera_get_view_width(cam) * 0.5;
camHeightHalf = camera_get_view_height(cam) * 0.5;

// Screenshake effect
shakeLength = 0;
shakeMagnitude = 0;
shakeRemain = 0;

/// @description init

// Make cursor be on top of everything
depth -= 10000;

// Get the mouse position relative to the GUI layer
global.guiMouseX = device_mouse_x_to_gui(0);
global.guiMouseY = device_mouse_y_to_gui(0);

// Current cursor showing
currentCursor = 0;

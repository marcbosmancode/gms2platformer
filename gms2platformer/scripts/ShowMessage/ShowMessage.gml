/// @function ShowMessage(message)
/// @param {string} message The message to show in the middle of the screen
function ShowMessage(_message) {
	with(global.messages) {
		currentMessage = _message;
		messageHeight = 0;
		messageAlpha = 1;
	}
}
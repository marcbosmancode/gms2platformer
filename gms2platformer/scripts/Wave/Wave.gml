/// @function Wave(from, to, duration, offset);
/// @param {real} from Description
/// @param {real} to Description
/// @param {real} duration Description
/// @param {real} offset Description
function Wave(_from, _to, _duration, _offset){
	// Returns a value that will wave back and forth between [from-to] over [duration] seconds
	// Examples
	//     image_angle = Wave(-45,45,1,0)  -> rock back and forth 90 degrees in a second
	//     x = Wave(-10,10,0.25,0)         -> move left and right quickly
	
	var _a4 = (_to - _from) * 0.5;
	return _from + _a4 + sin((((current_time * 0.001) + _duration * _offset) / _duration) * (pi*2)) * _a4;
}

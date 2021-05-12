/// @function KeyInput();
function KeyInput(){
	leftKey = keyboard_check(vk_left) || keyboard_check(ord("A"));
	rightKey = keyboard_check(vk_right)  || keyboard_check(ord("D"));
	jumpKey = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
}
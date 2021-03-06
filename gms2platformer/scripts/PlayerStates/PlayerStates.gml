/// @function pMovementState();
function pMovementState() {
	var _moveDir = rightKey - leftKey;
	var _touchingGround = touchingGround();
	
	if(_touchingGround) {
		jumpsRemaining = maxJumps;
	}
	
	// Add speed based on keys pressed
	hSpeed += _moveDir * fric;
	
	// Slow down when not pressing keys
	if(_moveDir == 0) {
		hSpeed -= sign(hSpeed) * fric;
	}
	
	// Cap movement speed
	hSpeed = clamp(hSpeed, -maxSpeed, maxSpeed);

	// Jumping and falling
	if(jumpsRemaining > 0 and jumpKey) {
		vSpeed = -jumpSpeed;
		jumpsRemaining--;
		
		// Create cloud particles when jumping midair
		if(!_touchingGround) {
			part_particles_create(global.partSystem, x, y, global.partBasic, 2);
		}
	}
	
	if(vSpeed < fallSpeed) vSpeed += grav;
	
	// Check for collisions and move
	if(!HorizontalCollision()) x += hSpeed;
	if(!VerticalCollision()) y += vSpeed;
	
	// Player animating
	if(_touchingGround and hSpeed == 0) sprite_index = spriteIdle;
	if(_touchingGround and hSpeed != 0) sprite_index = spriteWalk;
	if(!_touchingGround) sprite_index = spriteJump; 
	
	if(leftKey) spriteDirection = -1;
	if(rightKey) spriteDirection = 1;
}
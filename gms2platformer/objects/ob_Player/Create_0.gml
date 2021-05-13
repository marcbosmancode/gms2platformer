/// @description init
// Make everything able to reference the player
global.player = id;

// State machine
state = pMovementState;

// Movement engine variables
maxSpeed = 2;
hSpeed = 0;
vSpeed = 0;
fric = .25;

jumpSpeed = 4.5;
fallSpeed = 5;
grav = .25;

maxJumps = 2;
jumpsRemaining = maxJumps;

// Block placement range
radius = 5 * TILE_SIZE;
// To increase the circle in size when it pops in
currentRadius = 0;

// Mouse distance from the player
mouseDistance = 0;

// Currently holding tile
savedTile = -1;
// If you are currently moving a tile
movingTile = false;
// Tile swaps remaining
remainingTileSwaps = 1;

// Player animation sprites
spriteIdle = spr_Player;
spriteWalk = spr_PlayerWalk;
spriteJump = spr_PlayerJump;

spriteDirection = 1;

/// @description Show messages
if(global.messages.messageAlpha < 0) {
	switch (messagesShown) {
		case 0:
			ShowMessage("Welcome to Frog Swap\nIt looks like Froggie needs some help\ncatching the fly on the other side");
			messagesShown++;
			break;
		case 1:
			ShowMessage("Use your left mouse-click to pickup a block\nand place it across the gap");
			messagesShown++;
			break;
		default:
			ShowMessage("Press R to try again if you couldn't catch the fly");
	}
}

if(global.player.movingTile and !shownTileMoveMessage) {
	ShowMessage("The circle indicates how far away you can place your block\ngive it a try and make sure you can reach the fly");
	shownTileMoveMessage = true;
	messagesShown = 2;
}

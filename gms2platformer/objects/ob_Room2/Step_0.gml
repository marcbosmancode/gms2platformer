/// @description Show messages
if(global.messages.messageAlpha < 0) {
	switch (messagesShown) {
		case 0:
			ShowMessage("Well done\nIn the left top corner you will see a sweat drop");
			messagesShown++;
			break;
		case 1:
			ShowMessage("It indicates how many blocks you can pickup each level");
			messagesShown++;
			break;
		case 2:
			ShowMessage("It seems like you can't reach the fly from down here\ntry to jump twice and reach the fly");
			messagesShown++;
			break;
		default:
			ShowMessage("Try double jumping to reach the top");
	}
}

/// @description Show messages
if(global.messages.messageAlpha < 0) {
	switch (messagesShown) {
		case 0:
			ShowMessage("As your final challenge you have to find two flies");
			messagesShown++;
			break;
		case 1:
			ShowMessage("Remaining flies to collect is shown top left"); 
			messagesShown++;
			break;
		case 2:
			ShowMessage("Try to use all the skills you just learned"); 
			messagesShown++;
			break;
		default:
			ShowMessage("If you couldn't reach the flies press R to restart");
	}
}

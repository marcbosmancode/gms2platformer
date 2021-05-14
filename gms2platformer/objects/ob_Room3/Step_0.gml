/// @description Show messages
if(global.messages.messageAlpha < 0) {
	switch (messagesShown) {
		case 0:
			ShowMessage("Well done\nTry and reach the top without removing a block");
			messagesShown++;
			break;
		case 1:
			ShowMessage("Now try to reach your goal by moving trough the wall"); 
			messagesShown++;
			break;
		default:
			ShowMessage("If you couldn't reach the fly press R to restart");
	}
}

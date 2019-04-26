trigger MyDummyTrigger on Account (before insert) {
	
	System.debug('This is for trigger testing');
    
}
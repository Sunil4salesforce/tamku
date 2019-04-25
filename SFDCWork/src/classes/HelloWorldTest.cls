@isTest
private class HelloWorldTest {
	
	@isTest static void updateLead() {
		Lead myLead = new Lead();
		myLead.firstname= 'david';
		myLead.lastname = 'lui';
		myLead.company  = 'Thomson Reuters';
		insert myLead;

		myLead.company  = 'Google';
		update myLead;
	}

}
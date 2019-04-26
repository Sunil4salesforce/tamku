@isTest
private class CountActiveContactsTest {
	
	@isTest static void updateContact() {
        Account acc 	= new Account();
        acc.Name		= 'TestAccountforContacts';
        acc.Industry 	= 'Hospitality';
        insert acc;
        
        Contact con 	= new Contact();
        con.FirstName 	='TestFirstName';
        con.LastName 	= 'TestLastname';
        con.Active__c	= false;
        con.AccountId 	= acc.Id;
        insert con;
        
        con.Active__c =true;
        update con;
        
        Account updatedAccount = [Select Id,active_contacts_count__c from Account where Id=:acc.Id LIMIT 1];
        System.assertEquals(1, updatedAccount.active_contacts_count__c);
	}
    
    @isTest static void deleteContact() {
        Account acc 	= new Account();
        acc.Name		= 'TestAccountforContacts';
        acc.Industry 	= 'Hospitality';
        insert acc;
        
        Contact con 	= new Contact();
        con.FirstName 	='TestFirstName01';
        con.LastName 	= 'TestLastname01';
        con.Active__c	= true;
        con.AccountId 	= acc.Id;
        insert con;
        
        Contact conn 	= new Contact();
        conn.FirstName 	='TestFirstName01';
        conn.LastName 	= 'TestLastname01';
        conn.Active__c	= true;
        conn.AccountId 	= acc.Id;
        insert conn;
        
        delete con;
        
        Account updatedAccount = [Select Id,active_contacts_count__c from Account where Id=:acc.Id LIMIT 1];
        System.assertEquals(1, updatedAccount.active_contacts_count__c);
	}

}
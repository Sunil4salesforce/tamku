trigger CountActiveContacts on Contact (after insert,before delete,after undelete,before update) {
    
    List<Account> updatedAccount = new List<Account>();
    
    for(Contact con :trigger.new){
        
        List<Contact> totalContact   =[Select Id,AccountId from Contact where AccountId=:con.AccountId and active__c=true];
        Account acc                  =[Select Id from Account where Id =:con.AccountId LIMIT 1];
        acc.Active_Contacts_Count__c =totalContact.size();
        updatedAccount.add(acc);
        System.debug('Total active contacts found are '+ acc.Active_Contacts_Count__c);
        
    }
    
    update updatedAccount;

}
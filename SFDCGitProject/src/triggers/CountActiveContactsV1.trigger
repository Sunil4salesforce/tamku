trigger CountActiveContactsV1 on Contact (after update,after insert,after delete,after undelete) {
    Set<Id> parentIdsSet 				= new Set<Id>();
    List<Account> AccountListToUpdate 	= new List<Account>();
    
    if(trigger.isInsert || trigger.IsUndelete || trigger.IsUpdate){
        for(Contact con : trigger.new){
            if(con.AccountId != null){
            parentIdsSet.add(con.AccountId);
            System.debug('Before trigger contact List'+parentIdsSet);
            }
        }
    }
    
    if(trigger.isDelete){
        for(Contact con : trigger.old){
            if(con.AccountId != null){
            parentIdsSet.add(con.AccountId);
            System.debug('Delete trigger contact List'+parentIdsSet); 
            }
        }
    }
    
    List<Account> AccountsWithContacts = [Select Id,(Select Id from Contacts where active__c=true) from Account where Id IN :parentIdsSet];
    for(Account AccountsWithContact : AccountsWithContacts ){
        AccountsWithContact.Active_Contacts_Count__c = AccountsWithContact.Contacts.size();
        AccountListToUpdate.add(AccountsWithContact);
    }
   update AccountListToUpdate;
}
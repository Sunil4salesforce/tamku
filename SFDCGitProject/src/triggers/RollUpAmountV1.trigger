trigger RollUpAmountV1 on Contact (after update,after insert) {
    Decimal totalAmountX=0;
    Decimal totalAmountY=0;
    Set<Id> parentIds = new Set<Id>();
    List<Account> updatedAccount = new List<Account>();
    for(Contact con :trigger.new){
        
        if(con.AccountId != null){
            parentIds.add(con.AccountId);
        }
    }
    
    List<Account> accountsWithContacts =[Select Id,(Select Id,Amount_X__c,Amount_Y__c from Contacts)from Account where Id IN :parentIds];
    for(Account acc :accountsWithContacts){
        for(Contact con : acc.Contacts){
            if(con.Amount_X__c !=null){
               totalAmountX = totalAmountX +con.Amount_X__c; 
            }
            if(con.Amount_Y__c !=null){
               totalAmountY = totalAmountY +con.Amount_Y__c; 
            }
        }
        acc.Rollup_Amount_X__c=totalAmountX;
        acc.Rollup_Amount_Y__c=totalAmountY;
        updatedAccount.add(acc);
    }
    
    upsert updatedAccount;

}
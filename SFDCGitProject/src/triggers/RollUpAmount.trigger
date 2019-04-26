trigger RollUpAmount on Contact (before update) {
    List<Account> updatedAccount = new List<Account>();
    Decimal sumTotal_x=0;
    Decimal sumTotal_y=0;
    
    for(Contact con : trigger.new){
        System.debug('Inside the trigger.new loop');
        List<Contact> myContacts = [Select Id,Name,Amount_X__c,Amount_Y__c from Contact where AccountId=:con.AccountId and Id != :con.Id];
        Account myAccount = [Select Id from Account where Id = :con.AccountId];
        
        if(con.Amount_X__c != null){
        System.debug('Amount_X__c is not null!');
            If(myContacts.size()>0){
                for(Contact myContact : myContacts){
                    if(myContact.Amount_X__c != null){
                         sumTotal_x = sumTotal_x + myContact.Amount_X__c;
                    }
                }
            }
             myAccount.Rollup_Amount_X__c=sumTotal_x + con.Amount_X__c;
             System.debug('Total Rollup_Amount_X is :'+myAccount.Rollup_Amount_X__c);
        }
        
        if(con.Amount_Y__c != null){
        System.debug('Amount_Y__c is not null!');
            If(myContacts.size()>0){
                for(Contact myContact : myContacts){
                    if(myContact.Amount_Y__c != null){
                        sumTotal_y = sumTotal_y + myContact.Amount_Y__c;
                    }
                }
            }
             myAccount.Rollup_Amount_Y__c=sumTotal_y + con.Amount_y__c;
             System.debug('Total Rollup_Amount_Y is :'+myAccount.Rollup_Amount_Y__c);
        }
        //System.debug('Total Rollup_Amount_X is :'+myAccount.Rollup_Amount_X__c + ' Total Rollup_Amount_Y is : '+myAccount.Rollup_Amount_Y__c );
        updatedAccount.add(myAccount) ;
    }
    update updatedAccount;
}
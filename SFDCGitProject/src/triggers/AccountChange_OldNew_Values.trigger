trigger AccountChange_OldNew_Values on Account (before update) {
    
    for(Account acc : trigger.new){
        
        String oldAccountNumber = trigger.oldMap.get(acc.Id).accountNumber;
        String newAccountNumber = trigger.newMap.get(acc.Id).accountNumber;
        System.debug('Conditional test going to begin');
        if(oldAccountNumber == newAccountNumber){
            
            System.debug('There is no change in the account number.');
            acc.Type = 'Others';
        }
        else{
            
            System.debug('Account number has been changed and new account number is :'+ acc.AccountNumber );
            acc.Type = 'Prospect';
        }
        
        
        
    }

}
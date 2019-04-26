trigger DonotAllowSLAChangeSWithOpenCases on Account (before update) {
    
    List<Account> accountWithCases = [SELECT Id ,
                                        (Select Id 
                                         FROM Cases 
                                         where isCLosed != true 
                                         LIMIT 1)
                                        FROM Account 
                                        WHERE Id IN :trigger.new];
    
    for(Account acc : accountWithCases){
        
        String oldSLAValue      = Trigger.oldMap.get(acc.Id).SLA__c;
        String newSLAValue      = Trigger.newMap.get(acc.Id).SLA__c;
        Boolean isSLAChanged    = oldSLAValue != newSLAValue;
        Boolean hasOpenCases    = acc.Cases.size() > 0;
        System.debug('Open case found');
        
            if(isSLAChanged && hasOpenCases){
                
                Trigger.newMap.get(acc.Id).SLA__c.addError('Please dont change the SLA');
                System.debug('SLA Changed');
                
            }
        
    }

}
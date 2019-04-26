trigger ComparableOpportunity on Opportunity (after insert) {


    for (Opportunity opp : trigger.new){

        Opportunity oppWithAccountInfo = [Select Id, Account.Industry from Opportunity 
                                        WHERE Id =: opp.Id LIMIT 1];

       if(opp.Amount != null){

        decimal lowerLevelMatchingAmount= opp.Amount*0.9;
        decimal highLevelMatchingAmount= opp.Amount*1.10;
        List<Opportunity> matchingopportunities = [SELECT Id, Amount , Account.Industry ,StageName
                                           FROM Opportunity
                                           WHERE (Amount<=:highLevelMatchingAmount  and Amount >= :lowerLevelMatchingAmount)
                                                  and Account.Industry = :oppWithAccountInfo.Account.Industry
                                                  and (StageName='Closed Won' 
                                                        and CloseDate >= LAST_N_DAYS:365)
                                                  and id != :opp.id ];

        if(!matchingopportunities.isEmpty()){

            for(Opportunity matchingOpportunity :matchingopportunities){
                Comparable__c junctionObject = new Comparable__c();
                junctionObject.Base_Opportunity__c=opp.Id;
                junctionObject.Comparable_Opportunity__c=matchingOpportunity.Id;
                insert junctionObject;

       }
            }
        }
    }

}
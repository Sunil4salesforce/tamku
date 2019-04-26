trigger ContactUpdatedOpportunity on Opportunity (after insert) {


    for(Opportunity opp : trigger.new){

        Opportunity accountOfOpportunity = [SELECT AccountId,CreatedBy.Name,CloseDate,Owner.Manager.Name,Owner.Name
                                    FROM Opportunity
                                    WHERE Id = :opp.Id LIMIT 1 ];

        List<Contact> contactsOfAccountOfOpportunity = [SELECT Id , Description
                                                        FROM Contact
                                                        WHERE AccountId= :accountOfOpportunity.AccountId];

        if(!contactsOfAccountOfOpportunity.isEmpty()){

            for(Contact myCon : contactsOfAccountOfOpportunity){

                    myCon.Description= 'Matching opportunity is created by: '+accountOfOpportunity.CreatedBy.Name+'\n'
                                        +'and closed on date :' + accountOfOpportunity.CloseDate.format()
                                        +'\n Opportunity Owner name is :'+ accountOfOpportunity.Owner.Name +'\n'
                                        +'Opportunity owner Manager name : '+ accountOfOpportunity.Owner.Manager.Name + myCon.Description;
                    update myCon;
            }
        }
    }
}
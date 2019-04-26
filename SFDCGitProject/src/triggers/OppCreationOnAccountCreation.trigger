trigger OppCreationOnAccountCreation on Account (after insert) {
    
    for(Account acc : Trigger.new){
        
        Opportunity opp = new Opportunity();
        opp.Name = 'First Opp';
        opp.CloseDate = Date.today();
        opp.StageName = 'Closed Won';
		opp.AccountId = acc.Id;
        
        insert opp;
    }

}
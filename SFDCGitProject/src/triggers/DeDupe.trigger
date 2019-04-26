trigger DeDupe on Account (after insert) {

        for(Account acc : trigger.new){
        
            Case myCase = new case();
            myCase.subject = 'DeDupe Account';
            myCase.ownerId = '0057F000000p7NP';
            myCase.AccountId=acc.Id;
            insert myCase;
        }

}
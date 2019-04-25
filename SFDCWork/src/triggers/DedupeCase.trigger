trigger DedupeCase on Case (before insert) {

    //find whether a case meets with the given criteria 
    //More than 2 cases associated with the same contact on that day

    for(Case myCase : trigger.new){

        List<Case> matchingCaseOnContact =[Select Id
                                    FROM Case
                                    WHERE ContactId=:myCase.ContactId
                                    AND createdDate=:myCase.createdDate];
        List<Case> matchingCaseOnAccount =[Select Id
                                    FROM Case
                                    WHERE AccountId=:myCase.AccountId
                                    AND createdDate=:myCase.createdDate];


        if(matchingCaseOnContact.size() > 2 ||matchingCaseOnAccount.size() >3 ){

            myCase.Status='Closed';
        }


    }



}
trigger SecretInfo on Case (after insert,before update) {
    
    //List<Case> childCases= new List<Case>();
    List<Case> caseToCreate= new List<Case>();
    Set<String> keywords = new Set<String>();
    keywords.add('Credit Card');
    keywords.add('Social Security');
    keywords.add('SSN');
    keywords.add('Passport');
    String subject ='Parent case has secret information';


    for(Case myCase:trigger.new){
        Boolean alert=false;
        String description= myCase.Description;
        List<String> foundSecretWordsInCase = new List<String>();
        for(String word:keywords){
            if(description!=null && description.containsIgnoreCase(word) && myCase.Subject!=Subject){
                alert=true;
                //childCases.add(myCase);
                System.debug('Secret word found');
                foundSecretWordsInCase.add(word);
            }
        }

        if(alert){
            Case newCase= new Case();
             newCase.Description ='This case parent has some secret information. Its is'+foundSecretWordsInCase;
             newCase.Priority= 'High';
             newCase.Subject= 'Parent case has secret information';
             newCase.Product_Purchase_date__c= Date.today();
             newCase.ParentId=myCase.Id;   
             caseToCreate.add(newCase);
             System.debug('Trigger fired as secret keyword found for case Id '+ newCase);

        }
       
     }

        insert caseToCreate;
    

}
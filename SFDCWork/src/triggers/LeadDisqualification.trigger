trigger LeadDisqualification on Lead (before insert,before update) {

    for(Lead myLead : trigger.new){

        if((myLead.FirstName != null && myLead.FirstName.equalsIgnoreCase('Test')) 
            || (myLead.LastName !=null && myLead.LastName.equalsIgnoreCase('Test'))){

            myLead.Status ='Disqualified';
            //update myLead;
            System.debug('Lead is disqualified  ');
            
        }
    }

}
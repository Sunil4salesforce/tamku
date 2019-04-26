trigger DeDupeLead on Lead (before insert) {

   Group dataQuality = [Select Id from Group where DeveloperName='Data_Quality' LIMIT 1];
    
    for(Lead myLead : trigger.new){
        String FirstCharOfLead;
        if(myLead.Firstname != null){
            FirstCharOfLead= myLead.FirstName.subString(0,1)+'%';
            }

        String CompanyMatch = '%'+myLead.Company+'%';
        List<Contact> contactList = [Select Id,FirstName,LastName,Email 
                                    FROM Contact
                                    WHERE (Email != null AND Email = :myLead.Email)
                                    OR( FirstName != null AND FirstName LIKE :FirstCharOfLead
                                    AND LastName= :myLead.LastName
                                    AND Account.Name LIKE :CompanyMatch)];

        System.debug('Matching contacts size'+ contactList.size() +'match found');
        if(!contactList.isEmpty()){
            String Description='';
            for(Contact myContact : contactList){

                Description ='This Lead is as dupe of the contact Id :'+myContact.Id
                                            + 'Contact First Name : '+ myContact.FirstName
                                            + 'Contact Last Name :'+ myContact.LastName + '\n'+Description ;

            }

            myLead.Description = Description;
            MyLead.OwnerId = dataQuality.Id;


        }

    }
        
 
}
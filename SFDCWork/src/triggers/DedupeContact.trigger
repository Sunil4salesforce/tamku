trigger DedupeContact on Contact (before insert,before update) {
    
    Set<String> contactEmailSet = new Set<String>();
    
    for(Contact myCon : Trigger.new){
        
        contactEmailSet.add(myCon.Email);
    
    }
    
    List<Contact> matchingContacts = [Select Id , Email from Contact where Email IN : contactEmailSet ];
    Map<String,Contact> mapOfMatchingContacts = new Map<String,Contact>();
    
    for(Contact con : matchingContacts){
    
        mapOfMatchingContacts.put(con.Email,con);
    }
    
    
    for(Contact con : trigger.new){
        
        if(mapOfMatchingContacts.containsKey(con.Email)){
            con.Email.addError('This contact already exists');
        }
    }
    
}
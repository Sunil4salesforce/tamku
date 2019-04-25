Trigger UpdateContactFieldsTrigger on Opportunity(After Insert,After Update)
{
    //Set of Contact Id
    System.debug('trigger.new Map:'+ trigger.NewMap);
    SET<Id>ContactSet = new SET<ID>();
    for(Opportunity NewOpp : Trigger.new)
    {    
    //Adding a perticular Contact selected from lookup while creating 
	//opportunity record to Set of Contact ID
	////Step 1. Create a set of all the contact Id from trigger.new (Opportunity trigger)   
        ContactSet.add(NewOpp.Contact__c);                     
    }
    //Now Creating a Map of Contact IDs for a perticular contact 
	//specifying The condition that it should be present in the Set of Contact in Previous Step
    MAP<Id,Contact>MapIdToContacts = new MAP<Id,Contact>
									([select id, Last_Gift_Amount__c 
                                     from contact where id IN : ContactSet]);
    //List to Hold Contacts related to an opportunity record                                                       
    List<contact> ListContact = new List<contact>();
    For(Opportunity NewOpp : [Select ID, Amount, Contact__c From Opportunity 
                              where ID In : Trigger.Newmap.Keyset()])
    {
        If(NewOpp.Amount !=0 && NewOpp.Amount != Null && NewOpp.Contact__c!= NUll )
        {
            MapIdToContacts.get(NewOpp.Contact__c).Last_Gift_Amount__c = NewOpp.Amount;
            ListContact.add(MapIdToContacts.get(NewOpp.Contact__c));
        }
    }
    //Finally updating contact List and the field 'Last Gift Amount'
	//also gets updated
    update ListContact;
}
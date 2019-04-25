trigger CountMultiSelect on Account (before insert,before update) {

    for(Account acc : trigger.new){

        if(acc.Hobby__c != null){
            System.debug('Multiselect list is not empty');
            acc.Counter__c = acc.Hobby__c.countMatches(';') + 1;
        }else{

            acc.Counter__c =0;
        }
    }

}
@isTest
private class CountMultiSelectTest {
    @isTest static void CountMultiSelectTest01() {

        Account acc = new Account();
        acc.Name ='SunilTest';
        acc.Hobby__c = 'Cooking;playing;Dancing';

        insert acc;

    }

     @isTest static void CountMultiSelectTest02() {

        Account acc = new Account();
        acc.Name ='SunilTest';
        

        insert acc;

    }
}
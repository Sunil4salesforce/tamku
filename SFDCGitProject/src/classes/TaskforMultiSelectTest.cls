@isTest
private class TaskforMultiSelectTest {
    @isTest static void TaskforMultiSelectTest() {

        Account acc = new Account();
        acc.Name ='SunilTest';
        acc.Hobby__c = 'Cooking;playing;Dancing';

        insert acc;

    }
}
@isTest
public with sharing class LeadDisqualificationTest {

    @isTest static void  LeadDisqualificationLastName() {

        Lead myLead     = new Lead();
        myLead.LastName = 'Test';
        myLead.Company  = 'Thomson Reuters';
        insert myLead;

    }

    @isTest static void  LeadDisqualificationFirstname() {

        Lead myLead         = new Lead();
        myLead.LastName     = 'Sunil';
        myLead.Firstname    = 'Test';
        myLead.Company  = 'Thomson Reuters';
        insert myLead;

    }

}
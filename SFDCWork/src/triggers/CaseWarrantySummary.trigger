trigger CaseWarrantySummary on Case (before insert) {

    for(Case myCase: trigger.new){

        if(myCase.Subject!='Parent case has secret information'){

            
        myCase.Warranty_Summary__c='Product Purchase on '+myCase.Product_Purchase_date__c+'and case created on '
                                    + myCase.CreatedDate + ' Warranty is for '+myCase.Product_Total_Warranty_Days__c + 
                                    ' days its warranty perios'+'Extended Warranty'+myCase.Product_Has_Extended_Warranty__c;
       // update myCase;
        }


    }

}
trigger LeadingCompetitor on Opportunity (before insert,before update) {

    String leadingCompetitor;
    for(Opportunity opp: trigger.new){

        // if(opp.Competitor_1_Price__c < opp.Competitor_2_Price__c && opp.Competitor_1_Price__c < opp.Competitor_3_Price__c){
        //     LeadingCompetitor=opp.Competitor_1__c;
        // }else if(opp.Competitor_2_Price__c < opp.Competitor_1_Price__c && opp.Competitor_2_Price__c < opp.Competitor_3_Price__c){
        //     LeadingCompetitor=opp.Competitor_2__c;
        // }else{
        //     LeadingCompetitor=opp.Competitor_3__c;
        // }

        // opp.Leading_Competotor__c=LeadingCompetitor;

        List<Decimal> CompetitorPrices = new List<Decimal>();
        CompetitorPrices.add(opp.Competitor_1_Price__c);
        CompetitorPrices.add(opp.Competitor_2_Price__c);
        CompetitorPrices.add(opp.Competitor_3_Price__c);

        List<String> CompetitorNames = new List<String>();
        CompetitorNames.add(opp.Competitor_1__c);
        CompetitorNames.add(opp.Competitor_2__c);
        CompetitorNames.add(opp.Competitor_3__c);

        Decimal lowestPrice=null;
        Integer lowestPricePosition;
        for(Integer i = 0 ;i<CompetitorPrices.size();i++){
            
            if(lowestPrice==null || lowestPrice>CompetitorPrices.get(i)){
                lowestPrice=CompetitorPrices.get(i);
                lowestPricePosition=i;
            }

        }
        opp.Leading_Competotor__c=CompetitorNames.get(lowestPricePosition);

    }

}
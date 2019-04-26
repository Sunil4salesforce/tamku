trigger AppleWatch on Opportunity (after insert) {
        
      for(Opportunity opp:Trigger.new){
      
          Task t = new Task();
          t.subject = 'Apple watch promo';
          t.description = 'Send then ASAP';
          t.priority = 'High';
          t.whatId = opp.Id;
          
          insert t;
      
      }
}
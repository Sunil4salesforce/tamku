trigger OpportunityOwnerManager on Opportunity (after insert) {

    for(Opportunity opp : trigger.new){

        //Add opp owner manager to opp team member
        //set his role as sales manager

        User OwnerManager = [Select ManagerId from User 
                                    where Id=:opp.OwnerId LIMIT 1];
        if(OwnerManager.ManagerId != null){

        OpportunityTeamMember  otm = new OpportunityTeamMember();
        otm.UserId = OwnerManager.ManagerId;
        otm.TeamMemberRole ='Sales Rep';
        otm.OpportunityID = opp.Id;
        insert otm;
        }
       


    }

}
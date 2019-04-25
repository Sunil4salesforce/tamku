trigger TaskforMultiSelect on Account (after insert) {

    List<Task> taskToCreate = new List<Task>();
    for(Account acc : trigger.new){

        if(acc.Hobby__C != null){

            List<String> taskitems = acc.Hobby__c.split(';',5);
            

            for(String taskitem : taskitems){

                Task myTask     = new Task();
                myTask.Subject  = taskitem;
                myTask.Priority = 'Normal';
                myTask.Status   = 'In Progress';
                myTask.WhatId   = acc.Id;

                taskToCreate.add(myTask);
            }
        }

    }

    insert taskToCreate;

}
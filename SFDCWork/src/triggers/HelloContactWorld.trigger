trigger HelloContactWorld on Contact (before update) {
    
    List<Account> accountChangeList= new List<Account>();

    for(Contact con:trigger.new){
    con.FirstName='Hello';
    con.Lastname='World';
       
    Account myAccount = [select Id from Account where Id=:con.AccountId LIMIT 1];
       
    myAccount.Rating='Warm';
    accountChangeList.add(myAccount);
       
    System.debug('The contacts being updated is :'+con.FirstName+'lastName :'+con.lastname +'Account Rating :'+con.Account.Rating);
   }
 

update accountChangeList;

}
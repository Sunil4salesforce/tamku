trigger HelloWorld on Lead (before update) {

    for(Lead l:trigger.new){
    l.FirstName='Hello';
    l.Lastname='World';
    }

}
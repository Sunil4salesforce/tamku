Public with sharing class DemoController {
   Public Id LoggedInUSerId{get;set;}
     Public DemoController(ApexPages.StandardController controller) {
          LoggedInUSerId = UserInfo.getUserId();
     }
}
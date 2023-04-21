public class AccountContactHelper {
    
   public Static list<Case> lstCase = new list<case>();
   public static void setContactIdNull(list<Case> lstCaseArg){
      lstCase.addAll(lstCaseArg);  
      for(Case caseObj : lstCase){
          caseObj.Contact__c = caseObj.contactId;
          caseObj.contactId = null;
          caseObj.accountId = null;
      }
      
   }
}
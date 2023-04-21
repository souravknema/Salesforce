public class MpsFutureUtility{
    
  public Static set<Id> setContactId = new set<id>();
  public Static list<Case> lstCase = new list<case>();
  public Static list<Case> lstCase2 = new list<Case>();
  public Static list<Contact> lstContact = new list<Contact>();
  public Static map<id,Id>mapContactIdAccount = new map<id,id>();
  public Static list<AccountContactRelation> lstAcrToBeInsert = new list<AccountContactRelation>();
  public Static list<AccountContactRelation> lstAcrToBeDelete = new list<AccountContactRelation>();
  public Static map<Id,list<AccountContactRelation>> mapContactIdACR =  new map<Id,list<AccountContactRelation>>();
  
  /**
   * this method set the Contacts accountId null,and update it
   * so that we can populate null accountId in case
   * this method also delete AccountContact Relation record
   * that will be restored on future method
   * @lstCase is list of newly inserted record
   */
  public static void setAccountIdNull(list<Case> lstCaseArg){
       lstCase.addAll(lstCaseArg);
       //set all accountId null and set setContactId variable using case contact.using this variable we will collect
       //contact records and will make its account null and perform operation on AccountContactRelation Record.
       
       for(Case caseObj : lstCase){
            setContactId.add(caseObj.contactId);
            caseObj.accountId = null;
        }
        
       //Retrieve contact record with its indirect AccountContactRelation records.
        lstContact = [SELECT accountId,(SELECT id,accountId,contactId FROM AccountContactRelations WHERE IsDirect = FALSE) FROM CONTACT WHERE id in:setContactId];
        
      //preform operation on list of contact 1)make its accountId null 2)store its ACR records in lstAcrToBeDelete to delete it 3)store its ACR records in lstAcrToBeInsert to reinsert it in future.
        for(Contact contactObj : lstContact) {             
            if(contactObj.AccountContactRelations.size()>0) {                              
                lstAcrToBeDelete.addAll(contactObj.AccountContactRelations);
                lstAcrToBeInsert.addAll(contactObj.AccountContactRelations.clone());
                mapContactIdAccount.put(contactObj.id, contactObj.AccountId);
                contactObj.accountId = null; 
            }
        }
        delete lstAcrToBeDelete;
        update lstContact;
  }
        
  /**
   * this method create new transaction
   * this method reassign the accountId to contact
   * and restore the AccountContact Relation records that were deleted in setAccountIdNull() method
   * @mapContactIdAccountId is the map of contact id and its parent account id, this param will reassign the 
   * account id value to contact accountId field
   * serializeObj is the cloned list of AccountContact record that were deleted in setAccountIdNull() method
   */
    
  @future
    public static void setAccountId(map<id,id>mapContactIdAccountId,String strSerializeObj)
    {   
        list<AccountContactRelation> lstAcrToBeInsert = (List<AccountContactRelation>) JSON.deserialize(strSerializeObj, List<AccountContactRelation>.class);
        list<Contact> lstContact = [SELECT accountId FROM Contact WHERE id in: mapContactIdAccountId.keySet()];
        //iterate contact and reset its accountId value.
        for(Contact contactObj : lstContact){  
            contactObj.accountId = mapContactIdAccountId.get(contactObj.Id);            
        }
        update lstContact; 
        //lstAcrToBeInsert is the clone of deleted ACR records, to reinsert it we first have to make its id null.
        for(AccountContactRelation acrObj : lstAcrToBeInsert) {
            acrObj.id = null;           
        }
        insert lstAcrToBeInsert;       
    }
    /**
     * this method take the list of case,if case contacts associated with many account
     * it make the contactId and accountId null and put the contact id in alternate contact lookup field
     * why we are using alternate contact lookup?
     * when case created salesforce automatically assign contact's accountId to case accountId.
     * to overwrite this behaviour we are using alternate contact lookup.
     */
    
    @future
    public static void setAccountId2(String strSerializeObj)
    { 
        List<Case> lstCase = (List<Case>) JSON.deserialize(strSerializeObj, List<Case>.class);
        list<Id>lstId = new list<Id>();

        for(Case caseObj : lstCase){
            setContactId.add(caseObj.contactId);
        }                
        lstContact = [SELECT accountId,(SELECT id,accountId,contactId FROM AccountContactRelations WHERE IsDirect = FALSE) FROM CONTACT WHERE id in:setContactId];
        
        //Select Id of contact that are associated with multiple account
        for(Contact contactObj : lstContact) {             
            if(contactObj.AccountContactRelations.size()>0) {                
                lstId.add(contactObj.Id);                 
            }
        }
        //make accountId and contactId null
       
        for(Case caseObj : lstCase){
            System.debug('lstId.Contains '+lstId.Contains(caseObj.contactId));
            if(lstId.Contains(caseObj.contactId)){
                
                caseObj.Contact__c = caseObj.contactId;
                caseObj.accountId  = null;
                caseObj.contactId  = null;
               
            }
        }
        update lstCase;
    }
        
}
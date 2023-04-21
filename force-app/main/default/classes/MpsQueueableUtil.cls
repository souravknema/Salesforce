public class MpsQueueableUtil implements Queueable {
    private List<Case> lstCase;
    public MpsQueueableUtil(list<Case> lstCaseE2C) {
        lstCase = lstCaseE2C;
    }
    public void execute(QueueableContext context) { 
        System.debug('list case... '+lstCase);
        for (Case caseObj : lstCase) {
          caseObj.Contact__c = caseObj.contactId;
          caseObj.accountId  = null;
          caseObj.contactId  = null;
        }
        update lstCase;
    }
}
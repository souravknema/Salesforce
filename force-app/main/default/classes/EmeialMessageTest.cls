@isTest

public class EmeialMessageTest {

 
 @isTest(SeeAllData = true)
    static void testMethod1(){
    Case cs = new Case();
    Contact ct = [select id from contact where id = '0035j00000DkgKPAAZ'];
    Account ac = [select id from account where id = '0015j00000CgxECAAZ'];
    cs.ContactId = ct.id;
    cs.AccountId = ac.id;
    insert cs;
    EmailMessage[] newEmail = new EmailMessage[0];
    newEmail.add(new EmailMessage(FromAddress = 'test@abc.org', Incoming = True, ToAddress= 'hello@670ocglw7xhomi4oyr5yw2zvf.8kp7yeag.8.case.salesforce.com', Subject = 'Test email', TextBody = '23456 ', ParentId = cs.Id)); 
    insert newEmail;
    Case cs1 = [select accountId from case where id =: cs.id];
    System.debug('case account id.. '+cs1.accountId);
 }
}
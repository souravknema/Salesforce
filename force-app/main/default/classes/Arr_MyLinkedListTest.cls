@isTest 
public class Arr_MyLinkedListTest {

  static testMethod void test_getIndexAt(){
   
      Arr_MyLinkedList linkList = getTestList();
      System.debug('link list value is... '+linkList.get(2));
      
  }
    
    public static  Arr_MyLinkedList getTestList(){
         Arr_MyLinkedList linkList = new Arr_MyLinkedList(10);
    
        ListNode node1       = new ListNode(10);
        ListNode node2       = new ListNode(15);
        ListNode node3       = new ListNode(20);
        ListNode node4       = new ListNode(30);
        linkList.head.next   = node1;
          
        node1.next     = node2;
        node2.next     = node3;
        node3.next     = node4;
        return linkList;
    }
    
}
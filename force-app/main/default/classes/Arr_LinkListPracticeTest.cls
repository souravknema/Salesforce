@isTest 
public class Arr_LinkListPracticeTest {
    static testMethod void test_GetIntersectionNode(){
        
        ListNode node1 = new ListNode(10);
        ListNode node2 = new ListNode(15);
        ListNode node3 = new ListNode(20);
        ListNode node4 = new ListNode(30);
        node1.next     = node2;
        node2.next     = node3;
        node3.next     = node4;
        
        ListNode node5 = new ListNode(8);
        ListNode node6 = new ListNode(10);
        
        node5.next = node6;
        node6.next = node3;
        
        ListNode nod = Arr_LinkListPractise.getIntersectionNode(node1,node5);
        
        System.debug('nod is.. '+nod.val);
        System.assertEquals(nod.val,20);
        
    }
    
    static testMethod void test_removeNthFromEnd(){
        
        ListNode node1 = new ListNode(10);
        ListNode node2 = new ListNode(15);
        ListNode node3 = new ListNode(20);
        ListNode node4 = new ListNode(30);
        ListNode node5 = new ListNode(8);
        ListNode node6 = new ListNode(10);
        
        node1.next     = node2;
        node2.next     = node3;
        node3.next     = node4;   
        node4.next     = node5;
        node5.next     = node6;
        
        ListNode nod = Arr_LinkListPractise.removeNthFromEnd(node1,2);
         
        System.debug('nod is.. '+nod.val);
        System.assertEquals(nod.val,10);
        
    }
    
   
    
     static testMethod void test_reverseList(){
        
        ListNode node1   = getNodes();
        ListNode node = Arr_LinkListPractise.reverseListV2(node1);
       // ListNode node = Arr_LinkListPractise.reverseListV2(node1);
         While(node != null){
             System.debug('node... '+node.val);
             node = node.next;
         }
         
     }
    
    public Static ListNode getNodes(){
        ListNode node1   = new ListNode(1);
        ListNode node2   = new ListNode(2);
        ListNode node3   = new ListNode(3);
        ListNode node4   = new ListNode(4);
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        return node1;
    }
}
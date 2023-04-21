@isTest
public class RecursivePracticeTest {

    static testMethod void test_reverseString(){
        
        RecursivePractice prcts = new RecursivePractice();
        String s = 'abcd';
        String [] sArray = s.split('');
        prcts.reverseString(sArray);
        
    }
    static testMethod void test_swapPairs(){
        ListNode node1 = new ListNode(1);
        ListNode node2 = new ListNode(2);
        ListNode node3 = new ListNode(3);
        ListNode node4 = new ListNode(4);
        ListNode node5 = new ListNode(5);
        ListNode node6 = new ListNode(6);
        
        node1.next = node2;
        node2.next = node3;
        node3.next = node4;
        node4.next = node5;
        node5.next = node6;
        RecursivePractice.swapPairs(node1);

    }
    
       static testMethod void test_reverseListV2(){
            ListNode node1 = new ListNode(1);
            ListNode node2 = new ListNode(2);
            ListNode node3 = new ListNode(3);
            ListNode node4 = new ListNode(4);
            ListNode node5 = new ListNode(5);
            ListNode node6 = new ListNode(6);
            
            node1.next = node2;
            node2.next = node3;
            node3.next = node4;
            node4.next = node5;
            node5.next = node6;
           
           ListNode nod= RecursivePractice.reverseListV2(node1);
           System.debug(' List Node is '+nod.val);
           
       }
        
        
}
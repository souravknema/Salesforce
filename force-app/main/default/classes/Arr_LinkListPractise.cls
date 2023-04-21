public class Arr_LinkListPractise {
  
      public static  boolean hasCycle(ListNode head) {
         Set<ListNode> visited = new Set<ListNode>();

        ListNode node = head;
        while (node != null) {
            if (visited.contains(node)) {
                return true;
            }
            visited.add(node);
            node = node.next;
        }

        return false;
    }
    
   
    public static void testCyclic(){
       Set<ListNode> visited = new Set<ListNode>();

        ListNode node1 = new ListNode(10);
        ListNode node2 = new ListNode(15);
        ListNode node3 = new ListNode(20);
        ListNode node4 = new ListNode(30);
        node1.next = node2;
        node2.next = node3;
       // node3.next = node1;
        
       // System.debug('is set contain node'+ Arr_LinkListPractise.detectCycle(node1));
        
        System.debug('is set contain node'+ 
                     Arr_LinkListPractise.hasCycleV2(node1));

    }
    
     public static void testCyclic2(){
       List<ListNode> nodeList = new List<ListNode>();
        
         for(integer i = 0 ; i<=10;i++){
             
              ListNode node1 = new ListNode(i);
              nodeList.add(node1);
         }
         
         for(integer i = 0 ; i<nodeList.size()-1;i++){
             
            nodeList[i].next = nodeList[i+1].next;
         }
       
        System.debug('is set contain node'+ 
                     Arr_LinkListPractise.hasCycle(nodeList[0]));
         
         nodeList[9].next = nodeList[0];
         
          System.debug('is set contain node2'+ 
                     Arr_LinkListPractise.hasCycle(nodeList[0]));

    }
    
    public Static boolean hasCycleV2(ListNode head) {
        if (head == null) {
            return false;
        }

        ListNode slow = head;
        ListNode fast = head.next;
        while (slow != fast) {
            if (fast == null || fast.next == null) {
                return false;
            }
            slow = slow.next;
            fast = fast.next.next;
        }
        return true;
    }
    
     public Static ListNode detectCycle(ListNode head) {
        Set<ListNode> visited = new Set<ListNode>();

        ListNode node = head;
        while (node != null) {
            if (visited.contains(node)) {
                return node;
            }
            visited.add(node);
            node = node.next;
        }

        return null;
    }
    
    public Static ListNode getIntersectionNode(ListNode headA, ListNode headB) {
        Set<ListNode> nodesInB = new Set<ListNode>();

        while (headB != null) {
            nodesInB.add(headB);
            headB = headB.next;
        }

        while (headA != null) {
            // if we find the node pointed to by headA,
            // in our set containing nodes of B, then return the node
            if (nodesInB.contains(headA)) {
                return headA;
            }
            headA = headA.next;
        }

        return null;
    }
    
   
    public ListNode getIntersectionNodeV2(ListNode headA, ListNode headB) {
        ListNode pA = headA;
        ListNode pB = headB;
        while (pA != pB) {
            pA = pA == null ? headB : pA.next;
            pB = pB == null ? headA : pB.next;
        }
        return pA;
       
    }
    
    public Static ListNode removeNthFromEnd(ListNode head, integer n) {
    ListNode dummy = new ListNode(0);
    dummy.next = head;
    integer length  = 0;
    ListNode first = head;
    while (first != null) {
        length++;
        first = first.next;
    }
    length -= n;
    first = dummy;
    while (length > 0) {
        length--;
        first = first.next;
    }
    first.next = first.next.next;
    return dummy.next;
  }
    
   
    public Static ListNode reverseList(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;
        while (curr != null) {
            ListNode nextTemp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = nextTemp;
            System.debug(' curr  '+curr.val+' curr.next '+curr.next+' nextTemp '+nextTemp+' prev '+prev);
        }
        return prev;
    
    }
    
    public static ListNode reserveListV3(ListNode head){
        
        list<ListNode> lstNode = new list<ListNode>();
        ListNode curr = head;
        System.debug('before reverse.. '+curr);
        
        while(curr.next!=null){
            lstNode.add(curr);
            curr = curr.next;
        }
        
        for(integer i = lstNode.size()-1;i>0;i--){
            System.debug('in iteration.. '+ lstNode[i].next.val);
            lstNode[i].next = lstNode[i-1];
            System.debug('in iteration2.. '+  lstNode[i].next.val);
        }
         System.debug('after reverse.. '+lstNode[0]);
         return lstNode[0];
    }
    
     public Static  ListNode reverseListV2(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }
        ListNode p = reverseListV2(head.next);
        head.next.next = head;
        head.next = null;
        return p;
    }
    
      public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        ListNode dummyHead = new ListNode(0);
        ListNode p = l1, q = l2, curr = dummyHead;
        integer carry = 0;
        while (p != null || q != null) {
            integer x = (p != null) ? p.val : 0;
            integer y = (q != null) ? q.val : 0;
            integer sum = carry + x + y;
            carry = sum / 10;
            curr.next = new ListNode(Math.mod(sum,10));
            curr = curr.next;
            if (p != null) p = p.next;
            if (q != null) q = q.next;
            System.debug(' x '+x+' y '+y+' sum '+sum+' carry '+carry+' curr '+curr.val);
        }
        if (carry > 0) {
            curr.next = new ListNode(carry);
        }
        return dummyHead.next;
    }
}
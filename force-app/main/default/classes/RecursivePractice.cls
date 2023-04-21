public class RecursivePractice {
      
  public string[] helper(string[] s, integer left, integer right) {
    if (left >= right) return null;
        string tmp = s[left];
        s[left++] = s[right];
        s[right--] = tmp;
        helper(s, left, right);
        return s;
  }

  public void reverseString(string[] s) {
    s = helper(s, 0, s.size() - 1);
    System.debug('reverse string is.. '+s);
  }

     public void reverseStringV2(string[] s) {
        integer left = 0, right = s.size() - 1;
        while (left < right) {
            string tmp = s[left];
            s[left++] = s[right];
            s[right--] = tmp;
        }
    }
    
    public Static ListNode swapPairs(ListNode head) {

        // If the list has no node or has only one node left.
        if ((head == null) || (head.next == null)) {
            return head;
        }

        // Nodes to be swapped
        ListNode firstNode = head;
        ListNode secondNode = head.next;
        
        System.debug(' First Node  '+firstNode.val+' secondNode '+secondNode.val);
        // Swapping
        firstNode.next  = swapPairs(secondNode.next);
        secondNode.next = firstNode;
       
          System.debug(' First Node after call '+firstNode.val+' secondNode after call '+secondNode.val);
         try{
          System.debug(' First Node Next '+firstNode.next.val+' secondNode '+secondNode.next.val);
        }
        catch(exception e){
            
        }
        // Now the head is the second node
        return secondNode;
    }
    
   
    public ListNode reverseListV1(ListNode head) {
        ListNode prev = null;
        ListNode curr = head;
        while (curr != null) {
            ListNode nextTemp = curr.next;
            curr.next = prev;
            prev = curr;
            curr = nextTemp;
        }
        return prev;
    }
    
    public Static ListNode reverseListV2(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }
        ListNode p = reverseListV2(head.next);
        head.next.next = head;
        
         try{
         System.debug(' p '+p.val+' head.next.next  '+ head.next.val);
        }
        catch(exception e){
                
         }
        head.next = null;
       
        return p;
    }
    
    ///////////////MEMORIZATION EXAMPLE///////////////
    //
  static  Map<Integer, Integer> cache = new Map<Integer, Integer>();

  public static integer fib(integer N) {
    if (cache.containsKey(N)) {
      return cache.get(N);
    }
    integer result;
    if (N < 2) {
      result = N;
    } else {
      result = fib(N-1) + fib(N-2);
    }
    // keep the result in cache.
    cache.put(N, result);
    return result;
  }
    
    
    public integer climbStairs(integer n) {
        return climb_Stairs(0, n);
    }
    public integer climb_Stairs(integer i, integer n) {
        if (i > n) {
            return 0;
        }
        if (i == n) {
            return 1;
        }
        return climb_Stairs(i + 1, n) + climb_Stairs(i + 2, n);
    
}



}
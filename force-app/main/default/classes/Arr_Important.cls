public class Arr_Important {
   
       public Static Map<String,List<String>> groupAnagrams(String[] strs) {
           Map<String,List<String>> result = new Map<String,List<String>>();
           if(strs.size()==0){
               return null;
           }
           
           for(String s : strs){
              list<string> chars = s.split('');
              chars.sort();
              String keyString = '';
               for(String str : chars){
                   keyString = keyString+str;
               }
                List<String> strngs;
               if(!result.containsKey(keyString)){
                   strngs = new List<String>();
                   strngs.add(s);
                   result.put(keyString,strngs);
               }
               else{
                   strngs = result.get(keyString);
                   strngs.add(s);
                   result.put(keyString,strngs);
                   
               }
               
           }
         
          return result;
       }
    
    public void sortColors(integer [] nums) {
        integer count0 =0, count1=0, count2=0;
        for(integer i=0;i<nums.size();i++)
        {
            if(nums[i]==0)
                count0++;
            else if(nums[i]==1)
                count1++;
            else
                count2++;
        }
        
        integer i=0;
        while(count0>0)
        {
            nums[i++]=0;
            count0--;
        } 
        
        while(count1>0)
        {
            nums[i++]=1;
            count1--;
        }
        
        while(count2>0)
        {
            nums[i++]=2;
            count2--;
        }
        
    }
    
   public void selectionSort(integer[]arr) {
    integer size = arr.size();

    for (integer step = 0; step < size - 1; step++) {
      integer min_idx = step;

      for (integer i = step + 1; i < size; i++) {

        // To sort in descending order, change > to < in this line.
        // Select the minimum element in each loop.
        if (arr[i] < arr[min_idx]) {
          min_idx = i;
        }
      }

      // put min at the correct position
      integer temp = arr[step];
      arr[step] = arr[min_idx];
      arr[min_idx] = temp;
    }
  }
    
    public integer maxSubArray(integer[] nums) {
        integer maxSubarray = 0;
        for (integer i = 0; i < nums.size(); i++) {
            integer currentSubarray = 0;
            for (integer j = i; j < nums.size(); j++) {
                currentSubarray += nums[j];
                maxSubarray = Math.max(maxSubarray, currentSubarray);
            }
        }
        
        return maxSubarray;
    }
    
     public ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        // maintain an unchanging reference to node ahead of the return node.
        ListNode prehead = new ListNode(-1);

        ListNode prev = prehead;
        while (l1 != null && l2 != null) {
            if (l1.val <= l2.val) {
                prev.next = l1;
                l1 = l1.next;
            } else {
                prev.next = l2;
                l2 = l2.next;
            }
            prev = prev.next;
        }

        // At least one of l1 and l2 can still have nodes at this point, so connect
        // the non-null list to the end of the merged list.
        prev.next = l1 == null ? l2 : l1;

        return prehead.next;
    }
    
     public void reverseString(string[] s) {
        integer left = 0, right = s.size() - 1;
        while (left < right) {
            String tmp = s[left];
            s[left++] = s[right];
            s[right--] = tmp;
        }
    }
 }
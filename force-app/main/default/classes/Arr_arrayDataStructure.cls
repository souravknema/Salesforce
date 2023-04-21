public class Arr_arrayDataStructure {

    //Get longest substring without repeating characters
    //
     public static integer lengthOfLongestSubstring(String s) {
       	Integer ans = 0;
        integer n = s.length();
        Map<String, Integer> chatMap = new Map<String, Integer>(); // current index of character
        for (integer j = 0, i = 0; j < n; j++) {
            if (chatMap.containsKey(String.valueOf(s.charAt(j)))) {
                i = Math.max(chatMap.get(String.valueOf(s.charAt(j))), i);
            }
            ans = Math.max(ans, j - i + 1);
            chatMap.put(String.valueOf(s.charAt(j)), j + 1);
        }
        return ans;
    }

      //Contain most of the water rute force
      
       public static integer maxArea(integer[] height) {
        integer maxarea = 0;
        for (integer left = 0; left < height.size(); left++) {
            for (integer right = left + 1; right < height.size(); right++) {
                integer width = right - left;
                maxarea = Math.max(maxarea, Math.min(height[left], height[right]) * width);
            }
        }
        return maxarea;
    }
    
    public static integer maxArea2(integer[] height) {
        System.debug('height is.. '+height);
        map<string,list<string>> debugMap = new map<string,list<string>>();
        integer maxarea = 0;
        integer left = 0; 
        integer right = height.size() - 1;
        while (left < right) {
            integer width = right - left;
            maxarea = Math.max(maxarea, Math.min(height[left], height[right]) * width);
            System.debug('  left is   '+left+'  right is  '+right+'  width  '+width);
            System.debug('  height[left]  is '+height[left]+  '  height[right]  is '+height[right]);
            if (height[left] <= height[right]) {
                left++;
            } else {
                right--;
            }
            
            System.debug('  maxArea '+maxarea);
        }
        return maxarea;
    }
    
   

}
public class Arr_MinimumWindowSubString {
   public Integer sizeOfLongestSubstringTwoDistinct(String s) {
    Integer n = s.length();
    if (n < 3) return n;

    // sliding window left and right poIntegerers
    Integer left = 0;
    Integer right = 0;
    // hashmap String -> its rightmost position
    // in the sliding window
    Map<String, Integer> hashmap = new Map<String, Integer>();

    Integer max_len = 2;

    while (right < n) {
      // when the slidewindow contains less than 3 Strings
      hashmap.put(s.substring(right-1,right), right++);

      // slidewindow contains 3 Strings
      if (hashmap.size() == 3) {
        // delete the leftmost String
		List<Integer> values = hashmap.values();
		values.sort();
        Integer del_idx = values.get(0);
        hashmap.remove(s.substring(del_idx-1,del_idx));
        // move left poIntegerer of the slidewindow
        left = del_idx + 1;
      }

      max_len = Math.max(max_len, right - left);
    }
    return max_len;
  }
}
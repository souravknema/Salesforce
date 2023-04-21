public class Arr_ThreeSum {
      public List<List<Integer>> threeSum(Integer[] nums) {
        nums.sort();
        List<List<Integer>> res = new  List<List<Integer>>();
          for (integer i = 0; i < nums.size() && nums[i] <= 0; ++i){
            if (i == 0 || nums[i - 1] != nums[i]) {
                twoSumII(nums, i, res);
            }
          }
        return res;
    }
    void twoSumII(integer[] nums, integer i, List<List<Integer>> res) {
        integer lo = i + 1, hi = nums.size() - 1;
        while (lo < hi) {
            integer sum = nums[i] + nums[lo] + nums[hi];
            if (sum < 0) {
                ++lo;
            } else if (sum > 0) {
                --hi;
            } else {
                List<Integer> intgrList = new List<Integer>();
                intgrList.add(nums[i]);
                intgrList.add(nums[lo++]);
                intgrList.add(nums[hi--]);
                
                res.add(intgrList);
                while (lo < hi && nums[lo] == nums[lo - 1])
                    ++lo;
            }
        }
    }

}
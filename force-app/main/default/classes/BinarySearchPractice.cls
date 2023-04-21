public class BinarySearchPractice {
   public Static integer search(integer[] nums, integer target) {
       
    System.debug(' nums are '+nums);
    integer pivot, left = 0, right = nums.size() - 1;
    while (left <= right) {
      pivot = left + (right - left) / 2;
      if (nums[pivot] == target) return pivot;
      if (target < nums[pivot]) right = pivot - 1;
      else left = pivot + 1;
        
      System.debug(' left '+left+' right '+right+' pivot '+pivot+' nums[pivot] '+nums[pivot]);
    }
    return -1;
  }
      
  public Static integer mySqrt(integer x) {
    if (x < 2) return x;
    long num;
    integer pivot, left = 2, right = x / 2;
    while (left <= right) {
      pivot = left + (right - left) / 2;
      num = (long)pivot * pivot;
      if (num > x) right = pivot - 1;
      else if (num < x) left = pivot + 1;
      else return pivot;
        
      System.debug(' left '+left+' right '+right+' pivot '+pivot+' num '+num);
    }

    return right;
  }
    
    private Integer guess(integer num){
        if(num == 6){ 
            return 0;
        }
        else if(num<6){
          return -1;
        }
        else{
            return 1;
        }
    }
    
    public integer guessNumberV1(integer n) {
        for (integer i = 1; i <= n; i++){
            if (guess(i) == 0){
                return i;
            }
        }
        return null;
    }
    
     public integer guessNumberV2(integer n) {
        integer low = 1;
        integer high = n;
        while (low <= high) {
            integer mid = low + (high - low) / 2;
            integer res = guess(mid);
            if (res == 0)
                return mid;
            else if (res < 0)
                high = mid - 1;
            else
                low = mid + 1;
        }
        return -1;
    }
    
    public integer firstBadVersion(integer n) {
    integer left = 1;
    integer right = n;
    while (left < right) {
        integer mid = left + (right - left) / 2;
        if (isBadVersion(mid)) {
            right = mid;
        } else {
            left = mid + 1;
        }
    }
    return left;
  }
    
    public boolean isBadVersion(integer num){
        return num==7 || num==8 || num == 9 || num==10;
    }
    
  
    public Static integer findPeakElement(integer[] nums) {
        return search(nums, 0, nums.size() - 1);
    }
    public Static integer search(integer[] nums, integer l, integer r) {
       
        if (l == r){
            System.debug(' l '+l+' r '+r);
            return l;
        }
        integer mid = (l + r) / 2;
         System.debug(' l '+l+' r '+r+' mid '+mid+' nums[mid] '+ nums[mid]);
        if (nums[mid] > nums[mid + 1])
            return search(nums, l, mid);
        return search(nums, mid + 1, r);
    
}
    
   
  public integer findMin(integer[] nums) {
    // If the list has just one element then return that element.
    if (nums.size() == 1) {
      return nums[0];
    }

    // initializing left and right pointegerers.
    integer left = 0, right = nums.size() - 1;

    // if the last element is greater than the first element then there is no rotation.
    // e.g. 1 < 2 < 3 < 4 < 5 < 7. Already sorted array.
    // Hence the smallest element is first element. A[0]
    if (nums[right] > nums[0]) {
      return nums[0];
    }
    
    // Binary search way
    while (right >= left) {
      // Find the mid element
      integer mid = left + (right - left) / 2;

      // if the mid element is greater than its next element then mid+1 element is the smallest
      // This pointeger would be the pointeger of change. From higher to lower value.
      if (nums[mid] > nums[mid + 1]) {
        return nums[mid + 1];
      }

      // if the mid element is lesser than its previous element then mid element is the smallest
      if (nums[mid - 1] > nums[mid]) {
        return nums[mid];
      }

      // if the mid elements value is greater than the 0th element this means
      // the least value is still somewhere to the right as we are still dealing with elements
      // greater than nums[0]
      if (nums[mid] > nums[0]) {
        left = mid + 1;
      } else {
        // if nums[0] is greater than the mid value then this means the smallest value is somewhere to
        // the left
        right = mid - 1;
      }
    }
    return -1;
  }
    
     public integer[] searchRange(integer[] nums, integer target) {
        
        integer firstOccurrence = this.findBound(nums, target, true);
        
        if (firstOccurrence == -1) {
            return new integer[]{-1, -1};
        }
        
        integer lastOccurrence = this.findBound(nums, target, false);
        
        return new integer[]{firstOccurrence, lastOccurrence};
    }
    
    private integer findBound(integer[] nums, integer target, boolean isFirst) {
        integer N = nums.size();
        integer start = 0, last = N - 1;
        
        while (start <= last) {
            
            integer mid = (start + last) / 2;
            
            if (nums[mid] == target) {
                
                if (isFirst) {
                    
                    // This means we found our lower bound.
                    if (mid == start || nums[mid - 1] != target) {
                        return mid;
                    }
                    
                    // Search on the left side for the bound.
                    last = mid - 1;
                    
                } else {
                    
                    // This means we found our upper bound.
                    if (mid == last || nums[mid + 1] != target) {
                        return mid;
                    }
                    
                    // Search on the right side for the bound.
                    start = mid + 1;
                }
                
            } else if (nums[mid] > target) {
                last = mid - 1;
            } else {
                start = mid + 1;
            }
        }
        
        return -1;
    }
    
    public integer[] searchRangeV2(integer[] nums, integer target) {
        
        integer firstOccurrence = this.findBound(nums, target, true);
        
        if (firstOccurrence == -1) {
            return new integer[]{-1, -1};
        }
        
        integer lastOccurrence = this.findBound(nums, target, false);
        
        return new integer[]{firstOccurrence, lastOccurrence};
    }
    
    private integer findBoundV2(integer[] nums, integer target, boolean isFirst) {
        integer N = nums.size();
        integer start = 0, last = N - 1;
        
        while (start <= last) {
            
            integer mid = (start + last) / 2;
            
            if (nums[mid] == target) {
                
                if (isFirst) {
                    
                    // This means we found our lower bound.
                    if (mid == start || nums[mid - 1] != target) {
                        return mid;
                    }
                    
                    // Search on the left side for the bound.
                    last = mid - 1;
                    
                } else {
                    
                    // This means we found our upper bound.
                    if (mid == last || nums[mid + 1] != target) {
                        return mid;
                    }
                    
                    // Search on the right side for the bound.
                    start = mid + 1;
                }
                
            } else if (nums[mid] > target) {
                last = mid - 1;
            } else {
                start = mid + 1;
            }
        }
        
        return -1;
    }


}
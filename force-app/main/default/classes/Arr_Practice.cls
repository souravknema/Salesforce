public class Arr_Practice {
  public integer findMaxConsecutiveOnes(integer[] nums) {
    integer count = 0;
    integer maxCount = 0;
    for(integer i = 0; i < nums.size(); i++) {
      if(nums[i] == 1) {
        // Increment the count of 1's by one.
        count += 1;
      } else {
        // Find the maximum till now.
        maxCount = Math.max(maxCount, count);
        // Reset count of 1.
        count = 0;
      }
    }
    return Math.max(maxCount, count);  
}
    
    public integer[] sortedSquares(integer[] A) {
        integer N = A.size();
        integer[] ans = new integer[N];
        for (integer i = 0; i < N; ++i){
            System.debug('increment is...'+i);
            ans[i] = A[i] * A[i];

            ans.sort();
        }
        return ans;
    }
    
     public static integer[] sortedSquares2(integer[] nums) {
        integer n = nums.size();
        integer[] result = new integer[n];
        integer left = 0;
        integer right = n - 1;
        System.debug('nums are... '+nums);
        for (integer i = n - 1; i >= 0; i--) {
            integer square;
            if (Math.abs(nums[left]) < Math.abs(nums[right])) {
                square = nums[right];
                right--;
            } else {
                square = nums[left];
                left++;
            }
            result[i] = square * square;
            System.debug('i '+i+'  left '+left+' right'+right+' sqare'+square+'result '+ result[i]);
        }
        return result;
    }
    
    public void duplicateZeroV2(integer [] arr){
        
        integer possibleDups = 0;
        
        integer length = arr.size()-1;
        for(integer i=0;i<=length-possibleDups;i++){
            if(arr[i]==0) possibleDups++;
        }
                
        //We will scan from the last
        integer last = arr.size()-possibleDups;
        
        for(integer i =last;i>=0;i--){
            
            if(arr[i]==0){
                
                
            }
        }
    }
     public void duplicateZeros(integer[] arr) {
        integer possibleDups = 0;
        integer lenth      = arr.size() - 1;

        // Find the number of zeros to be duplicated
        // Stopping when left points beyond the last element in the original array
        // which would be part of the modified array
        for (integer left = 0; left <= lenth - possibleDups; left++) {

            // Count the zeros
            if (arr[left] == 0) {

                // Edge case: This zero can't be duplicated. We have no more space,
                // as left is pointing to the last element which could be included  
                if (left == lenth - possibleDups) {
                    // For this zero we just copy it without duplication.
                    arr[lenth] = 0;
                    lenth -= 1;
                    break;
                }
                possibleDups++;
            }
        }

        // Start backwards from the last element which would be part of new array.
        integer last = lenth - possibleDups;

        // Copy zero twice, and non zero once.
        for (integer i = last; i >= 0; i--) {
            if (arr[i] == 0) {
                arr[i + possibleDups] = 0;
                possibleDups--;
                arr[i + possibleDups] = 0;
            } else {
                arr[i + possibleDups] = arr[i];
            }
        }
    }

   
    public static void merge1(integer[] nums1, integer m, integer[] nums2, integer n) {
        
        System.debug('num 1 is '+nums1);
        System.debug('num 2 is '+nums2);


        for (integer i = 0; i < n; i++) {
            nums1[i + m] = nums2[i];
            System.debug(' i '+i+' m '+m+'  nums1[i + m] '+ nums1[i + m]+' nums2[i] '+nums2[i]);
        }
       nums1.sort();
       System.debug('num 1 is '+nums1);
     }
    
     public void merge2(integer[] nums1, integer m, integer[] nums2, integer n) {
        // Make a copy of the first m elements of nums1.
        integer[] nums1Copy = new integer[m];
        for (integer i = 0; i < m; i++) {
            nums1Copy[i] = nums1[i];
        }

        // Read pointegerers for nums1Copy and nums2 respectively.
        integer p1 = 0;
        integer p2 = 0;
                
        // Compare elements from nums1Copy and nums2 and write the smallest to nums1.
        for (integer p = 0; p < m + n; p++) {
            // We also need to ensure that p1 and p2 aren't over the boundaries
            // of their respective arrays.
            if (p2 >= n || (p1 < m && nums1Copy[p1] < nums2[p2])) {
                nums1[p] = nums1Copy[p1++];
            } else {
                nums1[p] = nums2[p2++];
            }
        }
    }
    
    public Static integer removeElement(integer[] nums, integer val) {
   
    integer i = 0;
    for (integer j = 0; j < nums.size(); j++) {
         System.debug(' j is '+j);
        if (nums[j] != val) {
            nums[i] = nums[j];
             System.debug('nums[i] is ... '+ nums[i]);
            i++;
        }
        System.debug(' j'+j+' i '+i+ ' nums[j] ' + nums[j] + ' nums[i] '+nums[i]);
    }
    System.debug('new nums are... '+nums);
    return i;
  }
    
  public static integer removeDuplicates(integer[] nums) {
    System.debug(' nums array is '+nums);
    if (nums.size() == 0) return 0;
    integer i = 0;
    for (integer j = 1; j < nums.size(); j++) {
        if (nums[j] != nums[i]) {
            i++;
            nums[i] = nums[j];
        }
        System.debug(' j '+j+' i '+i+' nums[j] '+nums[j]+'  nums[i] '+nums[i]);
    }
    System.debug('nums is ..'+nums);
    return i + 1;
  }
    
   public boolean validMountainArray(integer[] A) {
        integer N = A.size();
        integer i = 0;

        // walk up
        while (i+1 < N && A[i] < A[i+1])
            i++;

        // peak can't be first or last
        if (i == 0 || i == N-1)
            return false;

        // walk down
        while (i+1 < N && A[i] > A[i+1])
            i++;

        return i == N-1;
    }
    
    void moveZeroes(integer[] nums) {
    integer lastNonZeroFoundAt = 0;
    // If the current element is not 0, then we need to
    // append it just in front of last non 0 element we found. 
    for (integer i = 0; i < nums.size(); i++) {
        if (nums[i] != 0) {
            nums[lastNonZeroFoundAt++] = nums[i];
        }
    }
 	// After we have finished processing new elements,
 	// all the non-zero elements are already at beginning of array.
 	// We just need to fill remaining array with 0's.
    for (integer i = lastNonZeroFoundAt; i < nums.size(); i++) {
        nums[i] = 0;
    }
}
    
   
    public Static integer[] sortArrayByParity(integer[] A) {
        integer[] ans = new integer[A.size()];
        integer t = 0;

        for (integer i = 0; i < A.Size(); ++i)
            if (math.mod(A[i],2) == 0)
                ans[t++] = A[i];

        for (integer i = 0; i < A.Size(); ++i)
            if (math.mod(A[i],2) == 1)
                ans[t++] = A[i];

        return ans;
    }
    
    public static integer[] sortByParityV2(integer [] Arr){
        
        integer swapPointer =0;
        
        for(integer i=0;i<Arr.size();i++){
            
            if(Math.mod(Arr[i],2)==0){
                integer temp = Arr[swapPointer];
                Arr[swapPointer++] = Arr[i];
                Arr[i] = temp;
            }
        }
        return Arr;
        
    }
    
    public integer[] sortArrayByParityInPlace(integer[] A) {
        integer i = 0, j = A.size() - 1;
        while (i < j) {
            if (math.mod(A[i],2) > math.mod(A[j],2)) {
                integer tmp = A[i];
                A[i] = A[j];
                A[j] = tmp;
            }

            if (math.mod(A[i],2) == 0) i++;
            if (math.mod(A[j],2) == 1) j--;
        }

        return A;
    }
    
    ////////////////////GOOGLE PRACTICE/////////////////////
    
    public integer[] plusOne(integer[] digits) {
    integer n = digits.size();

    // move along the input array starting from the end
    for (integer idx = n - 1; idx >= 0; --idx) {
      // set all the nines at the end of array to zeros
      if (digits[idx] == 9) {
        digits[idx] = 0;
      }
      // here we have the rightmost not-nine
      else {
        // increase this rightmost not-nine by 1
        digits[idx]++;
        // and the job is done
        return digits;
      }
    }
    // we're here because all the digits are nines
    digits = new integer[n + 1];
    digits[0] = 1;
    return digits;
  }

    
}
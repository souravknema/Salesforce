public class KSortest {
    public Static  List<integer> findClosestElements(integer[] arr, integer k, integer x) {
        List<integer> result = new List<integer>();
        
        // Base case
        if (arr.size() == k) {
            for (integer i = 0; i < k; i++) {
                result.add(arr[i]);
            }
            
            return result;
        }
        
        // Binary search to find the closest element
        integer left = 0;
        integer right = arr.size();
        integer mid = 0;
        while (left < right) {
            mid = (left + right) / 2;
            if (arr[mid] >= x) {
                right = mid;
            } else {
                left = mid + 1;
            }
          System.debug(' left '+left+' right '+right+' mid '+mid+' arr[mid] '+arr[mid]);
        }
        
        // Initialize our sliding window's bounds
        left -= 1;
        right = left + 1;
        
        // While the window size is less than k
        while (right - left - 1 < k) {
            // Be careful to not go out of bounds
            if (left == -1) {
                right += 1;
                continue;
            }
            
            // Expand the window towards the side with the closer number
            // Be careful to not go out of bounds with the pointegerers
            if (right == arr.size() || Math.abs(arr[left] - x) <= Math.abs(arr[right] - x)) {
                left -= 1;
            } else {
                right += 1;
            }
        } 

        // Build and return the window
        for (integer i = left + 1; i < right; i++) {
            result.add(arr[i]);
        }
        
        return result;
    }
}
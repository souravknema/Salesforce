public class testClass {
    
    
    //O(1) Algorithm
    public Static void getNumbers(){
        
        Integer[] numbrs = new Integer[]{2,3,4,5,6,7,8,9,10};

            for (Integer i = 0;i<=numbrs.size();i++){
                
                 System.debug(numbrs[0]);
                 break;
            }
    }
    
    //O(N) Algorithm
    public Static void getAllNumbers(){
        
        Integer[] numbrs = new Integer[]{1,2,3,4,5,6,7,8,9};

            for (Integer i = 0;i<=numbrs.size();i++){
                
                 System.debug(numbrs[0]);
            }
    }
    
     //O(N^2) Algorithm
    public Static void getSquare(){
        
        Integer[] numbrs1 = new Integer[]{1,2,3,4,5,6,7,8,9};
        Integer[] numbrs2 = new Integer[]{1,2,3,4,5,6,7,8,9};

            for (Integer i = 0;i<=numbrs1.size();i++){
                for (Integer j = 0;j<=numbrs2.size()-1;j++){
                    System.debug('number a is...'+numbrs1[i]);
                }               
            }
    }
    
    //Q1 Define the array
    //
    public static Integer[] getArray(){
        
        Integer[] numberArray = new Integer[]{1,2,3,4,5,6,7,8,9};
        return numberArray;
    }
    
    //Q2 get first not repeating
    public static Integer getFirstNonRepeating(Integer[] numberArray){
        integer n = numberArray.size()-1;
        
        for(integer i=0;i<n;i++){
        
        for(integer j=0;j<n;j++){
            if(i!=j && numberArray[i]== numberArray[j]){
                break;
            }
            if(j==n){
                return numberArray[i];
            }
           
        }
      } 
      return -1;
    }
    
    //Q2 get first not repeating
    public static Integer[] sortArray(Integer[] numberArray){
        integer n = numberArray.size()-1;
        
        for(integer i=0;i<=n;i++){
        
            for(integer j=i+1;j<=n;j++){
                if(numberArray[i]<numberArray[j]){
                    Integer temp   = numberArray[i];
                    numberArray[i] =  numberArray[j];
                    numberArray[j] = temp;
                }               
           }
       } 
        return numberArray;
    }
    
     //Q2 get first not repeating
    public static Integer[] rotateArray(Integer[] numberArray){
        integer n = numberArray.size()-1;
        
        for(integer i=0;i<=n-1;i++){
              integer j, last;
              last = numberArray[n];
            for(j=n;j>0;j--){
                numberArray[j] = numberArray[j-1];
            }
         numberArray[0] =  last;           
       } 
        return numberArray;
    }
    
    //Q3 Get factorial
    
    public static Integer factorial(integer numbr){        
        if(numbr <=1){
            return 1;
        }        
        return numbr*factorial(numbr - 1);
    }

}
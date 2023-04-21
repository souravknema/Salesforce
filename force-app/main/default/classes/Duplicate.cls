public class Duplicate {
    
    public integer amount;
    public string name;
   
    public Static list<Duplicate>  removeDuplicateV1(list<Duplicate> dplctList){
        
        if(dplctList.isEmpty()){
            return null;
        }
        list<Duplicate> dedupeList = new list<Duplicate>();
        
        for(integer i=1;i<dplctList.size();i++){
            
            if(dplctList[i].amount != dplctList[i-1].amount){
                
                dedupeList.add(dplctList[i]);
            }
        }
        
        return dedupeList;
    }
    
     public Static list<Duplicate>  removeDuplicateV2(list<Duplicate> dplctList){
        
           if(dplctList.isEmpty()){
             return null;
           }
         
         integer writePointer = 1;
         
         for (integer readPointer = 1; readPointer < dplctList.Size(); readPointer++) {
          // If the current element we're reading is *different* to the previous element...
          if (dplctList[readPointer] != dplctList[readPointer - 1]) {
              // Copy it into the next position at the front, tracked by writePointer.
              dplctList[writePointer] = dplctList[readPointer];
              // And we need to now increment writePointer, because the next element
              // should be written one space over.
              writePointer++;
          }
        }
         
       return dplctList;
       
    }
    
    public static void testScenario(){
        
        list<Duplicate> dplct = new list<Duplicate>();

        integer j =0;
        for(integer i = 0;i<=200000;i++){
            Duplicate dpl= new Duplicate();
            dpl.name = 'number '+String.valueOf(i);
            dpl.amount = j;
            dplct.add(dpl);
            Integer count= math.mod(i, 5);
            
            if(count == 0){
                j++;
            }
        }
        Duplicate.removeDuplicateV2(dplct);
     }
            
}
trigger AccountTrigger2 on Account (before insert,before update,after insert,after update) {
  
    if(trigger.isInsert & trigger.isBefore){
        for(account acc : trigger.new){
            
            if(acc.name == 'Telus'){
                //acc.addError('duplicate account');
            }
                
            if(acc.name == 'Telus3'){
                //acc.addError('duplicate account');
            }
            
            if(acc.name == 'Telus2'){
                //acc.addError('duplicate account....');
            }
        }
    }
    
   
   
}
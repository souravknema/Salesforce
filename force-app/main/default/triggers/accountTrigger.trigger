trigger accountTrigger on Account (after update,before insert) {
  
  //list<account> acc = [select name from account where id not in:trigger.newMap.keySet()];
  //acc[0].name = 'change name';
  //update acc;
  
  if(trigger.isBefore & trigger.isInsert){
      for(account a : trigger.new){
        a.name = 'Telus';
      }
   }
  
}
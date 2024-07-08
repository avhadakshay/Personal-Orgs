global class testBatch implements Database.Batchable<sObject> {
     
    integer numberofDirectCustomers = 0;
     
    global Database.QueryLocator start(Database.BatchableContext bc){
        String soqlQuery = 'SELECT Name, AccountNumber, Type From Account LIMIT 10';
        return Database.getQueryLocator(soqlQuery);
    }
     
    global void execute(Database.BatchableContext bc, List<Account> scope){
         
        for (Account acc : scope){
            //if(acc.Type.equals('Customer - Direct')){
                numberofDirectCustomers++;
            System.debug('numberofDirectCustomers: '+numberofDirectCustomers);
           // }
        }
    }
     
    global void finish(Database.BatchableContext bc){
         System.debug('numberofDirectCustomers: '+numberofDirectCustomers);
    }
}
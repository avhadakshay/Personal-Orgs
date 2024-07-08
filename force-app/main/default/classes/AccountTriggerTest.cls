@isTest
public class AccountTriggerTest {
    
    @isTest static void testAccountInsert() {
        
        Account acc = new Account(Name = 'Trigger Test Acc');
        insert acc;
        
        acc.Name = 'Trigger Test';
        update acc;
        
        Delete acc;
        Undelete acc;
    }
}
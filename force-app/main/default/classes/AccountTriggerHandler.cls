public class AccountTriggerHandler {

    public static void beforeInsert() {
        System.debug('This is a before insert Trigger');
        
    }
    
    public static void afterInsert() {
        System.debug('This is a after insert Trigger');
        List<Account> acc = trigger.new;
        System.debug('Account Name: '+acc[0].id);
    } 
    
    public static void beforeUpdate() {
        System.debug('This is a before update Trigger');
        List<Account> acc = trigger.old;
        System.debug('Account Name: '+acc[0].id);
    }
    
    public static void afterUpdate() {
        System.debug('This is a after update Trigger');
        List<Account> acc = trigger.old;
        System.debug('Account Name: '+acc[0].id);
    }
    
    public static void beforeDelete() {
        System.debug('This is a before delete Trigger');
        List<Account> acc = trigger.old;
        System.debug('Account Name: '+acc[0].id);
    }
    
    public static void afterDelete() {
        System.debug('This is a after delete Trigger');
        List<Account> acc = trigger.old;
        System.debug('Account Name: '+acc[0].id);
    }
    
    public static void afterUndelete() {
        System.debug('This is a after undelete Trigger');
        List<Account> acc = trigger.new;
        System.debug('Account Name: '+acc[0].id);
    }
}
trigger testtrr on Contact (before insert, after insert, before update, after update) {
    if(Trigger.isInsert && Trigger.isBefore) {
        System.debug('Value: '+Trigger.new[0].test_formula_field__c);
    }
    if(Trigger.isInsert && Trigger.isAfter) {
        System.debug('Value: '+[Select id,test_formula_field__c From Contact Where ID =:Trigger.new[0].ID].test_formula_field__c);
        System.debug('Value: '+Trigger.new[0].test_formula_field__c);
    }
    
    if(Trigger.isUpdate && Trigger.isBefore) {
        System.debug('Value: '+Trigger.new[0].test_formula_field__c);
    }
    
    if(Trigger.isUpdate && Trigger.isAfter) {
        System.debug('Value: '+Trigger.new[0].test_formula_field__c);
    }
}
trigger AccountTrigger on Account (before insert, before update, before delete, after insert, after update, after delete, after undelete) {
    
    if (Trigger.isInsert) {
        
        if (Trigger.isBefore) {
            
            AccountTriggerHandler.beforeInsert();
        }
        else if (Trigger.isAfter) {
            
            AccountTriggerHandler.afterInsert();
            
        }
    }
    
    else if (Trigger.isUpdate) {
        
        if (Trigger.isBefore) {
            
            AccountTriggerHandler.beforeUpdate();
        }
        else if (Trigger.isAfter) {
            
            AccountTriggerHandler.afterUpdate();
        }
    }
    
    else if (Trigger.isDelete) {
        
        if (Trigger.isBefore) {
            
            AccountTriggerHandler.beforeDelete();
        }
        else if (Trigger.isAfter) {
            
            AccountTriggerHandler.afterDelete();
        }
    }
    
    else {
        
        AccountTriggerHandler.afterUndelete();
    }
}
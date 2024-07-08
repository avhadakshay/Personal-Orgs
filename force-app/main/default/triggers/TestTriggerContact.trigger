trigger TestTriggerContact on Contact (after insert, after update, after delete, after undelete) {
	Set<String> firstnameSet = new Set<String>();
    Set<ID> accountIDs = new Set<ID>();
    List<Account> accList = new List<Account>();
    
    if(Trigger.IsInsert || Trigger.IsUpdate || Trigger.IsUndelete) {
        for(Contact conObj : Trigger.New) {
            accountIDs.add(conObj.AccountID);
        }
    }
    if(Trigger.IsDelete) {
        for(Contact conObj: Trigger.Old) {
            accountIDs.add(conObj.AccountID);
        }
    }
    
    if(!accountIDs.isEmpty()) {
        for(Account acc: [SELECT id,Description, (SELECT id,FirstName From Contacts) FROM Account WHERE ID IN : accountIDs]) {
            for(Contact conObj: acc.Contacts) {
                firstnameSet.add(conObj.FirstName);
            }
            
            acc.Description = firstnameSet+'';
            accList.add(acc);
        }
        update accList;
    }
    
    
}

//Write a trigger to create a unique list of contact first name and 
//populate in Account decription field whenever a contact is 
//inserted/updates/deleted/undeleted
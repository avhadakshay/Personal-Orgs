public class AssignmentClass {
    
    public void createAccounts(integer count, String lastName) {
        
        List<Account> accountList = new List<Account>();
        
        for (integer i = 0; i < count; i++ ) {
            
            Account a = new Account(Name = lastName + i);
            accountList.add(a);
        }
        insert accountList;
        
    }
    
    public void updateAccounts(set<id> accIdSet) {
        
        List<Account> accountList = new List<Account>();
        
        for(Account a: [SELECT name from Account where id = :accIdSet]) {
            
            if(a.Name.contains('akshay')) {
                a.Description = 'This is a test ';
                accountList.add(a);
            }
            
        }
        update accountList;
    }
    
    
    public void deleteAccount(set<id> accIdSet) {
        
        List<Account> accountList = new List<Account>();
        
        for (Account a: [SELECT id,(SELECT id FROM Contacts) FROM Account WHERE id = :accIdSet]) {
            
            if (a.Contacts.size() == 0) {
                accountList.add(a);    
            }
            
            
        }
        delete accountList;
    }
    
    public void undeleteAccount(set<id> accIdSet) {
        
        List <Account> accountList = new List<Account>();
        for (Account a: [SELECT Id FROM Account WHERE   id = :accIdSet]) {
            
            accountList.add(a);
        }
        System.debug(accountList.Size()+'  Size');
        try {
            undelete accountList;    
        }
        catch(Exception e) {
            system.debug(e.getMessage());
        }
          
    }
    
    public static void mergeAccount(Id masterId,set<id> setAccChildId) {
        
        Account masterAccount;
        List<Account> childAccount = new List<Account>();
        for(Account a: [SELECT id from Account where id = :masterId]) {
            for (Account b: [SELECT id from Account where id = :setAccChildId]) {
                
                childAccount.add(b);
            }
            masterAccount = a;
        }
        
        merge masterAccount childAccount;
    }
    
    
    public static List<Contact> upward() {

		System.debug([SELECT id,name,AccountId from Contact]);        
        return [SELECT id,name,AccountId from Contact];
    }
    
    public static List<Account> downward() {
        
        List<Account> accountList = [SELECT id,name,(SELECT name from Contacts) from Account];
        
        for (integer i = 0; i < accountList.size(); i++) {
        
            System.debug('Account Name: '+ accountList[i].id);
            for(Contact c: accountList[i].Contacts) {
                
                System.debug('Contact Name: '+c.Name);
                
            }
            
        }
        
       
        System.debug([SELECT id,(SELECT name from Contacts) from Account]);
        return [SELECT id,(SELECT name from Contacts) from Account];
        
    }
    
    public static void soslFunction(String searchString) {
        
        
        List<List<sObject>> returnList = [FIND :searchString IN ALL FIELDS RETURNING ACCOUNT(name)];
        System.debug(returnList);
        
    }
    
    
    
 
}
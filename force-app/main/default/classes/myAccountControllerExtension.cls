public class myAccountControllerExtension {

    public Account acc;
    public myAccountControllerExtension (Apexpages.standardcontroller controller) {
        
        this.acc = (Account) controller.getRecord(); 
        
    }
    //cimal asd = acc.AnnualRevenue * 2;
    //ring qwe =  asd + '';
    
    public string getShowMessage () {
        return 'Welcome ' +  UserInfo.getName() + ' to ' + acc.AnnualRevenue * 2;
    }
    
    public pagereference calculate() {
        return null;
    }
    
}
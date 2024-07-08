public class newApex {

    public List<Account> accList {get; set;}
    
    public newApex(ApexPages.StandardSetController controller) {
        this.accList = (List<Account>) controller.getSelected();
    }
    
}
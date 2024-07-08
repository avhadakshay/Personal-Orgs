public class actionOnButton {
    private Account acc;
    public String message {get; set;}
    
    public actionOnButton (ApexPages.StandardController controller ) {
        this.acc = (Account) controller.getRecord();
    }
    
    public pageReference  showMessage() {
        message = 'This is the details page';
        return null;
    }

}
public class AjaxDemoController {

    public String message {get; set;}
    public Account acc {get; set;}
    public String warningMessage {get;set;}
    
    public AjaxDemoController() {
    	message = 'Before Check';    
        warningMessage = 'Before Warning';
        acc = [select id, name, type from account limit 1];
    }
    
    public void display() {
        if(message == 'Before Check') {
            message = 'After Check';
        }
        else {
            message = 'Before Check';
        }
    }
    
    public void ShowWarning () {
        warningMessage = 'Warning Message Shit';
    }
}
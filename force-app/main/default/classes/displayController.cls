public class displayController {

    public String message {get; set;}
    
    public displayController () {
        message = ApexPages.currentPage().getparameters().get('id');
        
    }
}
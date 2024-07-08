public class googleController {

    public Account acc {get;set;}
    public String message {get;set;}
    
    public googleController () {
        acc = [select id, name from account limit 1];
        //Pagereference newPageForParamPassing = Page.newPageForParamPassing;
    	message = ApexPages.currentPage().getParameters().get('id');    
    }
    
    public pageReference openGoogle() {
        
        //Pagereference googlePage = new Pagereference('http://www.google.com');
        //return googlePage;
        ////////////////////////////////////
        Pagereference newPageForParamPassing = Page.newPageForParamPassing;
        newPageForParamPassing.getParameters().get('id');
    	message = newPageForParamPassing.getParameters().get('id');    
        return newPageForParamPassing;
    }
}
public with sharing class AttachmentUploadController 
{
    public String parentId {get;set;}
    public Document attach {get;set;}
   
    public AttachmentUploadController()
    {
        attach = new Document();
        
    }
   
    //When user clicks upload button on Visualforce Page, perform upload/insert
    //Redirect user to newly inserted document
    
    public void upload()
    {
        
        //This shows how to insert an Attachment
        //attach.ParentId = parentId;
        //insert attach;
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.draftable.com/v1/comparisons');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setheader('Authorization', 'Token be470bfc8f9c1a907231c0a709fbbf85');
        string body='{\"left\": {\"left.file\": \"'+attach.body+'",\"display_name\": \"Old\",\"file_type\": \"pdf\"},\"right\": {\"right.file\": \"'+attach.body+'",\"display_name\": \"New\",\"file_type\": \"pdf\"}}';
        request.setbody(body);

        HttpResponse response = http.send(request);
        // Parse the JSON response
        System.debug(response.getBody());
        ApexPages.addmessage(new ApexPages.message(ApexPages.severity.WARNING,'Response From Draftable : '+response.getBody()));
        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        message.toAddresses = new String[] { 'akshay.avhad@reisystems.in', 'akshay.avhad@reisystems.in' };
        message.optOutPolicy = 'FILTER';
        message.subject = 'Opt Out Test Message';
        message.plainTextBody = 'This is the message body.'+response.getBody();
        Messaging.SingleEmailMessage[] messages =   new List<Messaging.SingleEmailMessage> {message};
        Messaging.SendEmailResult[] results = Messaging.sendEmail(messages);

        //return new ApexPages.Standardcontroller(attach).view();   
    }
}
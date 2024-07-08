public class brokerCustomController {

    public Broker__c broker {get;set;}
    public String brokerID {get;set;}
    
    public brokerCustomController (ApexPages.StandardController controller) {
        this.broker = (Broker__c)  controller.getRecord();
        brokerID = ApexPages.currentPage().getParameters().get('brokerID');
        broker = [SELECT name,title__c,phone__c,email__c from Broker__c WHERE ID = :brokerID];
    }
}
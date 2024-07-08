// ChatbotController.cls
public with sharing class ChatbotController {
    @AuraEnabled(cacheable=false)
    public static String sendMessageToApi(String message) {
        // Prepare the message data
        Map<String, String> requestData = new Map<String, String>();
        requestData.put('msg', message);
        String requestBody = JSON.serialize(requestData);

        // Set up the HTTP request
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://chatbot.reisystems.in:5000/chat');
        req.setMethod('POST');
        req.setHeader('Content-Type', 'application/json');
        req.setBody(requestBody);

        // Send the HTTP request
        Http http = new Http();
        HttpResponse res = http.send(req);

        // Check the response status
        if (res.getStatusCode() == 200) {
            // Parse the response
            Map<String, Object> responseData = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
            String reply = (String) responseData.get('reply');
            return reply;
        } else {
            // Handle the error response
            System.debug('HTTP request failed with status code: ' + res.getStatusCode());
            return 'Error: Unable to get response from the API';
        }
    }
}
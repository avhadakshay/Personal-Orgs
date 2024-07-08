// chatbot.js
import { LightningElement, track } from 'lwc';
import sendMessageToApi from '@salesforce/apex/ChatbotController.sendMessageToApi'; // Assuming you have an Apex method to call the API

export default class Chatbot extends LightningElement {
    @track userInput = '';
    @track chatHistory = [];

    handleKeyUp(event) {
        if (event.keyCode === 13) {
            this.sendMessage();
        }
    }

    sendMessage() {
        const message = this.userInput.trim();
        if (message) {
            this.chatHistory.push({ id: Date.now(), sender: 'user', text: message });
            this.userInput = ''; // Clear input field

            // Call Apex method to send message to API
            sendMessageToApi({ message: message })
                .then(response => {
                    const botResponse = response; // Assuming API returns a response text
                    console.log('aaaaaaaaaaaaaaaaa: '+response);
                    this.chatHistory.push({ id: Date.now(), sender: 'bot', text: botResponse });
                })
                .catch(error => {
                    console.error('Error sending message to API: ', error);
                    // Handle error response
                });
        }
    }
}
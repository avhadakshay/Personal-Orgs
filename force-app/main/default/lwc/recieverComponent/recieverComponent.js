import { LightningElement, track } from 'lwc';
export default class RecieverComponent extends LightningElement {
    @track message = '';

    connectedCallback() {
        // Add an event listener for the custom event
        this.addEventListener('sendtrue', this.handleTrueEvent);
    }
    
    handleTrueEvent(event) {
        // Check if the received value is "true"
        if (event.detail === true) {
            // Set the message to "Hello World"
            this.message = 'Hello World';
        }
    }
}
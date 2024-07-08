import { LightningElement } from 'lwc'; 

export default class SenderComponent extends LightningElement {
    sendTrueToReceiver() {
        // Create and dispatch a custom event to send "true" to ReceiverLWC
        const event = new CustomEvent('sendtrue', {
            detail: true // You can send any data you want here
        });
        this.dispatchEvent(event);
    }
}
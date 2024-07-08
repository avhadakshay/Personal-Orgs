import { LightningElement } from 'lwc';
export default class TwitterComponent extends LightningElement {
    connectedCallback() {
    // Dynamically create a script element and set its attributes
    const script = document.createElement('script');
    script.src = 'https://platform.twitter.com/widgets.js';
    script.charset = 'utf-8';

    // Append the script element to the body of the document
    document.body.appendChild(script);
  }

}
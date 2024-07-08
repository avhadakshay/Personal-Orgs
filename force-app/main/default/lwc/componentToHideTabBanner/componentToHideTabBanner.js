import { LightningElement } from 'lwc';
import phasesLevel from '@salesforce/resourceUrl/phasesLevel';
import { loadStyle } from 'lightning/platformResourceLoader';
export default class ComponentToHideTabBanner extends LightningElement {
    connectedCallback() {
            loadStyle(this, phasesLevel).then(() => {
              console.log('PlanningLWC loaded loadstyle');
            });
    }
}
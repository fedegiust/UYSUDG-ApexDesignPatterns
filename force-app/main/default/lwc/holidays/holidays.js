import { LightningElement, track } from 'lwc';
import retrieveContacts from '@salesforce/apex/HolidaysHandler.retrieveContacts';
import getHolidaysBonus from '@salesforce/apex/HolidaysHandler.getHolidaysBonus';

export default class Holidays extends LightningElement {
    @track cts = [];
    selectedCt = '';
    bonusInfo = '';

    connectedCallback(){
        retrieveContacts()
            .then(result => {
                result.forEach(el => {
                    console.log(JSON.parse(JSON.stringify(el)));
                    this.cts.push({
                        selected : false,
                        name : el.Name,
                        country : el.MailingCountry,
                        id : el.Id
                    })
                })

                console.log(JSON.parse(JSON.stringify(this.cts)));
            })
    }

    selectCt(event){
        this.selectedCt = '';
        this.cts.forEach(el => {
            if (el.id != event.target.dataset.id){
                el.selected = false;
            }
            else{
                if (event.detail.checked){
                    this.selectedCt = event.target.dataset.id;
                    el.selected = true;
                }
            }
        })
    }

    get disableButton(){
        return !this.selectedCt;
    }

    handleClick(){
        let ctInfo;
        this.cts.forEach(el => {
            if (this.selectedCt == el.id){
                ctInfo = el;
            }
        })
        console.log(JSON.parse(JSON.stringify(ctInfo)));
        getHolidaysBonus({empId : ctInfo.id, country : ctInfo.country})
            .then(result => {
                console.log(result);
                this.bonusInfo = ctInfo.name+' has a bonus of '+result;
                console.log(this.bonusInfo);
            })
            .catch(error => {
                console.error(error);
            })
    }

}
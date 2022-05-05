public with sharing class StoreOrder extends OrderProcessTemplate{
    public override void doSelect(){
        System.debug('In doSelect by StoreOrder');
    }
    
    public override void doPayment(){
        System.debug('In doPayment by StoreOrder');
    }
}
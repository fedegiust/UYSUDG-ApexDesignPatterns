public with sharing class NetOrder extends OrderProcessTemplate{
    public override void doSelect(){
        System.debug('In doSelect by NetOrder');
    }
    
    public override void doPayment(){
        System.debug('In doPayment by NetOrder');
    }
}

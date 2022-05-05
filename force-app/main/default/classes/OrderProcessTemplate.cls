public virtual class OrderProcessTemplate {
    public virtual void doSelect(){}
    public virtual void doPayment(){}
    public virtual void doDelivery(){
        System.debug('In doDelivery by OrderProcessTemplate');
    }
    public void processOrder(){
        doSelect();
        doPayment();
        doDelivery();
    }
}

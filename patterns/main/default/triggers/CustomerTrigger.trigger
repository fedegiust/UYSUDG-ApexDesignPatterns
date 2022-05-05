trigger CustomerTrigger on Customer__c (before insert, before update) {
    for (Customer__c cust: Trigger.new) { 

        if (cust.Type__c == 'Car') { 

            //Instantiate the Carproduct class to get Car product Id. 

            //CarProduct carId = new CarProduct(); 
            CarProduct carId = CarProduct.getInstance(); 

            cust.Product__c = carId.recordId;   

        }   

   } 
}
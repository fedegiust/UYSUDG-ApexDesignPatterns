public class CarProduct{ 

    public static CarProduct instance = null; 
    public Id recordId; 

    public CarProduct(){  

        //To get the record Id for a product named “Car”.  
        //If a trigger is executed in bulk, it exceeds the SOQL limitation. 
        if (recordId == null) {
            System.debug('Ejecutamos la query');
            recordId = [SELECT Id FROM Products__c WHERE Name = 'Car'].Id; 
        }

    } 

    public static CarProduct getInstance(){ 

        if (instance == null) {
            instance = new CarProduct(); 
        }

        return instance; 

    }     


}
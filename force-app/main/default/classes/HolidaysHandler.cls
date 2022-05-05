public with sharing class HolidaysHandler {
    @AuraEnabled
    public static List<Contact> retrieveContacts(){
        try {
            return [SELECT Id, Name, MailingCountry FROM Contact WITH SECURITY_ENFORCED LIMIT 100];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled
    public static Double getHolidaysBonus(Id empId, String country){
        try {
            return HolidaysDispatcher.getHolidaysBonus(empId, country);
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
        
    }
}

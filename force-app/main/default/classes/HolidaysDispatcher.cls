public with sharing class HolidaysDispatcher {
    public static double getHolidaysBonus(Id empId, String country){
        List<Holidays_Conf__mdt> confMetadata = [
            SELECT ClassName__c 
            FROM Holidays_Conf__mdt 
            WHERE DeveloperName = :country AND ClassName__c != NULL WITH SECURITY_ENFORCED LIMIT 1];
        if (confMetadata.isEmpty()){
            //Agrego esto para que se vea más clara la diferencia.
            HolidaysFixedBonus holClass = new HolidaysFixedBonus();
            return holClass.calculateBonus(empId);
        }
        else{
            Type t = Type.forName(confMetadata[0].ClassName__c);
            HolidaysInterface holidayClass = (HolidaysInterface)t.newInstance();
            return holidayClass.calculateBonus(empId);
        }    
    }
}

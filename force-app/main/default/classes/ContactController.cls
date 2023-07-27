public with sharing class ContactController {
    @AuraEnabled(cacheable=true)
    public static List<Contact> getSingleContact() {
        List<Contact>conList=[SELECT Id, Name, Title, Phone, Email
        FROM Contact
        WITH SECURITY_ENFORCED ];
        
        return conList;
            
    }
}
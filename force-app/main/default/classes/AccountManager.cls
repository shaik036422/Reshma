@RestResource(Urlmapping='/Accounts/*/contacts')
global with sharing class AccountManager 
{
    @HTTPGET
    global static Account getAccount()
    {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        String accountId = request.requestURI.substringBetween('Accounts/','/contacts');
        Account result =  [SELECT id,name,phone,(select id,firstname,lastname from Contacts) from Account
                        WHERE Id = :accountid];
        return result;
    }
    

    }
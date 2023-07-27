public class HttpCallOutExample {
    //public HttpCallOutExample()

    public static void makeHttpGetCallout() 
    {
        
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://d5j0000033o9ceaa-dev-ed.my.salesforce.com/services/apexrest/AccountsService/');
        request.setMethod('GET');
        string requestbody = 'grant_type=client_credentials';
               requestbody = '&client_id=3MVG9pRzvMkjMb6m4EIcD60fVg._wFE4B3Im8zMidOsPo5pv8sNxFM.Nppb6ND4iR8WHfFkqy3n7dJ.LIsPyQ';
                   requestbody = '&client_secret=9B72043D00D570395196D6C35E2ABB41A5CCF37C6C3F83478D7BEE8EEE2752EB';
                   request.setBody(requestbody);
        //request.setHeader('Authorization', 'Bearer 00D5j0000033o9c!ARcAQNKowAF113kVwmyLF9uTdRpOSrq8XYoVm_AYnPytbuo.aLSNPm5qddQ_.PodeCC1izlSfEN2f4iQ.qWjNUl9oWxz77F_');
        HttpResponse response = http.send(request);

        if (response.getStatusCode() == 200) {
            // Parse the JSON response into a list of Account records
            List<Account> accounts = (List<Account>) JSON.deserialize(response.getBody(), List<Account>.class);
            List<Account> acclist = new List<Account>();
            
            // Process the Account records
            for(Account acc : accounts) {
                Account a = new Account();
                a.Name = acc.Name;
                a.Phone= acc.Phone;
                a.Fax = acc.Fax;
                acclist.add(a);
                
                /*System.debug('Account Name: ' + acc.Name);
                System.debug('Account Industry: ' + acc.Industry);
                System.debug('Account Phone: ' + acc.Phone);*/
                
            }
                    insert acclist;
            System.debug(acclist);
            
        } 

        else {
            System.debug('HTTP request failed with status: ' + response.getStatusCode() + ' - ' + response.getStatus());
        }
    }
}
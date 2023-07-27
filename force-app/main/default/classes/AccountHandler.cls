public with sharing class AccountHandler 
{
    public static void insertAccount(Integer NumberofnewAccounts) 
    {
        Integer counter = 1;
        List<Account> addAccounts = new List<Account>();
        while(counter < =NumberofnewAccounts)
        {
            System.debug('Counter value Before Implementing'+counter);
            Account a = new Account();
            a.Name =  'Acme Inc N'+counter;
            a.AccountNumber = 'A000n'+counter;
            addAccounts.add(a);
            System.debug(addAccounts);
            counter = counter+1;
            System.debug('Counter Value After Implementing'+counter);
        }
        System.debug('Size of Account List: ' + addAccounts.size() );
        System.debug('Elements in Account List: ' + addAccounts);
        //insert all of the accounts in the list
        insert addAccounts;
}
}
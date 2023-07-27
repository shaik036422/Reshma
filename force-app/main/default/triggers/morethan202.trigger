trigger morethan202 on Account (before insert) 
{
    if(Trigger.isinsert && Trigger.isbefore)
    {
        List<Account> acc = new List<Account>();
        for(Account a : trigger.new)
        {
            if(a.Active__c == 'yes')
            {
            a.name = 'test';
            a.phone = '123456';
            a.Active__c = 'No';
            acc.add(a);
  
    }

}
    }
}
public without sharing class DailyLeadProcessor implements Schedulable{

    public void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id, LeadSource
            FROM Lead
            WHERE LeadSource = null Limit 200];
        // Create a task for each opportunity in the list
        for(Lead l: leads){
            l.LeadSource ='Dreamforce';
        }
        update leads;
    } 
}
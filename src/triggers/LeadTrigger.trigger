trigger LeadTrigger on Lead (before insert, before update, before delete, after insert,after update, after delete, after undelete) {

	

	System.debug('Trigger.isInsert: ' + Trigger.isInsert);
	System.debug('Trigger.isUpdate: ' + Trigger.isUpdate);
	System.debug('Trigger.isDelete: ' + Trigger.isDelete);
	System.debug('Trigger.isUndelete: ' + Trigger.isUndelete);


	System.debug('Trigger.isBefore: ' + Trigger.isBefore);
	System.debug('Trigger.isAfter: ' + Trigger.isAfter);






	// Records in new state being inserted to the DB
	List<Lead> leads = Trigger.new;
	Map<Id, Lead> leadMap = Trigger.newMap;

	// Records are populated with old values before update
	List<Lead> oldLeads = Trigger.old;
	Map<Id, Lead> oldLeadMap = Trigger.oldMap;

	System.debug('Trigger.new: ' + Trigger.new);
	System.debug('Trigger.newMap: ' + Trigger.newMap);
	System.debug('Trigger.old: ' + Trigger.old);
	System.debug('Trigger.oldMap: ' + Trigger.oldMap);




	// Common way to choose what code to call and when
	if(Trigger.isBefore && trigger.isInsert){
		// Call your code to do stuff
		// Call helper methods

		// Change first lead title to BOSS - NO DML NEEDED IN "BEFORE" CONTEXT
		leads[0].Title = 'BOSS';


	}else if(Trigger.isAfter && trigger.isUpdate){
		// Do tuff after update!
		//Call helper methods

		leads[0].Title = leads[0].Id;

	}




}
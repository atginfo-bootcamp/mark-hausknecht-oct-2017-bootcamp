public with sharing class ContactTriggerHelper {

	public static void handleAfterInsert(List<Contact> contacts){
		// If contact has an assigned, update number of contacts on account
		List<Account> accounts = queryAccountsFromContacts(contacts);

		updateAccountNumberOfContacts(accounts);
	}

	public static void handleAfterUpdate(List<Contact> contacts, Map<Id, Contact> oldContactMap){
		// Loop through contacts
		// Check if accountId was changed
		// 1) null -> not null ---> update the account (number of contacts)
		// 2) not null -> null ---> update the old account (number of contacts)
		// 3) not null -> not null ---> (contact assigne to different account) ---> update account

		Set<Id> accountIds = new Set<Id>();

		for(Contact contact : contacts){
			Contact oldContact = oldContactMap.get(contact.Id);
			if(contact.AccountId != oldContact.AccountId){
				// The account id was changed!
				if(contact.AccountId != null){
					accountIds.add(contact.accountId);
				}
				if(oldContact.AccountId != null){
					accountIds.add(oldContact.AccountId);
				}
			}
		}

		List<Account> accounts = queryAccounts(accountIds);

		updateAccountNumberOfContacts(accounts);

	}

	public static void	handleAfterDelete(List<Contact> contacts){

	}

	private static List<Account> queryAccountsFromContacts(List<Contact> contacts){
		
		SET<Id> accountIds = new Set<Id>();

		for(Contact contact : contacts){
			if(contact.accountId != null){
				accountIds.add(contact.accountId);
			}
		}
		return queryAccounts(accountIds);

	}

	private static List<Account> queryAccounts(Set<Id> accountIds){
		List<Account> accounts = new List<Account>();

		// if(!accountIds.isEmpty()) // Alternate syntax
		if(accountIds.size() > 0){
			accounts = [
			SELECT Id, Current_Number_of_contacts__c,
				(SELECT Id FROM Contacts)
			FROM Account 
			WHERE Id IN :accountIds];
		}

		return accounts;
	}

	private static void	updateAccountNumberOfContacts(List<Account> accounts){
		if(accounts.size() > 0){
			for(Account account : accounts){
				Integer numberOfContacts = account.Contacts.size();
				account.Current_Number_of_contacts__c = numberOfContacts;
			}

			update accounts;
		}
	}
}
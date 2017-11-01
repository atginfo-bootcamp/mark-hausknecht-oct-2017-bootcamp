public with sharing class Day5Maps {
	
	public static void example(String name){

		// For review this is the synta of a list
		List<String> namesList = new List<String>();

		namesList.add('Betty');
		namesList.add('John');
		namesList.add('Jack');
		namesList.add('Paul');

		// Keep track if name is found
		Boolean foundName = false; 

		for(String currentName : namesList){
			if(currentName == name){
				System.debug('Found name in list: ' + name);
				foundName = true;
				break; // This exists out of for loop
			}
		}


		// If foundName is false
		if(!foundName){
			System.debug('Name not found in list: ' + name);
		}	



		Map<String, String> namesMap = new Map<String, String>();

		namesMap.put('Betty', 'Betty Boop');
		namesMap.put('John', 'John Bon');
		namesMap.put('Jack', 'Jack The Ripper');
		namesMap.put('Paul', 'Paul Simmon');

		if(namesMap.containsKey(name)){
				System.debug('Found name in map: ' + name);
			} else{
				System.debug('Name not found in map: ' + name);
			}

	}


	public static void associateContactsToAccounts(String name){

		// Alternate syntax
		// Map<Id, Account> accountMap = new Map<Id, Account>([SELECT Id,Name FROM Account]);

		List<Account> accountList = [SELECT Id,Name FROM Account];
		Map<Id, Account> accountMap = new Map<Id, Account>(accountList);

		List<Contact> contacts = [
			SELECT Id,FirstName, LastName, Name, AccountId
			FROM Contact
		];

		// Loop through contacts
		// Print out the name of the contact and the account name


		for(Contact currentContact : contacts){
			if(accountMap.containsKey(currentContact.AccountId)){
				System.debug('Name of the contact: ' + currentContact.Name);
				System.debug('Account name: ' + accountMap.get(Name));
			
				break; 
			}
		}

	}


}
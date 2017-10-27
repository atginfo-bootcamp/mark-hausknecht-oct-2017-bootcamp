// To invoke from dev console: Day3ListsAndLoops.execute()
public with sharing class Day3ListsAndLoops {

	public static void execute(){

		// Creat string variable called myName
		String myName = 'Mark';

		// Create new empty list called names
		// THIS IS THE PREFERRED WAY TO INITIALIZE
		List<String> names = new List<String>();

		// Create new list with default values
		List<String> students = new List<String>{'Student 1', 'Student 2'};

		// Alternate syntax for creating a new array (list) with 20 empty items
		String[] employees = new String[20];

		names.add('Mark');
		names.add('Mathew');
		names.add('Luke');
		names.add('John');

		System.debug('names: ' + names);

		// Remove item at index 3, which is John
		names.remove(3);

		System.debug('names after last element removed: ' + names);

		// dynamically remove last element in array
		names.remove(names.size() -1);

		System.debug('names after removing names.size(): ' + names);


		Set<String> uniqueNames = new Set<String>();

		uniqueNames.add('Mark');
		uniqueNames.add('Mathew');
		uniqueNames.add('Luke');
		uniqueNames.add('John');
		uniqueNames.add('Cane');
		uniqueNames.add('Abel');
		uniqueNames.add('Mark');
		uniqueNames.add('Mark');

		// Store the number of items in our set
		Integer setSize = uniqueNames.size();

		System.debug('uniqueNames: ' + uniqueNames);
		System.debug('setSize(): ' + setSize);


	}


	public static void executeLoops(){


		// for loop takes three parameters
		// index variable
		// condition
		// counter variable

		for(Integer i = 0; i < 10; i++){
			System.debug('i: ' + i);
		}

		List<String> names = new List<String>();

		names.add('Mark');
		names.add('Mathew');
		names.add('Luke');
		names.add('John');

		
		for(Integer i = 0; i < names.size(); i++){
			System.debug(names.get(i));
		}

		for(Integer i = 0; i < names.size(); i++){
			System.debug(names[i]);
		}


		// Advance for loop - loop every item in list
		for(String name : names){
			System.debug(name);
		}

	}


	public static void createNewAccount(){

		Account myAccount = new Account();
		myAccount.Name = 'atg';

		System.debug('myAccount before insert: ' + myAccount);

		insert myAccount;

		System.debug('myAccount after insert: ' + myAccount);

		Account myAccountMark = new Account();
		myAccountMark.Name = 'Mark Account';
		myAccountMark.Type = 'Customer - Direct';

		System.debug('myAccount before insert: ' + myAccount);

		insert myAccountMark;

		System.debug('myAccount after insert: ' + myAccount);

	}

	public static void updateExistingAccount(){
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type 
			FROM Account 
			WHERE Name = 'atg' 
			LIMIT 1
		];

		System.debug(queriedAccounts);

		if(queriedAccounts.size() > 0){
			Account myAccount = queriedAccounts[0];
			myAccount.Name = 'Changed Account Name';
			update myAccount;
		}
	}


	public static void updateAccountTypeOnEveryAccount(){

		// Query all accounts
		// Print out all Accounts to console
		// Loop through accounts
		// Update Type to = 'Other'
		// Print out the Account to the console
		// Update Accounts DML 'update'
		List<Account> queriedAccounts = [
			SELECT Id, Name, Type 
			FROM Account 
		];

		System.debug(queriedAccounts);

		For(Integer i = 0; i < queriedAccounts.size(); i++){
			System.debug(queriedAccounts[i]);
			queriedAccounts[i].Type = 'Other';
		}
		
			update queriedAccounts;
		
		System.debug(queriedAccounts);
	}

}
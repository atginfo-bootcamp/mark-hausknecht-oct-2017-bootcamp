@isTest
private class ContactTriggerHelperTests {

	private static void stageData(Integer numAccounts, String accountName){

		// Create new accounts based on numAccounts parameter
		// Set up account fields (i.e. uae accountName)
		// Need to insert Accounts to the database
		// Query our accounts from the DB
		// Loop through accounts
		// Create some contacts for each account (AccountId populated)
		// Insert all contacts to the database at once

		List<Account> accounts = new List<Account>();

		for(Integer i = 0; i < numAccounts; i ++){
			Account acct = new Account();
			acct.Name = accountName + ' ' + i;
			accounts.add(acct);
		}

		insert accounts;



	}

	
	@isTest static void test_method_one() {
		// Implement test code
	}
	
	@isTest static void test_method_two() {
		// Implement test code
	}
	
}
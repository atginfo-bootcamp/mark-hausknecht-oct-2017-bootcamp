@isTest
private class ApexBootcampUnitTest {
	
	@isTest static void test_method_one() {
		// Implement test code
		List<Lead> leadList  = [
			SELECT ID 
			FROM Lead 
			WHERE Title ='King' 
		];
		//System.assert(leadList != null, 'This code doesnt work');

		String idealTitle = 'Queen';
		for(Lead lead : leadList){
			System.assertNotEquals(lead.Title, idealTitle, 'It\'s good to be queen');
		}

		/* The one above or this one
		String idealTitle = 'King';
		for(Lead lead : leadList){
			System.assertEquals(lead.Title, idealTitle, 'It\'s good to be king');
		}
		*/
	}

	
	@isTest static void test_method_two() {
		// Implement test code

	}
	
}
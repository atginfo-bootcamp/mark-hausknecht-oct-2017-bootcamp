/*
Person Class
A class is made up of the following three elements:

class level proporties
constructor method
all other methods

*/
public class Person {
	// Static variables are shareed across ALL INSTANCES
	private static Boolean isHuman = true;

	//CREATE GETTER AND SETTER METHODS FOR EACH ONE OF THESE
	private String name;
	private String email;
	private String gender;
	private Double weight;
	private Integer age;
	// CREEATE GETTER METHOD
	private final Boolean IS_DEAD;

	public Person(String defaultName) {
		name = defaultName;
		// Alternate syntax
		// this.name = defaultName;
		IS_DEAD = false;
	}

/*
Overloaded constructor
Person fred = new Person('fred', 'foo@bar.com');
*/
	public Person(String defaultName, String defaultEmail){
		name = defaultName;
		email = defaultEmail;
	}

	public Person(String defaultName, String defaultEmail, Boolean defaultIsDead){
		name = defaultName;
		email = defaultEmail;
		IS_DEAD = defaultIsDead;
	}

	public void print(){
		System.debug('Person name: ' + name);
		System.debug('Person email: ' + email);
		System.debug('Person gender: ' + gender);
		System.debug('Person weight: ' + weight);
		System.debug('Person age: ' + age);
		System.debug('Person isDead: ' + IS_DEAD);
		System.debug('Person isHuman: ' + isHuman);
	}


/*
GETTERS AND SETTERS
*/

	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

	public String getEmail(){
		return email;
	}

	public void setEmail(String email){
		this.email = email;
	}

	public String getGender(){
		return gender;
	}

	public void setGender(String gender){
		this.gender = gender;
	}

	public Double getWeight(){
		return weight;
	}

	public void setWeight(Double weight){
		this.weight = weight;
	}

	public Integer getAge(){
		return age;
	}

	public void setAge(Integer age){
		this.age = age;
	}

	public Boolean getIS_DEAD(){
		return IS_DEAD;
	}


	public void setIsHuman(Boolean isHumanVal){
		isHuman = isHumanVal;

	}


}
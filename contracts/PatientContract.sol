pragma solidity ^0.4.4; //Defining solidity version in the first line is necessary

contract PatientContract {

	//Address of the Provider, kept within the blockchain so as to give permissions to the provider to execute certain functions (like adding patients, removing patients, etc)
	address ProviderAdmin; 

	//patientMap that acts like a directory for all patients (think key-value dictionary)
	mapping (address => Patient) patientMap;

	//Function runs when the smart contracts is deployed, i.e. only once - we can thus guarantee that the Administrator will remain constant
	function PatientContract() payable {
		ProviderAdmin = msg.sender;
	}

	//struct for Patient data for code elegance; this is most analogous to Javascript's prototypes, and in extension, the concept of classes within Object-Oriented Programming
	struct Patient {
		string name;
		string email;
		bytes32 incentivetype; //should make this an enum
	}

	//modifier to restrict certain functions to provider only
	//used as a keyword in function definitions
	modifier onlyProvider() {
		require(msg.sender == ProviderAdmin); //require() stops the method from executing if the conditional within the parameters resolves as false; in this case, if the address calling the function is not the Provider, it will prevent it from continuing
		_;
	}

	modifier onlyPatient() {
		//require(msg.sender == ) //need form to confirm only patient accesses their own data
		_;
	}

	//Adds a patient to our records
	//onlyProvider, our modifier from before, so other sources cannot modify the function
	function addPatient(address patientAdd, string n, string e, bytes32 it) onlyProvider returns (bool success){
		if(bytes(n).length != 0){
			patientMap[patientAdd] = Patient(n, e, it);
			return true;
		} else {
			return false;
		}
	}

	//Function to return a patient's data based on their address
	//Similarly restricted for the provider, although perhaps patient should be able to access their own data...?
	function getPatient(address patientAdd) onlyProvider constant returns (string, string, bytes32){ //tentative on this; patientAdd shouldn't cause shadowing, but possible?
		return (patientMap[patientAdd].name, patientMap[patientAdd].email, patientMap[patientAdd].incentivetype);
	}

	//design issues with onlyPatient(needs to be implemented), access
	//Other functions to be created: 
	//getIncentive()? maybe excessive
	//
	//Regarding design:
	//need to establish what data provider and patient has access to; should a provider really be able to access all patient data? Maybe patient selectively specifies which data they agree to give over (email, incentivetype, how close they are to reaching their goal)
	//need to realize which restrictions may be upon our PatientMap; is the best way to store our data? Theory of database construction rests on the concept that databases should be structured in a way to make the most common queries simple, and less common queries can be a little more complex
}

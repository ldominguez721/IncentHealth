pragma solidity ^0.4.4;

contract PatientContract {

	address ProviderAdmin; 

	mapping (address => Patient) patientMap;

	function PatientContract() payable {
		ProviderAdmin = msg.sender;
	}

	struct Patient {
		string name;
		string email;
		bytes32 incentivetype; //should make this an enum
	}

	modifier onlyProvider() {
		require(msg.sender == ProviderAdmin); //modifier to restrict certain functions to provider only
		_;
	}

	function addPatient(string n, string e, bytes32 it) onlyProvider returns (bool success){
		address patientAdd = msg.sender;
		if(bytes(n).length != 0){
			patientMap[patientAdd] = Patient(n, e, it);
			return true;
		} else {
			return false;
		}
	}


}

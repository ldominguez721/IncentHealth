pragma solidity ^0.4.4;

contract PatientContract {

	address ProviderAdmin; 

	mapping (address => Patient) patientMap;

	function PatientContract payable {
		ProviderAdmin = msg.sender;
	}

	struct Patient {
		string name;
		string email;
		bytes32 incentivetype;
		
	}























}

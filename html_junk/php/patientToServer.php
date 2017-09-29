<?php

error_reporting(E_ALL);
ini_set('display_errors', 'on');

$out = fopen("php://stdout", "w");


	$name=($POST['name']);
	$email=($POST['email']);
	$address=($POST['address']);
	//setting up variables
	$username="luisjgkr_incenthealth";
	$password="incenthealth404";
	$serverURL="localhost"; //replace this with localhost for deployment
	$database="luisjgkr_IncentHealth";

	//Connect to server and select database
	$mysqli = new mysqli($serverURL,$username,$password,$database);

	if($mysqli->connect_errno > 0){
    // Let's try this:
    echo "Sorry, this website is experiencing problems.";
    fwrite($out, "Hello World!");

    // Something you should not do on a public site, but this example will show you
    // anyways, is print out MySQL error related information -- you might log this
    echo "Error: Failed to make a MySQL connection, here is why: \n";
    echo "Errno: " . $mysqli->connect_errno . "\n";
    echo "Error: " . $mysqli->connect_error . "\n";

    die('Unable to connect to database [' . $mysqli->connect_error . ']');
}
	$result = $mysqli->query("INSERT INTO patientData (first_name,last_name,email,incentive_type,uport_address) VALUES('Aaron', '" + $name + "','" + $email + "','Classic','0x1702c51f3db95ddd417514adc9b93f62ff593d5b')");
	mysqli_close($mysqli);
?>
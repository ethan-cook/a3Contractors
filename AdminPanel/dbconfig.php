<?php

session_start();

$servername = "localhost";
$username = "adminPanel";
$password = "@panel17";

try 
{
    $conn = new PDO("mysql:host=$servername;dbname=a3Contractors", $username, $password);
    // set the PDO error mode to exception
    $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    //echo "SQL STATUS: Connected successfully"; 
}
catch(PDOException $e)
{
    //echo "SQL STATUS: Connection failed: " . $e->getMessage();
}

include_once 'class.user.php';
$user = new USER($conn);
?>
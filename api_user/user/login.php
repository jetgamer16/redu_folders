<?php

include '../connection.php';

$userEmail = $_POST['user_email'];
$userPassword = $_POST['user_password'];

$sqlQuery = "SELECT * FROM users WHERE email = '$userEmail'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery->num_rows > 0) {
    $userRecord = [];
    while($rowFound = $resultOfQuery->fetch_assoc()) {
        if(password_verify($userPassword, $rowFound['password'])) {
            $userRecord[] = $rowFound;
        } else {
            echo json_encode(array("success" => false));
        }
    }

    echo json_encode(array("success" => true, "userData" => $userRecord[0]));
} else {
    echo json_encode(array("success" => false));
}
<?php
include "../connection.php";

$userName = $_POST["name"];
$userEmail = $_POST["email"];
$userPassword = password_hash($_POST["password"], PASSWORD_DEFAULT);
$now = Date("Y-m-d H:i:s");

$sqlQuery = "INSERT INTO users SET name = '$userName', email = '$userEmail', password = '$userPassword', rol = 'alumn', created_at = '$now', updated_at = '$now'";


$resultOfQuery = $connectNow->query($sqlQuery);

$user = [];

if($resultOfQuery) {
    $sqlQuery2 = "SELECT * FROM users WHERE name = '$userName' AND email = '$userEmail'";

    $resultOfQuery2 = $connectNow->query($sqlQuery2);

    while($rowFound = $resultOfQuery2->fetch_assoc()) {
        $user[] = $rowFound;
    }
    echo json_encode(
        array(
            'success' => true,
            'user' => $user[0]
        )
    );
} else {
    echo json_encode(
        array(
            'success' => false,
        )
    );
}
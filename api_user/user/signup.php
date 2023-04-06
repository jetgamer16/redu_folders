<?php
include "../connection.php";

$userName = $_POST["name"];
$userEmail = $_POST["email"];
$userPassword = md5($_POST["password"]);
$now = Date("Y-m-d H:i:s");

$sqlQuery = "INSERT INTO users SET name = '$userName', email = '$userEmail', password = '$userPassword', rol = 'alumn', created_at = '$now', updated_at = '$now'";


$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery) {
    echo 'success';
} else {
    echo 'notSuccess';
}
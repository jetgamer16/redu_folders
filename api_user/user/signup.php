<?php
include "../connection.php";

$userName = $_POST["user_name"];
$userEmail = $_POST["user_email"];
$userPassword = md5($_POST["user_password"]);

$sqlQuery = "INSERT INTO user_table SET user_name = '$userName', user_email = '$userEmail', user_password = '$userPassword'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery) {
    echo 'success';
} else {
    echo 'notSuccess';
}
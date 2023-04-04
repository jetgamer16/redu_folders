<?php
include "../connection.php";

$name = $_POST["name"];
$description = $_POST["description"];
$img = $_POST["img"];
$student_id = $_POST["student_id"];
$task_id = $_POST["task_id"];
$mark = $_POST["mark"];
$feedback = $_POST["feedback"];

$sqlQuery = "INSERT INTO student_tasks SET name = '$name', description = '$description', img = '$img', student_id = $student_id, task_id = $task_id, mark = $mark, feedback = '$feedback'";

$resultOfQuery = $connectNow->query($sqlQuery);

if($resultOfQuery) {
    echo 'success';
} else {
    echo 'notSuccess';
}
<?php
include "../connection.php";

$id = $_POST["id"];
$name = $_POST["name"];
$description = $_POST["description"];
$img = $_POST["img"];
$student_id = $_POST["student_id"];
$task_id = $_POST["task_id"];
$mark = $_POST["mark"];
$feedback = $_POST["feedback"];
$now = Date("Y-m-d H:i:s");

$sqlQuery = "UPDATE student_tasks SET name = '$name', description = '$description', img = '$img', student_id = $student_id, task_id = $task_id, mark = $mark, feedback = '$feedback', updated_at = '$now' WHERE id = $id";

$resultOfQuery = $connectNow->query($sqlQuery);

$task = [];

if($resultOfQuery) {

    $sqlQuery2 = "SELECT * FROM student_tasks WHERE name = '$name' AND student_id = $student_id AND task_id = $task_id";

    $resultOfQuery2 = $connectNow->query($sqlQuery2);

    while($rowFound = $resultOfQuery2->fetch_assoc()) {
        $task[] = $rowFound;
    }
    echo json_encode(
        array(
            'success' => true,
            'task' => $task
        )
    );

} else {
    echo json_encode(
        array(
            'success' => false
        )
    );
}
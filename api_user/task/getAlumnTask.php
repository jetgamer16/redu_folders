<?php
include "../connection.php";

$taskId = $_POST["task_id"];

$sqlQuery = "SELECT * FROM student_tasks WHERE id = $taskId";

$resultOfQuery = $connectNow->query($sqlQuery);

$task = [];

if($resultOfQuery->num_rows > 0) {
    while($rowFound = $resultOfQuery->fetch_assoc()) {
        $task[] = $rowFound;
    }
    echo json_encode(
        array(
            'success' => true,
            'taskData' => $task[0],
        )
    );
} else {
    echo json_encode(
        array(
            'success' => false
        )
    );
}
<?php
include "../connection.php";

$groupId = $_POST["group_id"];
$userId = $_POST["user_id"];

$sqlQuery2 = "SELECT * FROM tasks WHERE group_id = '$groupId'";

$sqlQuery = "SELECT * FROM student_tasks WHERE student_id = $userId";

$resultOfQuery2 = $connectNow->query($sqlQuery2);

$resultOfQuery = $connectNow->query($sqlQuery);

$tasks = [];
$taskId = [];

if($resultOfQuery->num_rows > 0) {
    while($rowFound = $resultOfQuery->fetch_assoc()) {
        $taskId[] = $rowFound;
    }
}

if($resultOfQuery2->num_rows > 0) {
    while($rowFound = $resultOfQuery2->fetch_assoc()) {
        $tasks[] = $rowFound;
    }
    echo json_encode(
        array(
            'success' => true,
            'tasksData' => $tasks,
            'taskId' => $taskId
        )
    );
} else {
    echo json_encode(
        array(
            'success' => false
        )
    );
}
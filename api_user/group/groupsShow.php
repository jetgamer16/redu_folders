<?php
include "../connection.php";

$userId = $_POST["user_id"];

$sqlQuery2 = "SELECT * FROM user_group WHERE user_id = '$userId'";

$resultOfQuery2 = $connectNow->query($sqlQuery2);

$groups = [];

if($resultOfQuery2->num_rows > 0) {
    while($rowFound = $resultOfQuery2->fetch_assoc()) {
        $groups[] = $rowFound;
    }
}

$groupsUser = [];

foreach($groups as $group) {
    $sqlQuery = "SELECT * FROM groups WHERE id = ".$group['group_id'];
    $resultOfQuery = $connectNow->query($sqlQuery);
    while($rowFound = $resultOfQuery->fetch_assoc()) {
        $groupsUser[] = $rowFound;
    }
}


if($resultOfQuery->num_rows > 0) {
    echo json_encode(
        array(
            'success' => true,
            'groupsData' => $groupsUser
        )
    );
} else {
    echo json_encode(
        array(
            'success' => false
        )
    );
}
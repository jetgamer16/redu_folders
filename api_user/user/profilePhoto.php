<?php

$id = $_POST['id'];

$image = $id.'-userPP.jpg';
$imagePath2 = '../../../../Users/Admin/Desktop/reduAplication/redu_folders/users_login_db/profileImg/'.$image;
$tmp_name2 = $_FILES['image']['tmp_name'];
move_uploaded_file($tmp_name2, $imagePath2);


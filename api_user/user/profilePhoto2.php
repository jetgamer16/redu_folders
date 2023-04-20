<?php

$id = $_POST['id'];

$image = $id.'-userPP.jpg';
$imagePath = '../../../../Users/Admin/Desktop/reduAplication/redu/public/profileImg/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];
move_uploaded_file($tmp_name, $imagePath);


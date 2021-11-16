<?php
$host ="localhost";
$uname = "root";
$pwd = '';
$db_name = "restaurant";
$conn = mysqli_connect($host, $uname, $pwd, $db_name);
mysqli_set_charset($conn, 'UTF8');
?>
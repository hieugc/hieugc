<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'examples';
    $check = true;
    
    $car = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);

    if (!$db) {
        die('Không thể kết nối: ' . mysqli_error($db));
        $check = false;
        exit();
    }
?>
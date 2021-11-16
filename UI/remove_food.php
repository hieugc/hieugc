<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'restaurant';
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    $q = $_GET['q'];
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function remove_food($id){
        global $db;
        $query =    "DELETE FROM `food` WHERE `food`.`ID` = " . $id;
        mysqli_query($db, $query);
    }
    remove_food($q);
    echo "ok";
    mysqli_close($db);
?>
<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'restaurant';
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    $q1 = $_GET['q1'];
    $q2 = $_GET['q2'];
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function remove_clerk($id){
        global $db;
        $query =    "DELETE FROM `clerk` WHERE `clerk`.`ID` =" . $id;
        mysqli_query($db, $query);
    }
    function remove_chef($id){
        global $db;
        $query =    "DELETE FROM `chef` WHERE `chef`.`ID` =" . $id;
        mysqli_query($db, $query);
    }
    if($q1 == "chef") remove_chef($q2);
    else if($q1 == "clerk") remove_clerk($q2);
    echo "ok";
    mysqli_close($db);
?>
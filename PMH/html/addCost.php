<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'sokoshop';

    $db = mysqli_connect($serverName, $userName, $password, $dbName); //client-server
    $q1 = $_GET['q1'];
    $q2 = $_GET['q2'];
    $q3 = $_GET['q3'];
    $q4 = $_GET['q4']; // file
    
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function add_cost($DTIME, $CATEGORY, $PRICE, $QUANTITY)
    {   
        global $db;
        $query =    "INSERT INTO `cost` (`DTIME`, `CATEGORY`, `PRICE`, `QUANTITY`) 
                    VALUES (\"" . $DTIME . "\", \"" . $CATEGORY ."\", " . $PRICE . ", " . $QUANTITY . ")";
        return mysqli_query( $db, $query);
    }
    if (add_cost($q1, $q2, $q3, $q4) === TRUE) echo "ok";
    else echo "ko";
    mysqli_close($db);
?>
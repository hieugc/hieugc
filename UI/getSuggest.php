<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'restaurant';
    $type = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function getdatatype(){
        global $db, $type;
        $query = "SELECT `food_category`.`CATEGORY` as `type` FROM `food_category` GROUP BY `food_category`.`CATEGORY`";
        $type = mysqli_query( $db, $query);
    }

    getdatatype();
    foreach ($type as $typ) {
        echo "<div class=\"type\" hidden><p hidden>". $typ['type'] ."</p></div>";
    }
    mysqli_close($db);
?>
<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'sokoshop';
    $suggest = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function getSuggest()
    {   
        global $db, $suggest;
        $query = 'SELECT `cost`.`CATEGORY` FROM `cost` GROUP BY `cost`.`CATEGORY`';
        $suggest = mysqli_query( $db, $query);
    }
    getSuggest();
    foreach ($suggest as $sugg) {
        echo "<div class=\"datalist\" hidden><p hidden>". $sugg['CATEGORY'] ."</p></div>";
    }
    mysqli_close($db);
?>
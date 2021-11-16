<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'restaurant';
    $node = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function get_food(){
        global $db, $node;
        $query =    "SELECT `food`.`IMAGE_URL` AS `url` , 
                            `food`.`FNAME` AS `name`, 
                            `food`.`PRICE` AS `price`, 
                            `food_category`.`CATEGORY` AS `category`,
                            `food`.`INGREDIENTS` AS `decs`,
                            `food`.`ID` AS `id`
                    FROM `food`, `food_category` 
                    WHERE `food`.`ID` = `food_category`.`FID`";
        $node = mysqli_query( $db, $query);
    }
    get_food();
    foreach ($node as $no) {
        echo"
        <div class=\"food\" hidden>
        <p hidden>". $no['url'] ."</p>
        <p hidden>". $no['name'] ."</p>
        <p hidden>". $no['price'] ."</p>
        <p hidden>". $no['category'] ."</p>
        <p hidden>". $no['decs'] ."</p>
        <p hidden>". $no['id'] ."</p></div>";
    }
    mysqli_close($db);
?>
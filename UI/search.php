<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'restaurant';

    $payment = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);
    $q1 = $_GET['q1'];
    $q2 = $_GET['q2'];
    
    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }
    function getPayments()
    {
        global $db, $payment;
        $query =    "SELECT COUNT(`order`.`ID_ORDER`) AS `count`, 
                            `order`.`DTIME` AS `time` , 
                            SUM(`product`.`PRICE` * `product_in_order`.`QUANTITY`) AS `total`, 
                            SUM(`product`.`FUND` * `product_in_order`.`QUANTITY`) AS `fund` 
                    FROM    `order`, `product_in_order`, `product` 
                    WHERE   `product_in_order`.`PID` = `product`.`PID` 
                            AND `product_in_order`.`ORDER_ID` = `order`.`ID_ORDER`
                    GROUP BY `order`.`DTIME` 
                    ORDER BY `order`.`DTIME` ASC";   
        $payment = mysqli_query( $db, $query);
    }
    function getPayments_inTime($time_start, $time_end)
    {
        global $db, $payment;
        $query =    "SELECT DATE(`food_order`.`PURCHASE_DATE`) AS `time`,
                            COUNT(`food_order`.`PURCHASE_DATE`) AS `count`,
                            SUM(`food_order`.`TOTAL`) AS `total`,
                            SUM(`food_order`.`TIPS`) AS `tips`
                    FROM `food_order` 
                    WHERE `food_order`.`PURCHASE_DATE` >= \"" . $time_start . "\"
		            AND `food_order`.`PURCHASE_DATE` <= \"" . $time_end . "\"
                    GROUP BY `food_order`.`PURCHASE_DATE`
                    ORDER BY `food_order`.`PURCHASE_DATE` ASC";   
        $payment = mysqli_query( $db, $query);
    }
    getPayments_inTime($q1, $q2);
    foreach ($payment as $pay) {
        echo"
        <div class=\"payment\" hidden>
        <p hidden>". $pay['time'] ."</p>
        <p hidden>". $pay['count'] ."</p>
        <p hidden>". $pay['total'] ."</p>
        <p hidden>". $pay['tips'] ."</p></div>";
    }
    mysqli_close($db);
?>
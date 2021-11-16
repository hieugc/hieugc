<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'sokoshop';

    $payment = null;
    $cost = null;
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
        $query =    "SELECT COUNT(`order`.`ID_ORDER`) AS `count`, 
                            `order`.`DTIME` AS `time` , 
                            SUM(`product`.`PRICE` * `product_in_order`.`QUANTITY`) AS `total`, 
                            SUM(`product`.`FUND` * `product_in_order`.`QUANTITY`) AS `fund` 
                    FROM    `order`, `product_in_order`, `product` 
                    WHERE   `product_in_order`.`PID` = `product`.`PID` 
                            AND `product_in_order`.`ORDER_ID` = `order`.`ID_ORDER`
                            AND `order`.`DTIME` >= \"". $time_start ."\"
                            AND `order`.`DTIME` <= \"". $time_end . "\"
                    GROUP BY `order`.`DTIME` 
                    ORDER BY `order`.`DTIME` ASC";   
        $payment = mysqli_query( $db, $query);
    }
    function getCost_inTime($time_start, $time_end)
    {
        global $db, $cost;
        $query =   "SELECT `cost`.`DTIME` AS `time` , SUM(`cost`.`PRICE` * `cost`.`QUANTITY`) AS `sum`
                    FROM `cost`
                    WHERE `cost`.`DTIME` >= \"" . $time_start . "\"
                        AND `cost`.`DTIME` <= \"" . $time_end . "\"
                    GROUP BY `cost`.`DTIME` 
                    ORDER BY `cost`.`DTIME` ASC";   
        $cost = mysqli_query( $db, $query);
    }
    getCost_inTime($q1, $q2);
    getPayments_inTime($q1, $q2);
    foreach ($payment as $pay) {
        echo"
        <div class=\"payment\" hidden>
        <p hidden>". $pay['count'] ."</p>
        <p hidden>". $pay['time'] ."</p>
        <p hidden>". $pay['total'] ."</p>
        <p hidden>". $pay['fund'] ."</p></div>";
    }
    foreach($cost as $cost){
        echo"
        <div class=\"cost\" hidden>
        <p hidden>". $cost['time'] ."</p>
        <p hidden>". $cost['sum'] ."</p></div>";
    }
    mysqli_close($db);
?>
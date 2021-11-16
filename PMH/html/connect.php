<?php
    // Connect database
    $serverName = 'localhost';
    $userName   = 'root';
    $password   = '';
    $dbName     = 'sokoshop';
    $check = true;
    $payment = null;
    $db = mysqli_connect($serverName, $userName, $password, $dbName);

    if (!$db) {
        die('Không thể kết nối: ' . mysqli_connect_error());
        exit();
    }

    function update_payment_total($id){
        global $db;
        $query = 'UPDATE `order`
        SET `order`.`TOTAL` = (SELECT abc.`sum` FROM (SELECT `order`.`ID_ORDER` AS `id`, SUM(`product`.`PRICE` * `product_in_order`.`QUANTITY`) AS `sum` 
              FROM `order`, `product_in_order`, `product` 
              WHERE `product_in_order`.`PID` = `product`.`PID` AND `product_in_order`.`ORDER_ID` = `order`.`ID_ORDER` AND `order`.`ID_ORDER` = ' . (int)$id .
              ' GROUP BY `product_in_order`.`ORDER_ID`) AS abc)
        WHERE `order`.`ID_ORDER` = ' . (int)$id;
        if(mysqli_query($db, $query) === TRUE){
            echo "ok";
        }
        else echo $query;
    }
    function getPayments()
    {
        global $db;
        $query =    'SELECT COUNT(`order`.`ID_ORDER`) AS `count`, 
                            `order`.`DTIME` AS `time` , 
                            SUM(`product`.`PRICE` * `product_in_order`.`QUANTITY`) AS `total`, 
                            SUM(`product`.`FUND` * `product_in_order`.`QUANTITY`) AS `fund` 
                    FROM    `order`, `product_in_order`, `product` 
                    WHERE   `product_in_order`.`PID` = `product`.`PID` 
                            AND `product_in_order`.`ORDER_ID` = `order`.`ID_ORDER`
                    GROUP BY `order`.`DTIME` 
                    ORDER BY `order`.`DTIME` ASC';   
        $stmt = mysqli_query( $db, $query);
        return $stmt;
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

?>
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
    function get_chef(){
        global $db, $node;
        $query =    "SELECT `chef`.`IMG_URL` AS `img`,
                            `chef`.`ChName` AS `name`,
                            `chef`.`PHONE` AS `phone`,
                            `chef`.`ID` AS `id`
                    FROM `chef`";
        $node = mysqli_query( $db, $query);
    }
    function get_clerk(){
        global $db, $node;
        $query =    "SELECT `clerk`.`IMG_URL` AS `img`,
                            `clerk`.`CName` AS `name`,
                            `clerk`.`PHONE` AS `phone`,
                            `clerk`.`ID` AS `id`
                    FROM `clerk`";
        $node = mysqli_query( $db, $query);
    }
    get_chef();
    foreach ($node as $no) {
        echo"
        <div class=\"chef\" hidden>
        <p hidden>". $no['img'] ."</p>
        <p hidden>". $no['name'] ."</p>
        <p hidden>Bộ phận bếp</p>
        <p hidden>". $no['phone'] ."</p>
        <p hidden>". $no['id'] ."</p></div>";
    }
    get_clerk();
    foreach ($node as $no) {
        echo"
        <div class=\"clerk\" hidden>
        <p hidden>". $no['img'] ."</p>
        <p hidden>". $no['name'] ."</p>
        <p hidden>Nhân viên</p>
        <p hidden>". $no['phone'] ."</p>
        <p hidden>". $no['id'] ."</p></div>";
    }
    echo "no";
    mysqli_close($db);
?>
<?php
    require_once("./connect.php");
    function getCars() {
        global $db;
        global $car;
        $car = mysqli_query( $db, "SELECT * FROM  `cars`");
    }
    getCars();
    if($car != null){
        $arr = array();
        foreach($car as $cas){
            array_push($arr, ([ "id" => $cas["id"], 
                                "name" => $cas["name"], 
                                "year" => $cas["year"]
            ]));
        }
        echo json_encode($arr);
    }
    else echo json_encode(null);
?>
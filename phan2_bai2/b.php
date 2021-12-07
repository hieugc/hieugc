
<?php
    header("Content-Type: application/json; charset=UTF-8");
    require_once("./connect.php");
    /* Thêm dữ liệu mới vào bảng Cars */
    function addCar($id, $name, $year) {
        global $db;
        $query = "INSERT INTO `cars` (id, name, year) VALUES ($id, \"$name\", \"$year\")";
        $stmt = mysqli_query($db, $query);
        return $stmt;
    }
    if(isset($_GET["obj"])){
        $obj = json_decode($_GET["obj"], false);
        if($obj->year <= 2015 && $obj->year >= 1990 && strlen($obj->name) <= 40 && strlen($obj->name) >= 5){
            if(addCar($obj->id, $obj->name, $obj->year)) echo json_encode(["status" => "ok"]);
            else echo  json_encode(["status" => "nope"]);
        }
        else  json_encode(["status" => "nope"]);
    }
?>
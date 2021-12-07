<?php
    header("Content-Type: application/json; charset=UTF-8");
    require_once("./connect.php");
    /* Chỉnh sửa 1 dòng dữ liệu Car */
    function editCar($id, $name, $year) {
        global $db; 
        $stmt = mysqli_query( $db, "UPDATE cars SET year = \"". $year ."\", name = \"". $name . "\" WHERE id = " . $id);
        return $stmt;
    }
    
    if(isset($_GET["obj"])){
        $obj = json_decode($_GET["obj"], false);
        if($obj->year <= 2015 && $obj->year >= 1990 && strlen($obj->name) <= 40 && strlen($obj->name) >= 5){
            if(editCar($obj->id, $obj->name, $obj->year)) echo json_encode(["status" => "ok"]);
            else echo json_encode(["status" => "nope"]);
        }
        else echo json_encode(["status" => "nope"]);
    }
?>

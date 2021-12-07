<?php
    require_once("./connect.php");
    /* Xóa 1 dòng dữ liệu của bảng Cars */
    function deleteCar($id) {
        global $db;
        $query = "DELETE FROM cars WHERE id = $id";
        return mysqli_query($db, $query);
    }
    
    if(isset($_GET["obj"])){
        $obj = json_decode($_GET["obj"], false);
        if(deleteCar($obj->id)) echo json_encode(["status" => "ok"]);
        else echo json_encode(["status" => "nope"]);
    }
?>
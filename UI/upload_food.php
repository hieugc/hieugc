<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>upload file- toidicode.com</title>
    <link rel="stylesheet" href="">
</head>
<body>
<?php
    if (isset($_POST['upfile_food']) && isset($_FILES['file_upload_food']) && isset($_POST["name_food"]) && isset($_POST["category_food"]) && isset($_POST["price_food"]) && isset($_POST["number_food"]) && isset($_POST["decs_food"])) {
        if ($_FILES['file_upload_food']['error'] > 0)
            echo "Upload lỗi rồi!";
        else {
            // Connect database
            $serverName = 'localhost';
            $userName   = 'root';
            $password   = '';
            $dbName     = 'restaurant';
            $node = null;
            $db = mysqli_connect($serverName, $userName, $password, $dbName);
            if (!$db) {
                die('Không thể kết nối: ' . mysqli_connect_error());
                echo "no";
                exit();
            }
            else{
                function add_food($name, $category, $price_food, $number, $decs, $url , $id_food){
                    global $db;
                    $query =    "INSERT INTO `food`
                                VALUES (" . $id_food . ", \"" . $name . "\", " . $price_food . ", \"" . $decs . "\", " . $number . ", \"" . $url . "\")";
                    if(mysqli_query($db, $query) == TRUE) echo "ok";
                    else echo "ko";
                    $query1 =    "INSERT INTO `food_category` VALUES (" . $id_food . ", \"" . $category . "\")";
                    if(mysqli_query($db, $query1) == true) echo "ok";
                    else echo "ko";

                }
                if(!file_exists("images/" . $_FILES["file_upload_food"]['name']))
                        move_uploaded_file($_FILES['file_upload_food']['tmp_name'], 'images/' . $_FILES['file_upload_food']['name']);
                echo $_POST["id_food"];
                add_food($_POST["name_food"], $_POST["category_food"], $_POST["price_food"], $_POST["number_food"], $_POST["decs_food"], "../demo/images/" . $_FILES['file_upload_food']['name'], $_POST["id_food"]);
                mysqli_close($db);
            }
        }
    }
    else echo "no";
    header("location: http://localhost:81", FALSE);
    exit();
?>
</body>
</html>
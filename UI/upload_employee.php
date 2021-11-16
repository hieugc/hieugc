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
    if (isset($_POST['upfile_employ']) && isset($_FILES['file_upload_employ']) && isset($_POST["name_employ"]) && isset($_POST["birthday_employ"]) && isset($_POST["CMND_employ"]) && isset($_POST["phone_employ"]) && isset($_POST["position"])) {
        if ($_FILES['file_upload_employ']['error'] > 0)
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
                function add_chef($name, $date, $CMND, $phone, $url){
                    global $db;
                    $query =  "INSERT INTO `chef` (`chef`.`ChNAME`, `chef`.`BIRTHDATE`, `chef`.`CMND`, `chef`.`PHONE`, `chef`.`IMG_URL`)
                    VALUES (\"" . $name ."\", \"" . $date . "\", \"" . $CMND . "\", \"" . $phone . "\", \"" . $url . "\")";
                    if(mysqli_query($db, $query) == TRUE) echo "ok";
                    else echo "ko";
                }
                function add_clerk($name, $date, $CMND, $phone, $url){
                    global $db;
                    $query =  "INSERT INTO `clerk` (`clerk`.`CNAME`, `clerk`.`BIRTHDATE`, `clerk`.`CMND`, `clerk`.`PHONE`, `clerk`.`IMG_URL`)
                    VALUES (\"" . $name ."\", \"" . $date . "\", \"" . $CMND . "\", \"" . $phone . "\", \"" . $url . "\")";
                    if(mysqli_query($db, $query) == TRUE) echo "ok";
                    else echo "ko";
                }
                if(!file_exists("images/" . $_FILES["file_upload_employ"]['name']))
                        move_uploaded_file($_FILES['file_upload_employ']['tmp_name'], 'images/' . $_FILES['file_upload_employ']['name']);

                if($_POST["position"] == "Bộ phận bếp")
                    add_chef($_POST["name_employ"], $_POST["birthday_employ"], $_POST["CMND_employ"], $_POST["phone_employ"], "../demo/images/" . $_FILES['file_upload_employ']['name']);
                else if($_POST["position"] == "Nhân viên")
                    add_chef($_POST["name_employ"], $_POST["birthday_employ"], $_POST["CMND_employ"], $_POST["phone_employ"], "../demo/images/" . $_FILES['file_upload_employ']['name']);   
                else echo "Hỏi chấm!!!!!";
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
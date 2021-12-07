<?php
session_start();
    if(isset($_SESSION["user"]) && isset($_SESSION["pwd"])){
        session_unset();
    }
    header("location: ./login.php");
?>

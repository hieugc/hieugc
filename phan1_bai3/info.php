<?php
if(!isset($_SESSION["user"]) && !isset($_SESSION["pwd"]) && isset($_POST["pwd"]) && $_POST["pwd"] != "" && isset($_POST["user"]) && $_POST["user"] != ""){
    $_SESSION["user"] = $_POST["user"];
    $_SESSION["pwd"] = $_POST["pwd"];
}
else{
    $_SESSION["notice"] = "fail";
    header("location: login.php");
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
  <title>Info page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
  <style>
        .container{
            max-width: 500px;
        }
    </style>
</head>
<body>

<div class="container mt-3">
  <h2>Your information:</h2>
  <form action="./logout.php" method="POST">
    <div class="mb-3 mt-3">
      <label for="user">User name:</label>
      <input type="text" class="form-control" id="user" name="user" value="<?php echo $_POST["user"]; ?>" disabled>
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="text" class="form-control" id="pwd" name="pwd" value="<?php echo $_POST["pwd"]; ?>" disabled>
    </div>
    <button type="submit" class="btn btn-primary">Logout</button>
  </form>
</div>

</body>
</html>

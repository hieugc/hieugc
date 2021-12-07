<?php
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Login</title>
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
<?php if(isset($_SESSION["notice"]) && $_SESSION["notice"] == "fail"): ?>
<div class="alert alert-danger text-center">
  <strong>Đăng nhập thất bại!</strong>
</div>
<?php endif; ?>
<div class="container mt-3">
  <h2>Login form</h2>
  <form action="./info.php" method="POST">
    <div class="mb-3 mt-3">
      <label for="user">User name:</label>
      <input type="text" class="form-control" id="user" placeholder="Enter any username which you want" name="user">
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter any password which you want" name="pwd">
    </div>
    <button type="submit" class="btn btn-primary">Submit</button>
  </form>
</div>

</body>
</html>

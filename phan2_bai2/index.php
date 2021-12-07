<!doctype html>
<html lang="vi">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="./style.css">

  </head>
  <body>
    <div class="container">
      <button class="btn btn-primary btnAddNew">Thêm mới</button>
      <div class="alert alert-danger">
      </div>
      <form class="formAddNew" onsubmit="return false">
        <div class="form-group row">
          <label class="col-3 text-right col-form-label" for="name">Nhập ID:</label>
          <input type="number" class="form-control col-7" id="id" name="id" onfocus="this.placeholder=''" placeholder="Thuộc kiếu số nguyên">
        </div>
        <div class="form-group row">
          <label class="col-3 text-right col-form-label" for="name">Nhập Tên:</label>
          <input type="text" class="form-control col-7" id="name" name="name" onfocus="this.placeholder=''"  placeholder="Thuộc kiểu chuỗi, độ dài 5 - 40 kí tự">
        </div>
        <div class="form-group row">
          <label class="col-3 text-right col-form-label" for="year">Nhập Năm:</label>
          <input type="text" class="form-control col-7" id="year" name="year" onfocus="this.placeholder=''"  placeholder="Thuộc kiểu số nguyên">
        </div>
        <div class="form-group row">
          <div class="offset-3">
            <button name="btnOk" class="btn" onclick="addcart()">OK</button>
          </div>
        </div>
      </form>
      <table class="table table-hover">
      </table>
        </div>
    <script src="./myscript.js"></script>
  </body>
</html>
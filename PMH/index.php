
<!DOCTYPE html>
<html lang="en">
<?php echo'
<head>
    <!--Info page-->
    <meta charset="UTF-8">
    <meta name="description" content="Manager">
    <meta name="author" content="Phạm Minh Hiếu">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quản lí | Doanh số cửa hàng</title>
    <link rel="shortcut icon" type="image/x-icon" href="../imgs/logo.svg">
    <!-- link css file -->
    <link href="./css/style.css" rel="stylesheet" type="text/css">
    <!-- link icon -->
    <script src="https://kit.fontawesome.com/320d0ac08e.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js">
    </script>
</head>';
?>
<body>
    <?php echo'
    <div class="row nav navHome">
        <div class="col-md-3 col-sm-3 col-12 logo">
            <img id="logo" src="../imgs/logo.svg" alt="Logo"> Sokoshop
        </div>

        <div class="col-md-6 col-sm-6 col-12 listNav">
            <ul>
                <li><a href="../..//Thanh/html/top-product.html">Menu</a></li>
                    <li><a href=" #" class="active">Doanh thu</a></li>
            </ul>
        </div>

        <div class="col-3 cart">
            <a href="../../Tan_Toan/coffee.html"><button type="button" class="btn btn-light cartButton">Đăng xuất <i
                  class="fa fa-sign-out"></i></button></a>
          </div>
    </div>';
    ?>

    <div class="container-fluid mb-3 padnone width-100">
        <div class="row mt-3 width-100 mg-l mg-r">
            <div class="col col-xl-3 col-xxl-3 p-3 max-width">
                <div class="row column">
                    <form class="col max-width mb-3 shadow backgr padnone" action="" method="POST" onsubmit="return false">
                        <h2 class="backgr">Thống kê</h2>
                        <div class="row column max-width mt-3 p-2">
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Bắt đầu:</div>
                                    <div class="col-8"><input type="date" name="time_start"></div>
                                </div>
                            </div>
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Kết thúc:</div>
                                    <div class="col-8"><input type="date" name="time_end"></div>
                                </div>
                            </div>
                            <button name="btnSearch" class="btn btn-secondary col-4 mt-1 mb-2 click" ><i class="fas fa-search"></i> Tìm kiếm</button>
                        </div>
                    </form>

                    <form class="col max-width mt-3 shadow backgr padnone" action="" method="POST" onsubmit="return false">
                        <h2 class="backgr">Chi phí cửa hàng</h2>
                        <div class="row  max-width column mt-3 p-2">
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Ngày:</div>
                                    <div class="col-8"><input type="date" name="time"></div>
                                </div>
                            </div>
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Loại chi phí:</div>
                                    <div class="col-8"><input type="text" list="datatype" name="type">
                                        <datalist id="datatype">
                                        </datalist>
                                    </div>
                                </div>
                            </div>
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Đơn giá:</div>
                                    <div class="col-8"><input type="number" name="price"></div>
                                </div>
                            </div>
                            <div class="col mb-2">
                                <div class="row">
                                    <div class="col-4">Số lượng:</div>
                                    <div class="col-8"><input type="number" name="number"></div>
                                </div>
                            </div>
                            <button name="btnSearch" class="btn btn-secondary col-4 mt-1 mb-2 click">Thêm</button>
                        </div>
                    </form >

                    <div id="demo" hidden></div>
                </div>
            </div>

            <div class="col-md-12 col-lg-12 col-xl-9 col-xxl-9 p-1 width-100">
                <div class="row width-100 mg-l mg-r">
                    <div class="col-12 chart shadow p-3">
                        <div class="d-flex justify-content-between">
                            <h2>Đồ thị doanh số <span></span></h2>
                            <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">Hiển thị</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Tuần</a></li>
                                <li><a class="dropdown-item" href="#">Tháng</a></li>
                            </ul>
                        </div>
                        <hr>
                        <div id="chartLine"></div>
                    </div>
                    
                    <div class="col-12 mt-3 shadow p-3">
                        <div class="d-flex justify-content-between">
                            <h2>Doanh số cửa hàng <span></span></h2>
                            <button type="button" class="btn dropdown-toggle" data-bs-toggle="dropdown">Hiển thị</button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Tuần</a></li>
                                <li><a class="dropdown-item" href="#">Tháng</a></li>
                            </ul>
                        </div>  
                        <div id="table">
                        </div>
                        <div id="next" class="d-flex justify-content-center">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<?php echo'
    <footer>
        <div class="logoFooter">
          <p>Copyright 2021 by Sokoshop. All Rights Reserved.</p>
          <img id="logo" src="./imgs/logo.svg" alt="Logo"> Sokoshop
        </div>
    </footer>';
?>

    <script src=<?php echo "./js/myscript.js";?> type="text/javascript"></script>
</body>

</html>
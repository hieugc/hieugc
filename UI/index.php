
<!DOCTYPE html>
<html lang="en">
    <head>
        <!--Info page-->
        <meta charset="UTF-8">
        <meta name="description" content="Manager">
        <meta name="author" content="Phạm Minh Hiếu">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title> </title>

        <!-- link css file -->
	    <link href="style.css" rel="stylesheet" type="text/css" />
        <!-- link icon -->
        <script src="https://kit.fontawesome.com/320d0ac08e.js" crossorigin="anonymous"></script>
        <!-- Boostrap -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>

        <!-- Chart google -->
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <div class="contain">
            <!-- navagation -->
            <div class="nav">
                <div class="func">
                    <div>Doanh thu</div>
                    <div>Menu</div>
                    <div>Nhân sự</div>
                </div>
                <div class="signout">Thoát <i class="fas fa-sign-out-alt" aria-hidden="true"></i></div>
            </div>
            <!-- navagation -->
<!-- main View -->
            <div class="main">
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
<!-- menu -->
                <div class="menu">
                    <div class="behavior">
                        <div class="add-food" id="add-food"><i class="fas fa-plus-circle"></i> Thêm món</div>
                        <div class="input" id="input-food">
                            <form action="./upload_food.php" method="POST" enctype="multipart/form-data">
                                <div class="title"><h4>Thông tin món ăn</h4></div>
                                <div class="info">
                                    <div class="name">
                                        <div class="label">Tên:</div>
                                        <div class="value"><input type="text" name="name_food" maxlength="100"></div>
                                    </div>
                                    <div class="type">
                                        <div class="label">Phân loại:</div>
                                        <div class="value">
                                            <input type="text" list="datatype" name="category_food">
                                            <datalist id="datatype">
                                            </datalist>
                                        </div>
                                    </div>
                                    <div class="price">
                                        <div class="label">Giá:</div>
                                        <div class="value"><input type="number" name="price_food"></div>
                                    </div>
                                    <div class="price">
                                        <div class="label">Số lượng:</div>
                                        <div class="value"><input type="number" name="number_food" ></div>
                                    </div>
                                    <div class="desc">
                                        <div class="label">Mô tả:</div>
                                        <div class="value"><textarea placeholder="Nguyên liệu...." name="decs_food"></textarea></div>
                                    </div>
                                    <input type="number" name="id_food" hidden>
                                </div>
                                <div class="bot">
                                    <div class="img"><label for="upfile_food">Chọn ảnh <i class="fas fa-upload"></i></label><input type="file" name="file_upload_food" id="upfile_food"  accept=".jpg, .jpeg, .png" style="height: 0;visibility:hidden;"></div>
                                    <div class="done" id="upload_food"><input type="submit" value="Xong" name="upfile_food"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <hr />
                    <div class="title"><h4>Danh sách món ăn</h4></div>
                    <div class="list scroll-bar">
                    </div>
                </div>
<!-- menu -->
                <!-- employee -->
                <div class="employee">
                    <div class="behavior">
                        <div class="add-employee" id="add-employee"><i class="fas fa-plus-circle"></i> Thêm nhân viên</div>
                        <div class="input" id="input-employee">
                            <form action="./upload_employee.php" method="POST" enctype="multipart/form-data">
                                <div class="title"><h4>Thông tin nhân viên</h4></div>
                                <div class="info">
                                    <div class="name">
                                        <div class="label">Họ và Tên:</div>
                                        <div class="value"><input type="text" name="name_employ"></div>
                                    </div>
                                    <div class="birthday">
                                        <div class="label">Năm sinh:</div>
                                        <div class="value"><input type="date" name="birthday_employ"></div>
                                    </div>
                                    <div class="CMND">
                                        <div class="label">CMND/CCCD:</div>
                                        <div class="value"><input type="text" name="CMND_employ"></div>
                                    </div>
                                    <div class="phone">
                                        <div class="label">Số điện thoại:</div>
                                        <div class="value"><input type="text" name="phone_employ"></div>
                                    </div>
                                    <div class="type">
                                        <div class="label">Chức vụ:</div>
                                        <div class="value">
                                            <select name="position">
                                                <option>Nhân viên</option>
                                                <option>Bộ phận bếp</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="bot">
                                    <div class="img"><label for="upfile_employ">Chọn ảnh <i class="fas fa-upload"></i></label><input type="file" name="file_upload_employ" id="upfile_employ"  accept=".jpg, .jpeg, .png" style="height: 0;visibility:hidden;"></div>
                                    <div class="done" id="upload_employ"><input type="submit" value="Xong" name="upfile_employ"></div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <hr />
                    <div class="title"><h4>Danh sách nhân viên</h4></div>
                    <div class="list scroll-bar">
                    </div>
                </div>
                <!-- employee -->
            </div>
<!-- main View -->

        </div>
        <script src="./myscript.js"></script>
    </body>
</html>
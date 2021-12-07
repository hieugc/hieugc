
function display_cart(id, name, year){
    let string = "<tr><td>" + id +  "</td><td>" + name + "</td><td>" + year + "</td>";
        string += "<td class=\"d-flex\">";
        string += "<form method=\"POST\" onsubmit=\"return false\">";
        string += "<input type=\"text\" value=\"" + id +  "\" name =\"car_id\" hidden>";
        string += "<button name=\"btnDel\" type=\"submit\" class=\"btn btn-outline-danger btn-sm\" onclick=\"remove(this)\">Xóa</button>";
        string += "</form>";
        string += "<form method=\"POST\" onsubmit=\"return false\" class=\"pd-l-3\">";
        string += "<input type=\"text\" value=\"" + id + "\" name =\"car_id\" style=\"display:none;\" disabled>";
        string += "<input type=\"text\" value=\"" + name + "\" name =\"car_name\" style=\"display:none; margin-top:10px;\" >";
        string += "<input type=\"text\" value=\"" + year + "\" name =\"car_year\" style=\"display:none; margin-top:10px;\">";
        string += "<button name=\"btnEdit\" type=\"submit\" class=\"btn btn-outline-info btn-sm\" onclick=\"edit(this);\">Sửa</button>";
        string += "</form> </td></tr>";
    return string;
}


document.getElementsByClassName('formAddNew')[0].style.display = "none";
document.getElementsByClassName('btnAddNew')[0].onclick = function() {
    if(document.getElementsByClassName('formAddNew')[0].style.display == "block") document.getElementsByClassName('formAddNew')[0].style.display = "none";
    else document.getElementsByClassName('formAddNew')[0].style.display = "block";
}

function getcart(){
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function() {
        if(this.responseText == ""){
            document.getElementsByClassName("alert")[0].innerHTML = "POST  không phản hồi"; 
            document.getElementsByClassName("alert")[0].style.display = "block";
        }
        else{
            const myObj = JSON.parse(this.responseText);
            console.log(myObj);
            if(myObj == null){
                document.getElementsByClassName("alert")[0].innerHTML = "Không có dữ liệu";
                document.getElementsByClassName("alert")[0].style.display = "block";
            }
            else{
                let text = "";
                for (let x in myObj) {
                    console.log(myObj[x].id + myObj[x].name + myObj[x].year);
                    text += display_cart(myObj[x].id, myObj[x].name, myObj[x].year);
                }
                document.getElementsByTagName("table")[0].innerHTML = "<tr><th>ID</th><th>NAME</th><th>YEAR</th><th>THAO TÁC</th></tr>"  +  text;
            }
        }
       
    };
    xmlhttp.open("GET", "./a.php", true);
    xmlhttp.send();
}
function addcart(){
    var input = document.getElementsByClassName("formAddNew")[0].getElementsByTagName("input");
    const obj = JSON.stringify({id: input[0].value, name: input[1].value, year: input[2].value});
    if(Math.floor(Number(input[0].value)) != Math.ceil(Number(input[0].value)) || input[1].value.length < 5 || input[1].value.length > 40 || Number(input[2].value) > 2015 || Number(input[2].value) < 1990){
        document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Vui lòng kiểm tra dữ liệu đã nhập";
        document.getElementsByClassName("alert")[0].style.display = "block";
        return;
    }
    else{ 
        document.getElementsByClassName("alert")[0].innerHTML = "";
        document.getElementsByClassName("alert")[0].style.display = "none";
    }
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange  = function() {
        console.log(this.status);
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText == ""){
                document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Sever lưu dữ liệu thất bại";
                document.getElementsByClassName("alert")[0].style.display = "block";
            }
            else{
                const text = JSON.parse(this.responseText);
                if(text.status.trim() == "ok") {
                    getcart();
                    document.getElementsByClassName('formAddNew')[0].style.display = "none";
                    document.getElementsByClassName('formAddNew')[0].reset();
                    document.getElementsByClassName("alert")[0].innerHTML = "";
                    document.getElementsByClassName("alert")[0].style.display = "none";
                } 
                else if (text.status.trim() == "nope"){
                    document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Vui lòng kiểm tra dữ liệu đã nhập";
                    document.getElementsByClassName("alert")[0].style.display = "block";
                }
            }
        }
    };
    xmlhttp.open("GET", "./b.php?obj=" + obj);
    xmlhttp.send();
}
function edit(element){
    if(element.innerText == "Sửa"){
        var input = element.parentNode.getElementsByTagName("input");
        input[0].style.display = "block";
        input[1].style.display = "block";
        input[2].style.display = "block";
        element.innerText = "Xong";
    }
    else if(element.innerText == "Xong"){
        var input = element.parentNode.getElementsByTagName("input");
        const obj = JSON.stringify({id: input[0].value, name: input[1].value, year: input[2].value});
        if(Math.floor(Number(input[0].value)) != Math.ceil(Number(input[0].value)) || input[1].value.length < 5 || input[1].value.length > 40 || Number(input[2].value) > 2015 || Number(input[2].value) < 1990){
            document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Vui lòng kiểm tra dữ liệu đã nhập";
            document.getElementsByClassName("alert")[0].style.display = "block";
            return;
        }
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                if(this.responseText == ""){
                    document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Sever lưu dữ liệu thất bại";
                    document.getElementsByClassName("alert")[0].style.display = "block";
                }
                else{
                    const text = JSON.parse(this.responseText);
                    if(text.status.trim() == "ok") {
                        getcart();
                        document.getElementsByClassName("alert")[0].innerHTML = "";
                        document.getElementsByClassName("alert")[0].style.display = "none";
                        input[0].style.display = "none";
                        input[1].style.display = "none";
                        input[2].style.display = "none";
                        element.innerText = "Sửa";
                    }
                    else if (text.status.trim() == "nope"){
                        document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Vui lòng kiểm tra dữ liệu đã nhập";
                        document.getElementsByClassName("alert")[0].style.display = "block";
                    }
                }
            }
        };
        xmlhttp.open("GET", "./c.php?obj=" + obj, true);
        xmlhttp.send();
    }
}
function remove(element){
    var obj = JSON.stringify({id: element.parentNode.getElementsByTagName("input")[0].value});
    var xmlhttp = new XMLHttpRequest();
    xmlhttp.onload = function() {
        if (this.readyState == 4 && this.status == 200) {
            if(this.responseText == ""){
                document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> POST  không phản hồi";
                document.getElementsByClassName("alert")[0].style.display = "block";
            }
            else{
                const text = JSON.parse(this.responseText);
                if(text.status.trim() == "ok") {
                    document.getElementsByClassName("alert")[0].innerHTML = "";
                    document.getElementsByClassName("alert")[0].style.display = "none";
                        element.parentNode.parentNode.remove();
                        getcart();;
                }
                else if (text.status.trim() == "nope"){
                    document.getElementsByClassName("alert")[0].innerHTML = "<strong>Thất bại!</strong> Vui lòng kiểm tra dữ liệu đã nhập";
                    document.getElementsByClassName("alert")[0].style.display = "block";
                }
            }
        }
    };
    xmlhttp.open("GET", "./d.php?obj=" + obj, true);
    xmlhttp.send();
}
getcart();
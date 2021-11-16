//-------------------NAV------------------------------
console.log("start");
function set_background(element){
  element.style.backgroundColor = "rgb(164, 148, 211)";
}
function mouseOver(element, ButtonActive){
  if(element != ButtonActive){
    element.style.backgroundColor = "rgb(164, 148, 211)";
  }
}
function mouseOut(element, ButtonActive){
  if(element != ButtonActive){
    element.style.backgroundColor = "rgb(83, 77, 100)";
    console.log("out");
  }
}
function click_Button(element, ButtonActive){
  if(element != ButtonActive)
  {
    ButtonActive.style.backgroundColor = "rgb(83, 77, 100)";
    ButtonActive.value.style.display = "none";
    element.value.style.display = "block";
    set_background(element);
    return element;
  }
  else console.log("else");
  return ButtonActive;
}
var funcButtons = document.getElementsByClassName("func")[0];
var Button = funcButtons.querySelectorAll("div");
var main = document.getElementsByClassName("main")[0];
var main_content = main.children;
for(var i = 0, len = Button.length; i < len; i++){
  Button[i].value = main_content[i];
}
console.log(main_content);
set_background(Button[0]);
var ButtonActive = Button[0];
Button.forEach(element => element.addEventListener("mouseout", function(){mouseOut(element, ButtonActive);}));
Button.forEach(element => element.addEventListener("mouseover", function(){mouseOver(element, ButtonActive);}));
Button.forEach(element => element.addEventListener("click", function(){ButtonActive = click_Button(element, ButtonActive);}));

//-------------------FORM------------------------------
function click_add(inputname){
    var input = document.getElementById(inputname);
    if(input.style.display == "none"){
        input.style.display = "block";
        input.getElementsByTagName("form")[0].reset();
    }
    else
        input.style.display = "none";
    display_food_node();
}
document.getElementById("input-food").style.display = "none";
document.getElementById("add-food").onclick =  function(){click_add("input-food");};

document.getElementById("input-employee").style.display = "none";
document.getElementById("add-employee").onclick =  function(){click_add("input-employee");};
//-------------------EDIT------------------------------
function click_editMenu(element){
    let str = element.textContent;
    var parent = element.parentNode.parentNode;

    var input = parent.getElementsByTagName("input");
    var textarea = parent.getElementsByTagName("textarea")[0];

    var valuedesc = parent.getElementsByClassName("valuedesc")[0];
    var valuename = parent.getElementsByClassName("valuename")[0];
    var valueprice = parent.getElementsByClassName("valueprice")[0];

    if(str == "Xong"){
      element.innerHTML = "<i class=\"far fa-edit\"></i> Chỉnh sửa";  // change name button
      valuename.textContent = input[0].value;
      valueprice.textContent = input[1].value;
      valuedesc.innerHTML = textarea.value;

      textarea.style.display = "none";
      for(var i = 0, len = input.length; i < len; i++){
        input[i].style.display = "none";
      }

      valuename.style.display = "block";
      valueprice.style.display = "block";
      valuedesc.style.display = "block";
    }
    else if(str == " Chỉnh sửa"){
      element.textContent = "Xong"; // change name button

      textarea.style.display = "block";
      for(var i = 0, len = input.length; i < len; i++){
        input[i].style.display = "block";
      }

      valuename.style.display = "none";
      valueprice.style.display = "none";
      valuedesc.style.display = "none";
    }
}                    
var Menu = document.getElementsByClassName("menu")[0];
var listOfEditMenu = Menu.querySelectorAll(".edit");
listOfEditMenu.forEach(element => element.addEventListener("click", function(){click_editMenu(element);}));

function click_editEmployee(element){
    let str = element.textContent;
    var parent = element.parentNode.parentNode;

    var input = parent.getElementsByTagName("input");
    var select = parent.getElementsByTagName("select");

    var valuephone = parent.getElementsByClassName("valuephone")[0];
    var valueoffice = parent.getElementsByClassName("valueoffice")[0];

    if(str == "Xong"){
      element.innerHTML = "<i class=\"far fa-edit\"></i> Chỉnh sửa";  // change name button
      valueoffice.textContent = select[0].value;
      valuephone.textContent = input[0].value;

      select[0].style.display = "none";
      input[0].style.display = "none";

      valueoffice.style.display = "block";
      valuephone.style.display = "block";
    }
    else if(str == " Chỉnh sửa"){
      element.textContent = "Xong"; // change name button

      select[0].style.display = "block";
      input[0].style.display = "block";

      valueoffice.style.display = "none";
      valuephone.style.display = "none";
    }
}
var Employee = document.getElementsByClassName("employee")[0];
var listOfEditEmployee = Employee.querySelectorAll(".edit");
listOfEditEmployee.forEach(element => element.addEventListener("click", function(){click_editEmployee(element);}));
console.log("end");
//-----------------------------------------------------------------------------------------------------------//

function option(element){
  let str = "";
  element.forEach(element => {str += "<option value=\"" + element + "\">"; });
  return str;
}
function getlistType(){
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
      var demo = document.getElementById("demo");
      var suggest = demo.getElementsByClassName("type");
      var listtype = [];
      for(var i = 0; i < suggest.length; i++){
          listtype[listtype.length] = suggest[i].children[0].innerText;
      }
      var datatype = document.getElementById("datatype");
      datatype.innerHTML = option(listtype);
      for(var i = 0, len = suggest.length; i < len; i++){
          suggest[0].remove();
      }
  }
  xmlhttp.open("GET", "./getSuggest.php");
  xmlhttp.send();
}
function remove_node_food(element){
  var parent = element.parentNode.parentNode;
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
      parent.remove();
  }
  xmlhttp.open("GET", "./remove_food.php?q=" + parent.value);
  xmlhttp.send();
}
function remove_node_employee(element){
  var parent = element.parentNode.parentNode;
  var string = parent.getElementsByClassName("value")[1];
  console.log(string.innerText);
  var str = "";
  if(string.innerText == "Bộ phận bếp") str = "chef";
  else if(string.innerText == "Nhân viên") str = "clerk";
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
      parent.remove();
  }
  xmlhttp.open("GET", "./remove_employee.php?q1=" + str + "&q2=" + parent.value);
  xmlhttp.send();
}
/*
function add_food(element){
  var input = element.getElementsByTagName("input");
  var decs = element.getElementsByTagName("textarea")[0].value;
  var name_food = input[0].value;
  var category_food = input[1].value;
  var price_food = input[2].value;
  var number_food = input[3].value;
  var id_food = input[4].value;
  var file = input[5].prop('files')[0];
  var form_data = new FormData();
  //thêm files vào trong form data
  form_data.append('file', file_data);
  console.log(file);
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
  }
  xmlhttp.open("GET", "./demo/upload.php?fileUpload=" +  form_data + "&name_food="+ name_food +"&category_food="+category_food + "&price_food="+price_food+"&number_food=" + number_food + "&decs_food="+ decs + "&id_food=" + id_food); 
  xmlhttp.send();
}
var send_done = document.getElementsByClassName("done");
var parent_food = send_done[0].parentNode.parentNode;
console.log(parent_food);
send_done[0].addEventListener("click", function(){add_food(parent_food)});
*/

function image_food(element){
  return "<img class=\"img-fluid\" src=\"" + element + "\">";
}
function div_value(element){
  return "<div class=\"value\">" + element + "</div>";
}
function food_node(url_img, name, price, category ,decs){
  return "<div class=\"node\">" 
          + image_food(url_img) 
          + "<div class=\"info\"><div><div class=\"label\">Tên:</div>" + div_value(name)
          + "</div><div><div class=\"label\">Giá:</div>" + div_value(price) 
          + "</div><div><div class=\"label\">Phân loại:</div>" + div_value(category) 
          + "</div><div class=\"desc\"><div class=\"label\">Mô tả:</div>" + div_value(decs) 
          + "</div></div><div class=\"control\"><div class=\"edit\"><i class=\"far fa-edit\"></i> Chỉnh sửa</div><div class=\"remove\" onclick=\"remove_node_food(this)\"><i class=\"fas fa-trash-alt\"></i> Xóa</div></div></div>";
}
function display_food_node(){
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
      var demo = document.getElementById("demo");
      var node = demo.getElementsByClassName("food");
      var list_url = [];
      var list_name = [];
      var list_price = [];
      var list_category = [];
      var list_decs = [];
      var list_id = [];
      for(var i = 0; i < node.length; i++)
      {
          list_url[list_url.length] = node[i].children[0].innerText;
          list_name[list_name.length] = node[i].children[1].innerText;
          list_price[list_price.length] = Number(node[i].children[2].innerText);
          list_category[list_category.length] = String(node[i].children[3].innerText);
          list_decs[list_decs.length] = String(node[i].children[4].innerText);
          list_id[list_id.length] = Number(node[i].children[5].innerText);
      }
      for(var i = 0, len = node.length; i < len; i++){
          node[0].remove();
      }
      var str = "";
      for(var i = 0; i < list_url.length; i++){
          str += food_node(list_url[i], list_name[i], list_price[i], list_category[i] ,list_decs[i]);
      }
      var list_display = document.getElementsByClassName("list scroll-bar")[0];
      list_display.innerHTML = str;
      console.log(list_display.children);
      for(var i = 0; i < list_display.children.length; i++){
        list_display.children[i].value = list_id[i];
        //list_display.children[i].getElementsByClassName("remove")[0].onclick = function(){con(list_display.children[i].getElementsByClassName("remove")[0])};
      }
      document.getElementsByTagName("form")[1].getElementsByTagName("input")[4].value = (list_id[list_id.length - 1] + 1);
  }
  xmlhttp.open("GET", "./node_food.php");
  xmlhttp.send();
}
function employee_node(url_img, name, position, phone){
  return "<div class=\"node\">" 
          + image_food(url_img) 
          + "<div class=\"info\"><div><div class=\"label\">Tên:</div>" + div_value(name)
          + "</div><div><div class=\"label\">Chức vụ:</div>" + div_value(position) + "</div><div class=\"desc\"><div class=\"label\">SĐT:</div>"
          + div_value(phone) + "</div></div><div class=\"control\"><div class=\"edit\"><i class=\"far fa-edit\"></i> Chỉnh sửa</div><div class=\"remove\" onclick=\"remove_node_employee(this)\"><i class=\"fas fa-trash-alt\"></i> Xóa</div></div></div>";
}
function display_employee_node(){
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      document.getElementById("demo").innerHTML = this.responseText;
      var demo = document.getElementById("demo");
      var node_chef = demo.getElementsByClassName("chef");
      var list_url = [];
      var list_name = [];
      var list_position = [];
      var list_phone = [];
      var list_id = [];
      for(var i = 0; i < node_chef.length; i++)
      {
          list_url[list_url.length] = node_chef[i].children[0].innerText;
          list_name[list_name.length] = node_chef[i].children[1].innerText;
          list_position[list_position.length] = node_chef[i].children[2].innerText;
          list_phone[list_phone.length] = String(node_chef[i].children[3].innerText);
          list_id[list_id.length] = Number(node_chef[i].children[4].innerText);
      }
      for(var i = 0, len = node_chef.length; i < len; i++){
          node_chef[0].remove();
      } 
      var node_clerk = demo.getElementsByClassName("clerk");
      for(var i = 0; i < node_clerk.length; i++)
      {
          list_url[list_url.length] = node_clerk[i].children[0].innerText;
          list_name[list_name.length] = node_clerk[i].children[1].innerText;
          list_position[list_position.length] = node_clerk[i].children[2].innerText;
          list_phone[list_phone.length] = String(node_clerk[i].children[3].innerText);
          list_id[list_id.length] = Number(node_clerk[i].children[4].innerText);
      }
      /*for(var i = 0, len = node_clerk.length; i < len; i++){
          node_clerk[0].remove();
      }*/
      var str = "";
      for(var i = 0; i < list_url.length; i++){
          str += employee_node(list_url[i], list_name[i], list_position[i], list_phone[i]);
      } 
      var list_display = document.getElementsByClassName("list scroll-bar")[1];
      list_display.innerHTML = str;
      console.log(list_display.children);
      for(var i = 0; i < list_display.children.length; i++){
        list_display.children[i].value = list_id[i];
        //list_display.children[i].getElementsByClassName("remove")[0].onclick = function(){con(list_display.children[i].getElementsByClassName("remove")[0])};
      }
  }
  xmlhttp.open("GET", "./node_employee.php");
  xmlhttp.send();
}
//---------------------------------------------------------------------------------------//
/*
function checkform(element){
  if(element.value == "") element.parentNode.innerHTML += "*không bỏ trống";
  console.log(element.parentNode);
}
var form_insign = document.getElementsByTagName("form");
var input_food_info =  form_insign[1].getElementsByTagName("input");
for(var i = 0; i < input_food_info.length - 2; i++){
  input_food_info[i].value = "";
  input_food_info[i].onblur =  function (){checkform(this);};
}
var textarea_food_info = form_insign[1].getElementsByTagName("textarea")[0];
console.log(textarea_food_info.value);
textarea_food_info.value = "";
textarea_food_info.addEventListener("onblur", function(){checkform(this);}) // ch tạo alert chuyên nghiệp
*/
//---------------------------------------------------------------------------------------//
var form_insign = document.getElementsByTagName("form");
var input_food_info =  form_insign[1].getElementsByTagName("input");
var textarea_food_info = form_insign[1].getElementsByTagName("textarea")[0];
var send_done = document.getElementsByClassName("done");
send_done[0].onclick = function(){document.getElementById("input-food").style.display = "none";};
display_food_node();  
getlistType();
display_employee_node();












function Drawline(options, str, listData, id){
  google.charts.load('current', {'packages':['corechart', 'line']});
  google.charts.setOnLoadCallback(function(){drawChart(options, str, listData, id);});
  function drawChart(options, str, datal, id) {
      var data = new google.visualization.DataTable();
      data.addColumn('string', "");
      data.addColumn('number', 'Doanh số');
      data.addColumn('number', 'Chi phí');
      data.addColumn('number', 'Lợi nhuận');

      data.addRows (datal);
      var chart = new google.charts.Line(id);
      chart.draw(data, google.charts.Line.convertOptions(options));
  }
}
function getoption(width, str){
  var options = {
      title: 'Doanh số cửa hàng theo ' + str,
      subtitle: 'Tổng cộng (VND)',
      width: width,
      height: 500,
      legend: {position: 'bottom'},
      textStyle: {
          fontName: 'Times-Roman',
          fontSize: 22,
          bold: true
      },
      vAxis: {
          format: 'decimal',
      }
  }
  return options;
}
function getData(list1, list2, list3){
  const list = [];
  //var total = 0;
  if(list1 != []){
      for (let index = 0; index < list1.length; index++) {
          const element = [];
          element.push(String(list1[index]));
          element.push(Number(list2[index]));
          element.push(Number(list3[index]));
          //total += Number(list2[index]) - Number(list3[index]);
          //element.push(total);
          element.push(Number(list2[index]) + Number(list3[index]));
          list.push(element);
      }
  }
  return list;
}
//------------------------------------------------------------------------------------//
function ttable(element){
  return "<table class=\"table table-striped \">" + element + "</table>";
}
function thead(element){
  return "<thead>" + element + "</thead>";
}
function tbody(element){
  return "<tbody>" + element + "</tbody>";
}
function tr(element){
  return "<tr>" + element + "</tr>";
}
function th(element){
  return "<th>" + element + "</th>";
}
function td(element){
  return "<td>" + element + "</td>";
}
function get_Head(lelement){
  let element = "";
  element += th(lelement[0]);
  element += th(lelement[1]);
  element += th(lelement[2]);
  element += th(lelement[3]);
  return thead(tr(element));
}
function get_partBody(element1, element2, element3, element4){
  let element = "";
  element += td(element1);
  element += td(element2);
  element += td(element3);
  element += td(element4);
  return tr(element);
}
function get_Body(list1, list2, list3, list4){
  let body = "";
  for (let index = 0; index < list1.length; index++) {
      body += get_partBody(list1[index], list2[index], list3[index], list4[index]);
  }
  return tbody(body);
}
function get_innerHTML(head, body){
  let str = head + body;
  return ttable(str);
}
//---------------------------------------------------------------------------------//
function clickNext(n){
  if(n > 1){
      let str = "<div class=\"prev\"><i class=\"fas fa-angle-double-left\"></i></div>";
      for(var i = 1; i <= n; i++){
          str += "<div class=\"item\">" + i + "</div>";
      }
      str +=  "<div class=\"prev\"><i class=\"fas fa-angle-double-right\"></i></div>";
      return str;
  }
  return "";
}
function call_clickNext(old_element, element, parentNode, table, listTitle, listTime, listBill, listRevenue, listFee){
  old_element.style.backgroundColor = "white";
  element.style.backgroundColor = "#946feb";
  parentNode.childNodes[0].value = element.value - 1;
  parentNode.childNodes[parentNode.childNodes.length - 1].value = element.value + 1;
  table.innerHTML = get_innerHTML(get_Head(listTitle), get_Body(Dateformat(listTime[element.value - 1]), listBill[element.value-1], Priceformat(listRevenue[element.value - 1]), Priceformat(listFee[element.value - 1])));
  return element;
}
function call_clickNode(old_element, element, parentNode, table, listTitle, listTime, listBill, listRevenue, listFee){
  if(element.value >= 1 && element.value < parentNode.childNodes.length - 1){
      return call_clickNext(old_element, parentNode.childNodes[element.value], parentNode, table, listTitle, listTime, listBill, listRevenue, listFee);    
  }
  return old_element;
}
//-------------------------------------------------------------------------------//
function getlist(listTime, listBill, listRevenue, listFee){ 
  var payment = document.getElementsByClassName("payment");
  if(payment != undefined){
      for(var i = 0; i < payment.length; i++){
          listTime[listTime.length] = payment[i].children[0].innerText;
          listBill[listBill.length] = Number(payment[i].children[1].innerText);
          listRevenue[listRevenue.length] = Number(payment[i].children[2].innerText);
          listFee[listFee.length] = Number(payment[i].children[3].innerText);
      }
      console.log(listBill);
      console.log(listFee);
      console.log(listRevenue);
      console.log(listTime);
      for(var i = 0, len = payment.length; i < len; i++){
          payment[0].remove();
      }
      displayall(listTime, listRevenue, listFee, listBill);
  }
}
function getTime(element){
  var timer = element.parentNode.parentNode.getElementsByTagName("input");
  for(var i = 0; i < timer.length; i++){
      if(timer[i].value == '') {
          alert("Nhập đầy đủ dữ liệu thời gian");
          return;
      }
  }
  var day1 = new Date(timer[0].value);
  var day2 = new Date(timer[1].value);
  if(day1.getFullYear() > day2.getFullYear()){
      alert("Thời gian không hợp lệ");
      return;
  }
  else if(day1.getFullYear() == day2.getFullYear()) {
      if(day1.getMonth() > day2.getMonth()){
          alert("Thời gian không hợp lệ");
          return;
      }
      else if(day1.getMonth() == day2.getMonth() && day1.getDay() > day2.getDay()){
          alert("Thời gian không hợp lệ");
          return;
      }
  }
  search(String(timer[0].value), String(timer[1].value));
  timer[0].value = "";
  timer[1].value = "";
}
function search(time1, time2) {
  const xmlhttp = new XMLHttpRequest();
  xmlhttp.onload = function() {
      var listTime = [];
      var listBill = [];
      var listRevenue = [];
      var listFee = [];
    document.getElementById("demo").innerHTML = this.responseText;
    getlist(listTime, listBill, listRevenue, listFee);
  }
  xmlhttp.open("GET", "./search.php?q1=" + time1 +"&q2=" + time2);
  xmlhttp.send();
}
//-----------------------------------------------------------------------------//
function Dateformat(element){
  var list = [];
  for(var i = 0; i < element.length; i++){
      var str = element[i].split('-');
      var nodestr = str[2] + "/" + str[1] + "/" + str[0];
      list.push(nodestr);
  }
  return list;
}
function Priceformat(element){
  var list = [];
  for(var i = 0; i < element.length; i++){
      var temp = String(element[i]);
      let nodestr = "";
      for(var j = temp.length; j > 3; j -= 3){
          nodestr = "," + temp[j-1] + temp[j-2] + temp[j-3] + nodestr;
      }
      if (temp .length % 3 == 0){
          nodestr = temp[0] + temp[1] + temp[2] + nodestr;
      }
      else if(temp.length % 3 == 2){
          nodestr = temp[0] + temp[1] + nodestr;
      }
      else nodestr = temp[0] + nodestr;
      list.push(nodestr);
  }
  return list;
}
function getDay_inMonth(element){
  let str = "";
  let liststr = [];
  let listcount = [];
  let count = [];
  for (let index = 0; index <= element.length; index++) {
      if(index < element.length){
          if(str != element[index].split('-')[1]){
              if(str != "")
                  listcount[listcount.length] = count;
              str = element[index].split('-')[1];
              liststr[liststr.length] = Number(str);
              count = [];
          }
          count[count.length] = element[index];
      }
      else{
          listcount[listcount.length] = count;
      }
  }
  return [liststr, listcount];
}
function classify(element){
  var listYear = [];
  var str = "";
  var listDay = [];
  for(var index = 0; index <= element.length; index++){
      if(index < element.length){
          if(str != element[index].split('-')[0]){
              if(str != "") listYear[listDay.length] = [str, getDay_inMonth(listDay)];
              str = element[index].split('-')[0];
              listDay = [];
          }
          listDay[listDay.length] = element[index];
      }
      else{
          listYear[listYear.length] = [str, getDay_inMonth(listDay)];
      }
  }
  return listYear;
}
function Sum_money(element1, list){
  var lreturn = [];
  var listprice = [];
  var listpricetotal = [];
  var indexelement = 0;
  for (let index = 0; index < list.length; index++) {
      total = 0;
      for(var i = 0; i < list[index].length; i++){
          listprice[listprice.length] = element1[indexelement];
          total += element1[indexelement];
          indexelement += 1;
      }
      lreturn[lreturn.length] = total;
      listpricetotal[listpricetotal.length] = listprice;
      listprice = [];
  }
  return [lreturn, listpricetotal];
}
function getBIll_inMonth(element, list){
  var listreturn = [];
  var node = [];
  var indexelement = 0;
  for (let index = 0; index < list.length; index++) {
      for (let j = 0; j < list[index].length; j++) {
          node[node.length] = element[indexelement];
          indexelement += 1;
      }
      listreturn[listreturn.length] = node;
      node = [];
  }
  return listreturn;
}
function label_Month(element){
  let list = [];
  for (let index = 0; index < element.length; index++) {
      list[list.length] = "Tháng " + element[index];
  }
  return list;
}
//---------------------------------------------------------------------------//
function getWeekNumber(element) {
  const d = new Date(element.split('-')[0], element.split('-')[1], element.split('-')[2]);
  d.setUTCDate(d.getUTCDate() + 4 - (d.getUTCDay()||7));

  var yearStart = new Date(Date.UTC(d.getUTCFullYear(), 0, 1));
  var weekNo = Math.ceil(( ( (d - yearStart) / 86400000) + 1)/7);
  return weekNo;
}
function getDay_inWeek(element){
  let str = "";
  let liststr = [];
  let listcount = [];
  let count = [];
  for (let index = 0; index <= element.length; index++) {
      if(index < element.length){
          if(str != getWeekNumber(element[index])){
              if(str != "")
                  listcount[listcount.length] = count;
              str = getWeekNumber(element[index]);
              liststr[liststr.length] = Number(str);
              count = [];
          }
          count[count.length] = element[index];
      }
      else{
          listcount[listcount.length] = count;
      }
  }
  return [liststr, listcount];
}
function label_Week(element){
  let list = [];
  for (let index = 0; index < element.length; index++) {
      list[list.length] = "Tuần " + element[index];
  }
  return list;
}
//-------------------------------------------------------------------------//
function Drawline_option(label_display, chartLine, listTime, listRevenue, listFee, func){
  var width = chartLine.offsetWidth;
  if(width < 600) width = 600;
  Drawline(getoption(width, label_display.toLowerCase()), label_display, getData(func(listTime), listRevenue, listFee), chartLine);
}
function Table_option(table, list_Title, listTime, listBill, listRevenue, listFee){
  table.innerHTML = get_innerHTML(get_Head(list_Title), get_Body(Dateformat(listTime), listBill, Priceformat(listRevenue), Priceformat(listFee)));
}
function next_click_option(next_click, table, lengthnext, list_Title, listTime, listBill, listRevenue, listFee){ 
  next_click.innerHTML = clickNext(lengthnext);
  if(next_click.childNodes.length > 12){
      for (let index = 0; index < 11; index++) {
          next_click.childNodes[index].style.display = "block";
      }
      for (let index = 11; index < next_click.length - 1; index++) {
          next_click.childNodes[index].style.display = "none";
      }
      next_click.childNodes[next_click.childNodes.length - 1].style.display = "block";
  }
  var next_clicked_button = next_click.childNodes[1];
  if(next_click.childNodes.length > 1){
      next_click.childNodes[1].style.backgroundColor = "#f0dada";
      for (let index = 1; index < next_click.childNodes.length - 1; index++) {
          next_click.childNodes[index].value = index;
          next_click.childNodes[index].addEventListener("click", function(){
                                      next_clicked_button =  call_clickNext(next_clicked_button, next_click.childNodes[index],  next_click, table, list_Title, 
                                                                          listTime, listBill, listRevenue, listFee)
                                      });
      }
      next_click.childNodes[0].value = 0;
      next_click.childNodes[0].addEventListener("click", function(){ next_clicked_button = call_clickNode(next_clicked_button, next_click.childNodes[0], next_click, table,
                                                                                      list_Title, listTime, listBill, listRevenue, listFee)
                                                                                  });
      next_click.childNodes[next_click.childNodes.length - 1].value = 2;
      next_click.childNodes[next_click.childNodes.length - 1].addEventListener("click", function(){next_clicked_button = call_clickNode(next_clicked_button, next_click.childNodes[next_click.childNodes.length - 1], 
                                                                                                  next_click, table, list_Title, listTime, listBill, 
                                                                                                  listRevenue, listFee)
                                                                                              });
  }
}
//------------------------------------------------//
function displayall(listTime, listRevenue, listFee, listBill){
  if(listTime != []){
      var listTime_month = getDay_inMonth(listTime);
      var listRevenue_month = Sum_money(listRevenue, listTime_month[1]);
      var listFee_month = Sum_money(listFee, listTime_month[1]);
      var listBill_month = getBIll_inMonth(listBill, listTime_month[1]);

      var listTime_week = getDay_inWeek(listTime);
      var listRevenue_week = Sum_money(listRevenue, listTime_week[1]);
      var listFee_week = Sum_money(listFee, listTime_week[1]);
      var listBill_week = getBIll_inMonth(listBill, listTime_week[1]);
      

      const listTitle = ["Ngày", "Số hóa đơn", "Doanh số (VND)", "Tiền tips (VND)"];
      //  Default table
      var table = document.getElementById("table");
      var next_click = document.getElementById("next");
      Table_option(table, listTitle, listTime_week[1][0], listBill_week[0], listRevenue_week[1][0], listFee_week[1][0]);
      next_click_option(next_click, table, listTime_week[0].length, listTitle, listTime_week[1], listBill_week, listRevenue_week[1], listFee_week[1]);
      //  Draw chart
      var chartLine = document.getElementById('chartLine');
      Drawline_option("Tháng", chartLine, listTime_month[0], listRevenue_month[0], listFee_month[0], label_Month);

      // Display chart
      var displaychart = chartLine.parentNode.querySelectorAll('li');
      displaychart[0].childNodes[0].addEventListener("click", function(){
              Drawline_option(displaychart[0].childNodes[0].innerText, chartLine, listTime_week[0], listRevenue_week[0], listFee_week[0], label_Week);
          });
      displaychart[1].childNodes[0].addEventListener("click", function(){
              Drawline_option(displaychart[1].childNodes[0].innerText, chartLine, listTime_month[0], listRevenue_month[0], listFee_month[0], label_Month);
          });

      // Display table
      var displayTable = table.parentNode.querySelectorAll('li');
      displayTable[0].childNodes[0].addEventListener("click", function(){    
              Table_option(table, listTitle, listTime_week[1][0], listBill_week[0], listRevenue_week[1][0], listFee_week[1][0]);
              next_click_option(next_click, table, listTime_week[0].length, listTitle, listTime_week[1], listBill_week, listRevenue_week[1], listFee_week[1]);
          });
      displayTable[1].childNodes[0].addEventListener("click", function(){    
              Table_option(table, listTitle, listTime_month[1][0], listBill_month[0], listRevenue_month[1][0], listFee_month[1][0]);
              next_click_option(next_click, table, listTime_month[0].length, listTitle, listTime_month[1], listBill_month, listRevenue_month[1], listFee_month[1]);
          });
  }
}

var click_form = document.getElementsByClassName("click");
click_form[0].addEventListener("click", function(){ getTime(click_form[0]);});
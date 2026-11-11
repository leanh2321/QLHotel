<%-- 
    Document   : register
    Created on : 23 Jul 2026, 8:59:54 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Đăng ký khách hàng | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

background:#f4f4f4;
font-family:Segoe UI,sans-serif;

}

.banner{

height:250px;
background:url("images/register.jpg");
background-size:cover;
background-position:center;
display:flex;
justify-content:center;
align-items:center;
position:relative;

}

.banner::before{

content:"";
position:absolute;
top:0;
left:0;
right:0;
bottom:0;
background:rgba(0,0,0,.6);

}

.banner h1{

position:relative;
color:white;
font-size:50px;
letter-spacing:3px;

}

.register-card{

background:white;
width:90%;
max-width:900px;
margin:50px auto;
padding:40px;
border-radius:12px;
box-shadow:0 0 20px rgba(0,0,0,.15);

}

.register-card h2{

text-align:center;
color:#D4AF37;
margin-bottom:30px;

}

label{

font-weight:bold;
margin-top:15px;

}

.form-control,
.form-select{

margin-top:5px;

}

.error{

color:red;
font-size:14px;
margin-top:4px;
display:block;

}

.btn-register{

background:#D4AF37;
color:black;
font-weight:bold;
width:100%;
padding:12px;
margin-top:30px;
border:none;
border-radius:5px;
transition:.3s;

}

.btn-register:hover{

background:#111;
color:white;

}

.success-box{

background:#d4edda;
color:#155724;
padding:15px;
border-radius:8px;
text-align:center;
margin-bottom:20px;
border:1px solid #c3e6cb;
font-weight:bold;

}

.error-box{

background:#f8d7da;
color:#721c24;
padding:15px;
border-radius:8px;
text-align:center;
margin-bottom:20px;
border:1px solid #f5c6cb;
font-weight:bold;

}

.form-control:focus,
.form-select:focus{

border:2px solid #D4AF37;
box-shadow:0 0 8px rgba(212,175,55,.5);

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Đăng ký khách hàng</h1>

</div>

<div class="register-card">

<h2>Tạo tài khoản</h2>

<%!
private String viRoomType(String value) {
    if (value == null) return "";
    switch (value) {
        case "Single": return "Phòng đơn";
        case "Double": return "Phòng đôi";
        case "Standard": return "Phòng tiêu chuẩn";
        case "Deluxe": return "Phòng Deluxe";
        case "Suite": return "Phòng Suite";
        case "Family": return "Phòng gia đình";
        case "Executive": return "Phòng Executive";
        case "Presidential": return "Phòng Tổng thống";
        case "Honeymoon": return "Phòng trăng mật";
        default: return value;
    }
}
private String viRoomStatus(String value) {
    if (value == null) return "";
    switch (value) {
        case "Available": return "Còn trống";
        case "Booked": return "Đã đặt";
        case "Maintenance": return "Đang bảo trì";
        case "Pending": return "Đang chờ";
        case "Confirmed": return "Đã xác nhận";
        case "Checked In": return "Đã nhận phòng";
        case "Checked Out": return "Đã trả phòng";
        case "Cancelled": return "Đã hủy";
        default: return value;
    }
}
private String viGender(String value) {
    if (value == null) return "";
    switch (value) {
        case "Male": return "Nam";
        case "Female": return "Nữ";
        case "Other": return "Khác";
        default: return value;
    }
}
private String viMessage(String value) {
    if (value == null) return "";
    switch (value) {
        case "Invalid Email": return "Email không tồn tại.";
        case "Invalid Password": return "Mật khẩu không chính xác.";
        case "Login Failed": return "Đăng nhập không thành công.";
        case "Please Login as Admin": return "Vui lòng đăng nhập bằng tài khoản quản trị viên.";
        case "Please Login First": return "Vui lòng đăng nhập trước.";
        case "Please login to book a room.": return "Vui lòng đăng nhập để đặt phòng.";
        case "Please Fill All Required Fields": return "Vui lòng điền đầy đủ các trường bắt buộc.";
        case "Email Already Registered": return "Email này đã được đăng ký.";
        case "Registration Failed": return "Đăng ký không thành công.";
        case "Something Went Wrong": return "Đã xảy ra lỗi. Vui lòng thử lại.";
        case "Email not found.": return "Không tìm thấy email này.";
        case "Something went wrong.": return "Đã xảy ra lỗi. Vui lòng thử lại.";
        case "Password updated successfully. Please login.": return "Cập nhật mật khẩu thành công. Vui lòng đăng nhập.";
        case "Customer Not Found": return "Không tìm thấy khách hàng.";
        case "Current Password is Incorrect": return "Mật khẩu hiện tại không đúng.";
        case "New Password and Confirm Password do not match": return "Mật khẩu mới và mật khẩu xác nhận không khớp.";
        case "Unable to Change Password": return "Không thể đổi mật khẩu.";
        case "Password Changed Successfully": return "Đổi mật khẩu thành công.";
        case "Room Added Successfully": return "Thêm phòng thành công.";
        case "Room Updated Successfully": return "Cập nhật phòng thành công.";
        case "Unable to Update Room": return "Không thể cập nhật phòng.";
        default: return value;
    }
}
%>

<%
String success=request.getParameter("success");
String error=request.getParameter("error");
%>

<% if(success!=null){ %>

<div class="success-box">

✔ Đăng ký thành công! Vui lòng đăng nhập để tiếp tục.

</div>

<% } %>

<% if(error!=null){ %>

<div class="error-box">

<%=viMessage(error)%>

</div>

<% } %>

<form
action="RegisterServlet"
method="post"
id="registerForm"
onsubmit="return validateForm();">

<div class="row">

<div class="col-md-6">

<label>Họ và tên</label>

<input
type="text"
class="form-control"
name="name"
id="name"
onkeyup="validateName()">

<span id="nameError" class="error"></span>

</div>

<div class="col-md-6">

<label>Số điện thoại</label>

<input
type="text"
class="form-control"
name="mobile"
id="mobile"
maxlength="10"
onkeyup="validateMobile()">

<span id="mobileError" class="error"></span>

</div>

<div class="col-md-6">

<label>Địa chỉ email</label>

<input
type="email"
class="form-control"
name="email"
id="email"
onkeyup="validateEmail()">

<span id="emailError" class="error"></span>

</div>

<div class="col-md-6">

<label>Mật khẩu</label>

<div class="input-group">

<input
type="password"
class="form-control"
name="password"
id="password"
onkeyup="validatePassword();checkStrength();">

<button
class="btn btn-outline-secondary"
type="button"
onclick="togglePassword()">

👁

</button>

</div>

<span id="passwordError" class="error"></span>
<div id="strength" style="font-weight:bold;"></div>

</div>

<div class="col-md-6">

<label>Xác nhận mật khẩu</label>

<div class="input-group">

<input
type="password"
class="form-control"
name="confirmPassword"
id="confirmPassword"
onkeyup="validateConfirmPassword()">

<button
class="btn btn-outline-secondary"
type="button"
onclick="toggleConfirmPassword()">

👁

</button>

</div>

<span id="confirmPasswordError" class="error"></span>

</div>

<div class="col-md-6">

<label>Giới tính</label>

<select
class="form-select"
name="gender"
id="gender"
onchange="validateGender()">

<option value="">Chọn giới tính</option>
<option>Nam</option>
<option>Nữ</option>
<option>Khác</option>

</select>

<span id="genderError" class="error"></span>

</div>

<div class="col-md-6">

<label>Ngày sinh</label>

<input
type="date"
class="form-control"
name="dob"
id="dob"
onchange="validateDOB()">

<span id="dobError" class="error"></span>

</div>

<div class="col-md-6">

<label>Mã bưu chính</label>

<input
type="text"
class="form-control"
name="pincode"
id="pincode"
maxlength="6"
onkeyup="validatePincode()">

<span id="pincodeError" class="error"></span>

</div>

<div class="col-md-6">

<label>Thành phố</label>

<input
type="text"
class="form-control"
name="city"
id="city"
onkeyup="validateCity()">

<span id="cityError" class="error"></span>

</div>

<div class="col-md-6">

<label>Tỉnh/Thành</label>

<input
type="text"
class="form-control"
name="state"
id="state"
onkeyup="validateState()">

<span id="stateError" class="error"></span>

</div>

<div class="col-12">

<label>Địa chỉ</label>

<textarea
class="form-control"
rows="4"
name="address"
id="address"
onkeyup="validateAddress()"></textarea>

<span id="addressError" class="error"></span>

</div>

<div class="col-12">

<button
type="submit"
class="btn-register">

Đăng ký

</button>

</div>

</div>

</form>

</div>

<%@ include file="footer.jsp" %>

<!-- JavaScript validations will be added in Part 1B -->
<script>

function validateName(){

    let name=document.getElementById("name").value.trim();
    let error=document.getElementById("nameError");
    let pattern=/^[A-Za-z ]+$/;

    if(name==""){
        error.innerHTML="Vui lòng nhập họ tên";
        return false;
    }

    if(name.length<3){
        error.innerHTML="Họ tên phải có ít nhất 3 ký tự";
        return false;
    }

    if(!pattern.test(name)){
        error.innerHTML="Chỉ được nhập chữ cái và dấu cách";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateMobile(){

    let mobile=document.getElementById("mobile").value.trim();
    let error=document.getElementById("mobileError");
    let pattern=/^[6-9][0-9]{9}$/;

    if(mobile==""){
        error.innerHTML="Vui lòng nhập số điện thoại";
        return false;
    }

    if(!pattern.test(mobile)){
        error.innerHTML="Vui lòng nhập số điện thoại gồm 10 chữ số";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateEmail(){

    let email=document.getElementById("email").value.trim();
    let error=document.getElementById("emailError");

    let pattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(email==""){
        error.innerHTML="Vui lòng nhập email";
        return false;
    }

    if(!pattern.test(email)){
        error.innerHTML="Vui lòng nhập email hợp lệ";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validatePassword(){

    let password=document.getElementById("password").value;
    let error=document.getElementById("passwordError");

    let pattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

    if(password==""){
        error.innerHTML="Vui lòng nhập mật khẩu";
        return false;
    }

    if(!pattern.test(password)){
        error.innerHTML="Mật khẩu cần ít nhất 8 ký tự, gồm chữ hoa, chữ thường, số và ký tự đặc biệt";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateConfirmPassword(){

    let password=document.getElementById("password").value;
    let confirm=document.getElementById("confirmPassword").value;

    let error=document.getElementById("confirmPasswordError");

    if(confirm==""){
        error.innerHTML="Vui lòng xác nhận mật khẩu";
        return false;
    }

    if(password!=confirm){
        error.innerHTML="Mật khẩu xác nhận không khớp";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateGender(){

    let gender=document.getElementById("gender").value;
    let error=document.getElementById("genderError");

    if(gender==""){
        error.innerHTML="Vui lòng chọn giới tính";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateDOB(){

    let dob=document.getElementById("dob").value;
    let error=document.getElementById("dobError");

    if(dob==""){
        error.innerHTML="Vui lòng chọn ngày sinh";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateCity(){

    let city=document.getElementById("city").value.trim();
    let error=document.getElementById("cityError");

    let pattern=/^[A-Za-z ]+$/;

    if(city==""){
        error.innerHTML="Vui lòng nhập thành phố";
        return false;
    }

    if(!pattern.test(city)){
        error.innerHTML="Chỉ được nhập chữ cái";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateState(){

    let state=document.getElementById("state").value.trim();
    let error=document.getElementById("stateError");

    let pattern=/^[A-Za-z ]+$/;

    if(state==""){
        error.innerHTML="Vui lòng nhập tỉnh/thành";
        return false;
    }

    if(!pattern.test(state)){
        error.innerHTML="Chỉ được nhập chữ cái";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validatePincode(){

    let pincode=document.getElementById("pincode").value.trim();
    let error=document.getElementById("pincodeError");

    let pattern=/^[0-9]{6}$/;

    if(pincode==""){
        error.innerHTML="Vui lòng nhập mã bưu chính";
        return false;
    }

    if(!pattern.test(pincode)){
        error.innerHTML="Vui lòng nhập mã bưu chính gồm 6 chữ số";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateAddress(){

    let address=document.getElementById("address").value.trim();
    let error=document.getElementById("addressError");

    if(address==""){
        error.innerHTML="Vui lòng nhập địa chỉ";
        return false;
    }

    if(address.length<10){
        error.innerHTML="Địa chỉ phải có ít nhất 10 ký tự";
        return false;
    }

    error.innerHTML="";
    return true;
}

function togglePassword(){

let x=document.getElementById("password");

if(x.type==="password")
x.type="text";
else
x.type="password";

}

//--------------------------------

function toggleConfirmPassword(){

let x=document.getElementById("confirmPassword");

if(x.type==="password")
x.type="text";
else
x.type="password";

}

//--------------------------------

function checkStrength(){

let password=document.getElementById("password").value;

let strength=document.getElementById("strength");

if(password.length<8){

strength.innerHTML="Mật khẩu yếu";

strength.style.color="red";

}
else if(password.match(/[A-Z]/) &&
password.match(/[a-z]/) &&
password.match(/[0-9]/)){

strength.innerHTML="Mật khẩu trung bình";

strength.style.color="orange";

}

if(password.match(/[A-Z]/) &&
password.match(/[a-z]/) &&
password.match(/[0-9]/) &&
password.match(/[@$!%*?&]/) &&
password.length>=8){

strength.innerHTML="Mật khẩu mạnh";

strength.style.color="green";

}

}

//------------------------------------------------------------

function validateForm(){

    return validateName() &&
           validateMobile() &&
           validateEmail() &&
           validatePassword() &&
           validateConfirmPassword() &&
           validateGender() &&
           validateDOB() &&
           validateCity() &&
           validateState() &&
           validatePincode() &&
           validateAddress();

}

</script>

</body>

</html>

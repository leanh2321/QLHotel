<%-- 
    Document   : login
    Created on : 23 Jul 2026, 9:00:36 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Đăng nhập | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    font-family:Segoe UI,sans-serif;
    background:#f4f4f4;
}

.banner{
    height:250px;
    background:url("images/room2.png");
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
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
}

.banner h1{
    position:relative;
    color:white;
    font-size:50px;
    letter-spacing:2px;
}

.login-card{

    width:500px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:10px;
    box-shadow:0px 0px 15px rgba(0,0,0,.2);

}

.login-card h2{

    text-align:center;
    color:#D4AF37;
    margin-bottom:25px;

}

label{

    font-weight:bold;
    margin-top:15px;

}

.error{

    color:red;
    font-size:14px;

}

.btn-login{

    width:100%;
    background:#D4AF37;
    color:black;
    font-weight:bold;
    padding:12px;
    margin-top:25px;
    border:none;

}

.btn-login:hover{

    background:black;
    color:white;

}

.links{

    display:flex;
    justify-content:space-between;
    margin-top:20px;

}

.links a{

    text-decoration:none;
    color:#D4AF37;
    font-weight:bold;

}

.links a:hover{

    text-decoration:underline;

}

.success-box{

    background:#d4edda;
    color:#155724;
    padding:15px;
    border-radius:8px;
    text-align:center;
    margin-bottom:20px;

}

.error-box{

    background:#f8d7da;
    color:#721c24;
    padding:15px;
    border-radius:8px;
    text-align:center;
    margin-bottom:20px;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Đăng nhập</h1>

</div>

<div class="login-card">

<h2>Đăng nhập tài khoản</h2>

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

if(success!=null){
%>

<div class="success-box">Đăng ký thành công! Vui lòng đăng nhập.</div>

<%
}

if(error!=null){
%>

<div class="error-box">

<%=viMessage(error)%>

</div>

<%
}
%>

<form action="LoginServlet"
method="post"
onsubmit="return validateForm();">

<label>Đăng nhập với vai trò</label>

<div class="mt-2">

<input type="radio"
name="role"
value="customer"
checked>

Khách hàng

&nbsp;&nbsp;&nbsp;&nbsp;

<input type="radio"
name="role"
value="admin">Quản trị viên</div>

<label>Địa chỉ email</label>

<input
type="email"
class="form-control"
id="email"
name="email"
onkeyup="validateEmail()"
autocomplete="off">

<span id="emailError" class="error"></span>

<label>Mật khẩu</label>

<div class="input-group">

<input
type="password"
class="form-control"
id="password"
name="password"
onkeyup="validatePassword()"
autocomplete="off">

<button
class="btn btn-outline-secondary"
type="button"
onclick="togglePassword()">

👁

</button>

</div>

<span id="passwordError" class="error"></span>

<button
type="submit"
class="btn-login">Đăng nhập</button>

<div class="links">

<a href="forgotpassword.jsp">Quên mật khẩu?</a>

<a href="register.jsp">Chưa có tài khoản? Đăng ký</a>

</div>

</form>

</div>

<%@ include file="footer.jsp" %>

<!-- JavaScript will be added in Part 2 -->

<script>

// Email Validation
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

// Password Validation
function validatePassword(){

    let password=document.getElementById("password").value;
    let error=document.getElementById("passwordError");

    if(password==""){
        error.innerHTML="Vui lòng nhập mật khẩu";
        return false;
    }

    if(password.length<8){
        error.innerHTML="Mật khẩu phải có ít nhất 8 ký tự";
        return false;
    }

    error.innerHTML="";
    return true;
}

// Show / Hide Password
function togglePassword(){

    let x=document.getElementById("password");

    if(x.type==="password")
        x.type="text";
    else
        x.type="password";

}

// Form Validation
function validateForm(){

    if(!validateEmail()){
        document.getElementById("email").focus();
        return false;
    }

    if(!validatePassword()){
        document.getElementById("password").focus();
        return false;
    }

    return true;

}

</script>

</body>
</html>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
if(session.getAttribute("customerId")==null){
    response.sendRedirect("login.jsp?error=Please Login First");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Đổi mật khẩu | Khách sạn Royal Virasat</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;
font-family:Segoe UI,sans-serif;

}

.password-box{

width:500px;
margin:60px auto;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 0 20px rgba(0,0,0,.15);

}

.heading{

text-align:center;
color:#D4AF37;
font-weight:bold;
margin-bottom:30px;

}

label{

font-weight:bold;
margin-top:15px;

}

.btn-gold{

background:#D4AF37;
color:black;
font-weight:bold;

}

.btn-gold:hover{

background:black;
color:white;

}

.error{

color:red;
font-size:14px;

}

.success{

color:green;
font-size:14px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="password-box">

<h2 class="heading">Đổi mật khẩu</h2>

<%

String error=request.getParameter("error");

if(error!=null){

%>

<div class="alert alert-danger">

<%=viMessage(error)%>

</div>

<%

}

String success=request.getParameter("success");

if(success!=null){

%>

<div class="alert alert-success">

<%=viMessage(success)%>

</div>

<%

}

%>

<form action="ChangePasswordServlet" method="post">

<label>Mật khẩu hiện tại</label>

<input
type="password"
class="form-control"
name="oldPassword"
required>

<label>Mật khẩu mới</label>

<input
type="password"
class="form-control"
name="newPassword"
required>

<label>Xác nhận mật khẩu</label>

<input
type="password"
class="form-control"
name="confirmPassword"
required>

<div class="text-center mt-4">

<button
type="submit"
class="btn btn-gold btn-lg">Cập nhật mật khẩu</button>

<a
href="ProfileServlet"
class="btn btn-secondary btn-lg ms-2">Hủy</a>

</div>

</form>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
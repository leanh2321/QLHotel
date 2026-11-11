<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Quên mật khẩu | Khách sạn Mường Thanh</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:'Segoe UI',sans-serif;

}

.forgot-section{

padding:70px 0;

min-height:75vh;

display:flex;

align-items:center;

justify-content:center;

}

.card{

width:500px;

border:none;

border-radius:20px;

box-shadow:0 0 20px rgba(0,0,0,.18);

overflow:hidden;

}

.card-header{

background:#111;

color:#D4AF37;

text-align:center;

padding:25px;

}

.card-header h2{

margin:0;

font-weight:bold;

}

.card-body{

padding:35px;

}

.form-label{

font-weight:bold;

}

.form-control{

height:48px;

border-radius:10px;

}

.btn-reset{

background:#D4AF37;

color:black;

font-weight:bold;

height:48px;

border:none;

border-radius:10px;

transition:.3s;

}

.btn-reset:hover{

background:#111;

color:#fff;

}

.back-link{

text-align:center;

margin-top:20px;

}

.back-link a{

text-decoration:none;

font-weight:bold;

color:#111;

}

.back-link a:hover{

color:#D4AF37;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<section class="forgot-section">

<div class="card">

<div class="card-header">

<h2>

<i class="fa-solid fa-key"></i>Quên mật khẩu</h2>

</div>

<div class="card-body">

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

String error=request.getParameter("error");
String success=request.getParameter("success");

if(error!=null){
%>

<div class="alert alert-danger">

<%=viMessage(error)%>

</div>

<%
}

if(success!=null){
%>

<div class="alert alert-success">

<%=viMessage(success)%>

</div>

<%
}
%>

<form action="ForgotPasswordServlet" method="post">

<div class="mb-3">

<label class="form-label">Địa chỉ email</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Nhập email đã đăng ký"
required>

</div>

<div class="mb-3">

<label class="form-label">Mật khẩu mới</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Nhập mật khẩu mới"
required>

</div>

<button
type="submit"
class="btn btn-reset w-100">

<i class="fa-solid fa-rotate-right"></i>Cập nhật mật khẩu</button>

</form>

<div class="back-link">

<a href="login.jsp">

<i class="fa-solid fa-arrow-left"></i>Quay lại đăng nhập</a>

</div>

</div>

</div>

</section>

<%@include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

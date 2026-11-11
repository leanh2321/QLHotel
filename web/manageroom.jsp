<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>

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
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Room> rooms =
(ArrayList<Room>)request.getAttribute("rooms");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Quản lý phòng | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:Segoe UI,sans-serif;

}

.heading{

color:#D4AF37;

font-weight:bold;

margin:35px 0;

}

.table-container{

background:white;

padding:30px;

border-radius:15px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

.table img{

width:120px;

height:80px;

object-fit:cover;

border-radius:10px;

}

.badge-available{

background:#198754;

color:white;

padding:8px 15px;

border-radius:20px;

}

.badge-booked{

background:#dc3545;

color:white;

padding:8px 15px;

border-radius:20px;

}

.badge-maintenance{

background:#ffc107;

color:black;

padding:8px 15px;

border-radius:20px;

}

.search-box{

display:flex;

justify-content:space-between;

margin-bottom:25px;

}

.btn-add{

background:#D4AF37;

color:black;

font-weight:bold;

}

.btn-add:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container">

<h2 class="heading">Quản lý phòng</h2>

<div class="table-container">

<div class="search-box">

<form action="ManageRoomServlet" method="get">

<div class="input-group">

<input

type="text"

name="search"

class="form-control"

placeholder="Tìm số phòng"

value="<%=search%>">

<button class="btn btn-dark">

<i class="fa-solid fa-magnifying-glass"></i>Tìm kiếm</button>

</div>

</form>

<a href="addroom.jsp"
class="btn btn-add">

<i class="fa-solid fa-plus"></i>Thêm phòng mới</a>

</div>

<table class="table table-bordered table-hover align-middle">

<thead class="table-dark">

<tr>

<th>Ảnh</th>

<th>Số phòng</th>

<th>Loại phòng</th>

<th>Sức chứa</th>

<th>Giá</th>

<th>Trạng thái</th>

<th width="170">Thao tác</th>

</tr>

</thead>

<tbody>

<%
for(Room room : rooms){
%>

<tr>

<td>

<img src="images/<%=room.getRoomImage()%>">

</td>

<td>

<%=room.getRoomNumber()%>

</td>

<td>

<%=viRoomType(room.getRoomType())%>

</td>

<td>

<%=room.getCapacity()%> người

</td>

<td>

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", room.getPrice())%> ₫

</td>

<td>

<%

String status = room.getStatus();

if(status.equalsIgnoreCase("Available")){

%>

<span class="badge-available">Còn trống</span>

<%

}
else if(status.equalsIgnoreCase("Booked")){

%>

<span class="badge-booked">Đã đặt</span>

<%

}
else{

%>

<span class="badge-maintenance">Đã hủy</span>

<%

}

%>

</td>

<td>

<a href="EditRoomServlet?id=<%=room.getRoomId()%>"
class="btn btn-success btn-sm">

<i class="fa-solid fa-pen-to-square"></i>Sửa</a>

<a href="DeleteRoomServlet?id=<%=room.getRoomId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Bạn có chắc muốn xóa phòng này?');">

<i class="fa-solid fa-trash"></i>Xóa</a>

</td>

</tr>

<%

}

if(rooms.isEmpty()){

%>

<tr>

<td colspan="7"
class="text-center text-danger fw-bold">Không tìm thấy phòng nào</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

<footer class="admin-footer">

<div class="container">

<div class="row">

<div class="col-md-6">

<h5>Khách sạn Mường Thanh Sông Lam</h5>

<p>Hệ thống quản lý khách sạn cao cấp</p>

</div>

<div class="col-md-6 text-end">

<p>

© 2026 Khách sạn Mường Thanh Sông Lam

</p>

<p>Thiết kế bởi Lê Tuấn Anh</p>

</div>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
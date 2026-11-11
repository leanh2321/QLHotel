<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%-- 
    Document   : rooms.jsp
    Created on : 23 Jul 2026, 8:56:03?pm
    Author     : Asus
--%>

<%@page import="java.sql.*"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Phòng nghỉ | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

font-family:Segoe UI,sans-serif;
background:#f5f5f5;

}

.banner{

height:280px;
background:url("images/metropole.jpg");
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
background:rgba(0,0,0,.55);

}

.banner h1{

position:relative;
color:white;
font-size:50px;
letter-spacing:2px;

}

.section-title{

text-align:center;
margin:50px 0;
color:#D4AF37;
font-weight:bold;

}

.room-card{

border:none;
border-radius:12px;
overflow:hidden;
box-shadow:0 0 15px rgba(0,0,0,.15);
transition:.3s;
margin-bottom:30px;

}

.room-card:hover{

transform:translateY(-8px);

}

.room-card img{

height:230px;
object-fit:cover;

}

.price{

font-size:22px;
color:#D4AF37;
font-weight:bold;

}

.available{

color:green;
font-weight:bold;

}

.booked{

color:red;
font-weight:bold;

}

.btn-book{

background:#D4AF37;
color:black;
font-weight:bold;
width:100%;

}

.btn-book:hover{

background:black;
color:white;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Phòng nghỉ sang trọng</h1>

</div>

<div class="container">

<h2 class="section-title">Chọn căn phòng phù hợp</h2>

<div class="row">

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

try
{
ArrayList<Room> rooms =
(ArrayList<Room>)request.getAttribute("rooms");

for(Room room : rooms)
{
String roomImage = room.getRoomImage();
String imageSrc;
if (roomImage == null || roomImage.trim().isEmpty()) {
    imageSrc = request.getContextPath() + "/images/standard.jpg";
} else {
    roomImage = roomImage.trim();
    if (roomImage.startsWith("http://") || roomImage.startsWith("https://")) {
        imageSrc = roomImage;
    } else if (roomImage.startsWith("/")) {
        imageSrc = request.getContextPath() + roomImage;
    } else if (roomImage.startsWith("images/")) {
        imageSrc = request.getContextPath() + "/" + roomImage;
    } else {
        imageSrc = request.getContextPath() + "/images/" + roomImage;
    }
}
%>

<div class="col-md-4">

<div class="card room-card">

<img src="<%=imageSrc.replace("&", "&amp;").replace("\"", "&quot;").replace("<", "&lt;").replace(">", "&gt;")%>"
class="card-img-top"
alt="Ảnh phòng <%=room.getRoomNumber()%>">

<div class="card-body">

<h4>

<%=viRoomType(room.getRoomType())%>

</h4>

<p>

<b>Số phòng:</b>

<%=room.getRoomNumber()%>

</p>

<p class="price">

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", room.getPrice())%> ₫ / đêm

</p>

<p>

<b>Sức chứa:</b>

<%=room.getCapacity()%> khách

</p>

<p>

<%=room.getDescription()%>

</p>

<%

if(room.getStatus().equalsIgnoreCase("Available"))
{

%>

<p class="available">Còn trống</p>

<%

if(session.getAttribute("customerId") != null)
{

%>

<a href="BookRoomServlet?roomId=<%=room.getRoomId()%>"
class="btn btn-book">Đặt ngay</a>

<%

}
else
{

%>

<a href="login.jsp?error=Please login to book a room."
class="btn btn-book">Đặt ngay</a>

<%

}

}
else
{

%>

<p class="booked">Đã đặt</p>

<button
class="btn btn-secondary w-100"
disabled>Không còn phòng</button>

<%

}

%>

</div>

</div>

</div>

<%

}

}
catch(Exception e)
{

out.println(e);

}

%>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>

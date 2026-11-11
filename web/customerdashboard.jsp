<%-- 
    Document   : customerdashboard
    Created on : 23 Jul 2026, 9:02:10 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String customerName = (String) session.getAttribute("customerName");

int totalBookings = (Integer) request.getAttribute("totalBookings");
int activeBookings = (Integer) request.getAttribute("activeBookings");
int completedBookings = (Integer) request.getAttribute("completedBookings");
int cancelledBookings = (Integer) request.getAttribute("cancelledBookings");
%>

<!DOCTYPE html>
<html lang="vi">

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Trang khách hàng | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f4f4f4;
font-family:Segoe UI,sans-serif;

}

.banner{

height:280px;
background:url("images/night.jpg");
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
font-size:48px;

}

.welcome{

text-align:center;
margin-top:40px;

}

.welcome h2{

color:#D4AF37;

}

.card{

border:none;
border-radius:12px;
box-shadow:0 0 15px rgba(0,0,0,.15);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card i{

font-size:50px;
color:#D4AF37;

}

.card-title{

margin-top:15px;

}

.btn-custom{

background:#D4AF37;
color:black;
font-weight:bold;

}

.btn-custom:hover{

background:black;
color:white;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Trang khách hàng</h1>

</div>

<div class="container">

<div class="welcome">

<h2>

Xin chào,

<%=customerName%>

👋

</h2>

<p>Quản lý đặt phòng và tận hưởng kỳ nghỉ của bạn.</p>

</div>

<div class="row mt-5">

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Tổng số đặt phòng</h5>

<h2 style="color:#D4AF37;">
<%=totalBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Đặt phòng đang hiệu lực</h5>

<h2 style="color:green;">
<%=activeBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Hoàn tất</h5>

<h2 style="color:blue;">
<%=completedBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Đã hủy</h5>

<h2 style="color:red;">
<%=cancelledBookings%>
</h2>

</div>

</div>

</div>

<div class="row mt-4">

<div class="col-md-3">

<div class="card p-4 text-center">

<i>🏨</i>

<h4 class="card-title">Đặt phòng</h4>

<p>Đặt phòng cao cấp nhanh chóng.</p>

<a href="RoomServlet" class="btn btn-custom">Đặt ngay</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>📖</i>

<h4 class="card-title">Lịch sử đặt phòng</h4>

<p>Xem tất cả đặt phòng trước đây.</p>

<a href="BookingHistoryServlet"

class="btn btn-custom">Xem</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>👤</i>

<h4 class="card-title">Hồ sơ của tôi</h4>

<p>Cập nhật thông tin tài khoản.</p>

<a href="ProfileServlet"

class="btn btn-custom">Hồ sơ</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>🚪</i>

<h4 class="card-title">Đăng xuất</h4>

<p>Đăng xuất an toàn khỏi tài khoản.</p>

<a href="LogoutServlet"

class="btn btn-danger">Đăng xuất</a>

</div>

</div>

</div>

<div class="row mt-5">

<div class="col-md-6">

<div class="card p-4">

<h3 style="color:#D4AF37">Tiện ích khách sạn</h3>

<ul>

<li>Phòng nghỉ sang trọng</li>

<li>Wi-Fi miễn phí</li>

<li>Hồ bơi</li>

<li>Spa và chăm sóc sức khỏe</li>

<li>Nhà hàng</li>

<li>Phòng tập thể hình</li>

<li>Dịch vụ phòng 24/7</li>

</ul>

</div>

</div>

<div class="col-md-6">

<div class="card p-4">

<h3 style="color:#D4AF37">Bạn cần hỗ trợ?</h3>

<p>

Email : support@royalstay.com

</p>

<p>

Điện thoại : +91 9876543210

</p>

<p>Lễ tân phục vụ 24/7</p>

<a href="contact.jsp"

class="btn btn-custom">Liên hệ hỗ trợ</a>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>

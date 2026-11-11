<%-- 
    Document   : admindashboard
    Created on : 23 Jul 2026, 9:06:43?pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp");
    return;

}

int totalCustomers = (Integer)request.getAttribute("totalCustomers");
int totalRooms = (Integer)request.getAttribute("totalRooms");
int availableRooms = (Integer)request.getAttribute("availableRooms");
int totalBookings = (Integer)request.getAttribute("totalBookings");
int pendingBookings = (Integer)request.getAttribute("pendingBookings");
double totalRevenue = (Double)request.getAttribute("totalRevenue");

int bookedRooms = totalRooms - availableRooms;
%>

<!DOCTYPE html>
<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Bảng điều khiển quản trị | Khách sạn Royal Virasat</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;
font-family:Segoe UI,sans-serif;

}

.header{

background:#111;
color:white;
padding:25px;

}

.header h2{

margin:0;
color:#D4AF37;

}

.dashboard{

padding:40px;

}

.card{

border:none;
border-radius:15px;
box-shadow:0px 0px 15px rgba(0,0,0,.15);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card-body{

text-align:center;

}

.number{

font-size:34px;
font-weight:bold;
color:#D4AF37;

}

.title{

font-size:18px;
font-weight:bold;

}

.action-card{

text-decoration:none;
color:black;

}

.action-card:hover{

text-decoration:none;

}

.admin-footer{

margin-top:70px;

background:#111;

color:white;

padding:25px 0;

}

.admin-footer h5{

color:#D4AF37;

}

.admin-footer p{

margin:3px;

}

</style>

</head>

<body>
    
<%@include file="adminnavbar.jsp"%>


<div class="container mt-4">

<div class="alert alert-warning">

<h3>

Xin chào,

<%=session.getAttribute("adminName")%>

</h3>

<p>Quản lý khách sạn hiệu quả từ trang tổng quan này.</p>

</div>

</div>

<div class="container dashboard">
    
<div class="row g-4">

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number"><%=totalRooms%></div>

<div class="title">Tổng số phòng</div>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number"><%=availableRooms%></div>

<div class="title">Phòng còn trống</div>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number"><%=bookedRooms%></div>

<div class="title">Phòng đã đặt</div>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number"><%=totalCustomers%></div>

<div class="title">Tổng số khách hàng</div>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number"><%=totalBookings%></div>

<div class="title">Tổng số đặt phòng</div>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<div class="card-body">

<div class="number">
<i class="fas fa-money-bill-wave"></i>
<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", totalRevenue)%> ₫
</div>

<div class="title">Tổng doanh thu</div>

</div>

</div>

</div>

</div>

<h3 class="mt-5 mb-4" style="color:#D4AF37;">Thao tác nhanh</h3>

<div class="row g-4">

<div class="col-md-3">

<a href="ManageRoomServlet" class="action-card">

<div class="card">

<div class="card-body">

<h4><i class="fas fa-bed text-warning"></i></h4>

<h5>Quản lý phòng</h5>

</div>

</div>

</a>

</div>

<div class="col-md-3">

<a href="ManageCustomerServlet" class="action-card">

<div class="card">

<div class="card-body">

<h4><i class="fas fa-users text-primary"></i></h4>

<h5>Khách hàng</h5>

</div>

</div>

</a>

</div>

<div class="col-md-3">

<a href="ManageBookingServlet" class="action-card">

<div class="card">

<div class="card-body">

<h4><i class="fas fa-calendar-check text-success"></i></h4>

<h5>Quản lý đặt phòng</h5>

</div>

</div>

</a>

</div>

<div class="col-md-3">

<a href="ReportsServlet" class="action-card">

<div class="card">

<div class="card-body">

<h4><i class="fas fa-chart-bar text-danger"></i></h4>

<h5>Báo cáo</h5>

</div>

</div>

</a>

</div>

</div>

<div class="text-center mt-5">

<a href="LogoutServlet" class="btn btn-danger btn-lg">Đăng xuất</a>

</div>

</div>

<footer class="admin-footer">

<div class="container">

<div class="row">

<div class="col-md-6">

<h5>Khách sạn Mường Thanh</h5>

<p>Hệ thống quản lý khách sạn cao cấp</p>

</div>

<div class="col-md-6 text-end">

<p>

� 2026 Khách sạn Mường Thanh Sông Lam

</p>

<p>Thiết kế bởi Lê Tuấn Anh</p>

</div>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
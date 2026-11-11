<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-dark" style="background:#111;">

<div class="container">

<a class="navbar-brand fw-bold" href="AdminDashboardServlet">

<img src="images/muong thanh.png"
width="90"
height="55"
class="me-2">Khách sạn Mường Thanh<span style="font-size:14px;color:#D4AF37;"> Trang quản trị</span>

</a>

<button class="navbar-toggler"
type="button"
data-bs-toggle="collapse"
data-bs-target="#navbarNav">

<span class="navbar-toggler-icon"></span>

</button>

<div class="collapse navbar-collapse"
id="navbarNav">

<ul class="navbar-nav ms-auto">

<li class="nav-item">

<a class="nav-link"
href="AdminDashboardServlet">Tổng quan</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="ManageRoomServlet">Phòng nghỉ</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="ManageCustomerServlet">Khách hàng</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="ManageBookingServlet">Đặt phòng</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="ManageRestaurantReservationServlet">Đặt bàn</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="ReportsServlet">Báo cáo</a>

</li>

<li class="nav-item">

<a class="nav-link"
href="profileadmin.jsp">Hồ sơ</a>

</li>

<li class="nav-item">

<a class="btn btn-danger ms-3"
href="LogoutServlet">Đăng xuất</a>

</li>

</ul>

</div>

</div>

</nav>

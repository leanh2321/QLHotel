<%-- 
    Document   : restaurant
    Created on : 23 Jul 2026, 8:57:18 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Nhà hàng | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

font-family:Arial,Helvetica,sans-serif;

background:#f8f8f8;

}

.banner{

height:450px;

background:url("images/restaurant3.jpg") center center/cover;

display:flex;

justify-content:center;

align-items:center;

}

.banner h1{

color:white;

font-size:55px;

font-weight:bold;

background:rgba(0,0,0,.6);

padding:20px 45px;

border-radius:10px;

}

.section-title{

text-align:center;

color:#D4AF37;

font-weight:bold;

margin:60px 0 30px;

}

.about{

padding:40px;

background:white;

border-radius:10px;

box-shadow:0 0 15px rgba(0,0,0,.1);

}

.card{

border:none;

transition:.3s;

box-shadow:0 5px 15px rgba(0,0,0,.15);

}

.card:hover{

transform:translateY(-8px);

}

.card img{

height:240px;

object-fit:cover;

}

.price{

color:#D4AF37;

font-size:22px;

font-weight:bold;

}

.info-box{

background:#222;

color:white;

padding:35px;

border-radius:10px;

}

.btn-book{

background:#D4AF37;

color:black;

font-weight:bold;

padding:12px 30px;

}

.btn-book:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="banner">

<h1>Nhà hàng cao cấp</h1>

</div>

<div class="container mt-5">

<div class="about">

<h2 class="section-title">Trải nghiệm ẩm thực tinh tế</h2>

<p class="text-center">

Thưởng thức ẩm thực đẳng cấp do các đầu bếp danh tiếng chế biến.

Nhà hàng phục vụ món Ấn Độ, Âu, Trung Hoa, Ý và Mexico

với nguyên liệu cao cấp và dịch vụ chu đáo.

</p>

</div>

<h2 class="section-title">Món ăn đặc sắc</h2>

<div class="row">

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/thali.jpg">

<div class="card-body text-center">

<h5>Mâm cơm hoàng gia Ấn Độ</h5>

<p>Bữa ăn truyền thống hoàng gia với hương vị cao cấp.</p>

<p class="price">

450.000 ₫

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/pasta.jpg">

<div class="card-body text-center">

<h5>Mì Ý</h5>

<p>Mì Ý sốt Alfredo béo ngậy dùng kèm bánh mì bơ tỏi.</p>

<p class="price">

300.000 ₫

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/steak.jpg">

<div class="card-body text-center">

<h5>Bít tết nướng</h5>

<p>Bít tết cao cấp nướng kèm rau củ.</p>

<p class="price">

750.000 ₫

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/sweet.jpg">

<div class="card-body text-center">

<h5>Món tráng miệng cao cấp</h5>

<p>Món tráng miệng sô-cô-la đặc biệt của đầu bếp.</p>

<p class="price">

210.000 ₫

</p>

</div>

</div>

</div>

</div>

<h2 class="section-title">Tiện ích nhà hàng</h2>

<div class="row text-center">

<div class="col-md-3">

<h4>🍽 Ẩm thực tinh tế</h4>

<p>Không gian sang trọng, tinh tế.</p>

</div>

<div class="col-md-3">

<h4>🎵 Nhạc sống</h4>

<p>Mỗi tối từ 19:00.</p>

</div>

<div class="col-md-3">

<h4>👨‍🍳 Đầu bếp bậc thầy</h4>

<p>Đội ngũ chuyên gia ẩm thực quốc tế.</p>

</div>

<div class="col-md-3">

<h4>🥂 Phòng ăn riêng</h4>

<p>Không gian riêng cho sự kiện gia đình và doanh nghiệp.</p>

</div>

</div>

<div class="row mt-5">

<div class="col-md-6">

<div class="info-box">

<h3>Giờ phục vụ nhà hàng</h3>

<hr>

<p><b>Bữa sáng:</b> 07:00 – 10:30</p>

<p><b>Bữa trưa:</b> 12:30 – 15:30</p>

<p><b>Bữa tối:</b> 19:00 – 23:30</p>

<p><b>Nhạc sống:</b>Mỗi tối</p>

</div>

</div>

<div class="col-md-6 d-flex align-items-center justify-content-center">

<div class="text-center">

<h2>Đặt bàn</h2>

<p>Đặt chỗ để trải nghiệm ẩm thực cao cấp ngay hôm nay.</p>

<a href="#datban" class="btn btn-book">Đặt bàn ngay</a>

</div>

</div>

</div>

<section id="datban" class="about mt-5">
    <h2 class="section-title mt-0">Gửi yêu cầu đặt bàn</h2>
    <% if ("success".equals(request.getParameter("reservation"))) { %>
        <div class="alert alert-success">Yêu cầu đặt bàn đã được gửi. Nhà hàng sẽ liên hệ xác nhận với bạn.</div>
    <% } else if ("invalid".equals(request.getParameter("reservation"))) { %>
        <div class="alert alert-warning">Vui lòng kiểm tra thông tin và chọn ngày đặt bàn từ hôm nay trở đi.</div>
    <% } else if ("error".equals(request.getParameter("reservation"))) { %>
        <div class="alert alert-danger">Chưa gửi được yêu cầu. Hãy thử lại sau hoặc liên hệ trực tiếp với nhà hàng.</div>
    <% } %>
    <form action="<%=request.getContextPath()%>/SubmitRestaurantReservationServlet" method="post" class="row g-3">
        <div class="col-md-6"><label class="form-label" for="customerName">Họ và tên</label><input class="form-control" id="customerName" name="customerName" maxlength="150" required></div>
        <div class="col-md-6"><label class="form-label" for="mobile">Số điện thoại</label><input class="form-control" id="mobile" name="mobile" type="tel" maxlength="20" required></div>
        <div class="col-md-6"><label class="form-label" for="email">Email</label><input class="form-control" id="email" name="email" type="email" maxlength="254" required></div>
        <div class="col-md-6"><label class="form-label" for="guestCount">Số khách</label><input class="form-control" id="guestCount" name="guestCount" type="number" min="1" max="100" value="2" required></div>
        <div class="col-md-6"><label class="form-label" for="reservationDate">Ngày đặt</label><input class="form-control" id="reservationDate" name="reservationDate" type="date" required></div>
        <div class="col-md-6"><label class="form-label" for="reservationTime">Giờ đặt</label><input class="form-control" id="reservationTime" name="reservationTime" type="time" required></div>
        <div class="col-12"><label class="form-label" for="note">Ghi chú</label><textarea class="form-control" id="note" name="note" maxlength="1000" rows="3"></textarea></div>
        <div class="col-12 text-center"><button class="btn btn-book" type="submit">Gửi yêu cầu đặt bàn</button></div>
    </form>
</section>

</div>

<br><br>

<%@include file="footer.jsp"%>

</body>

</html>

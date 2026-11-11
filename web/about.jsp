<%-- 
    Document   : about.jsp
    Created on : 23 Jul 2026, 8:55:44 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Giới thiệu | Khách sạn Royal Virasat</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

font-family:Segoe UI,sans-serif;
background:#f8f8f8;

}

.banner{

height:320px;

background:url("images/muongthanh1.jpg");

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

background:rgba(0,0,0,.55);

}

.banner h1{

position:relative;

color:white;

font-size:55px;

font-weight:bold;

letter-spacing:3px;

}

.about{

padding:70px 0;

}

.about img{

width:100%;

border-radius:10px;

box-shadow:0 0 20px rgba(0,0,0,.3);

}

.about h2{

color:#D4AF37;

margin-bottom:20px;

}

.about p{

font-size:18px;

line-height:30px;

text-align:justify;

}

.feature-box{

background:white;

padding:35px;

border-radius:10px;

text-align:center;

box-shadow:0 0 15px rgba(0,0,0,.1);

transition:.4s;

height:100%;

}

.feature-box:hover{

transform:translateY(-10px);

}

.feature-box i{

font-size:50px;

color:#D4AF37;

margin-bottom:20px;

}

.section-title{

text-align:center;

margin:60px 0 40px;

font-size:40px;

color:#111;

}

.vm{

background:#111;

color:white;

padding:70px;

margin-top:60px;

}

.vm h2{

color:#D4AF37;

margin-bottom:20px;

}

.counter{

background:white;

padding:60px 20px;

text-align:center;

box-shadow:0 0 15px rgba(0,0,0,.1);

border-radius:10px;

}

.counter h1{

font-size:55px;

color:#D4AF37;

}

.counter p{

font-size:20px;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>GIỚI THIỆU</h1>

</div>

<div class="container about">

<div class="row align-items-center">

<div class="col-md-6">

<img src="images/metropole1.png">

</div>

<div class="col-md-6">

<h2>Chào mừng đến với Khách sạn Mường Thanh</h2>

<p>

Mường Thanh là điểm nghỉ dưỡng cao cấp dành cho du khách yêu thích sự tinh tế,
tiện nghi và dịch vụ hiếu khách đẳng cấp.

Từ những căn phòng được thiết kế trang nhã đến trải nghiệm ẩm thực đặc sắc,
mọi chi tiết đều được chăm chút để mang đến kỳ nghỉ khó quên.

Dù đi công tác hay nghỉ dưỡng, khách sạn mang đến
phòng nghỉ sang trọng, tiện nghi hiện đại, ẩm thực tinh tế, dịch vụ spa
và sự chăm sóc tận tâm.

</p>

</div>

</div>

</div>

<h2 class="section-title">Vì sao chọn Mường Thanh</h2>

<div class="container">

<div class="row g-4">

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-bed"></i>

<h4>Phòng nghỉ sang trọng</h4>

<p>Phòng nghỉ trang nhã với nội thất cao cấp.</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-utensils"></i>

<h4>Ẩm thực tinh tế</h4>

<p>Nhà hàng đa dạng món ăn cùng đội ngũ đầu bếp giàu kinh nghiệm.</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-person-swimming"></i>

<h4>Hồ bơi</h4>

<p>Thư giãn và tận hưởng làn nước mát tại hồ bơi.</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-spa"></i>

<h4>Spa và chăm sóc sức khỏe</h4>

<p>Dịch vụ spa và chăm sóc sức khỏe chuyên nghiệp.</p>

</div>

</div>

</div>

</div>

<div class="vm">

<div class="container">

<div class="row">

<div class="col-md-6">

<h2>Tầm nhìn</h2>

<p>

Trở thành một trong những khách sạn cao cấp hàng đầu với dịch vụ hiếu khách xuất sắc,
tiện nghi thoải mái và trải nghiệm đáng nhớ.

</p>

</div>

<div class="col-md-6">

<h2>Sứ mệnh</h2>

<p>

Mang đến nơi lưu trú đẳng cấp, dịch vụ khách hàng tận tâm,
cùng tiện ích cao cấp với tiêu chuẩn chất lượng hàng đầu.

</p>

</div>

</div>

</div>

</div>

<h2 class="section-title">Thành tựu</h2>

<div class="container mb-5">

<div class="row g-4">

<div class="col-md-3">

<div class="counter">

<h1>250+</h1>

<p>Phòng nghỉ sang trọng</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>15+</h1>

<p>Năm kinh nghiệm</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>50+</h1>

<p>Nhân viên chuyên nghiệp</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>25000+</h1>

<p>Khách hàng hài lòng</p>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>
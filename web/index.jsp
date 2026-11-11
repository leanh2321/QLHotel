<%-- 
    Document   : index.jsp
    Created on : 23 Jul 2026, 8:55:11 pm
    Author     : Asus
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="vi">

<head>

<title>Khách sạn Mường Thanh</title>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

margin:0;

background:#f8f8f8;

font-family:Segoe UI;

}


.hero{

height:90vh;

background:url("images/metropole1.png");

background-size:cover;

background-position:center;

display:flex;

justify-content:center;

align-items:center;

text-align:center;

color:white;

position:relative;

}

.hero::before{

content:"";

position:absolute;

top:0;

left:0;

right:0;

bottom:0;

background:rgba(0,0,0,.55);

}

.hero-content{

position:relative;

z-index:2;

}

.hero h1{

font-size:70px;

font-weight:bold;

}

.hero p{

font-size:22px;

margin:20px 0;

}

.hero button,
.hero a{

padding:14px 35px;

margin:10px;

border:none;

font-size:18px;

border-radius:40px;

transition:.4s;

display:inline-block;

text-decoration:none;

color:#111;

}

.book{

background:#D4AF37;

}

.explore{

background:white;

}

.hero button:hover,
.hero a:hover{

transform:scale(1.08);

}

/**************** SECTION ****************/

.section-title{

text-align:center;

font-size:42px;

margin:60px 0 40px;

color:#111;

}

/**************** CARDS ****************/

.card{

transition:.4s;

border:none;

box-shadow:0 0 20px rgba(0,0,0,.1);

}

.card:hover{

transform:translateY(-10px);

}

.card img{

height:240px;

object-fit:cover;

}

/**************** FEATURES ****************/

.feature{

padding:40px;

text-align:center;

}

.feature i{

font-size:55px;

color:#D4AF37;

margin-bottom:15px;

}

.feature h4{

margin-top:10px;

}

/**************** REVIEW ****************/

.review{

background:#111;

color:white;

padding:60px;

text-align:center;

}

.review h2{

color:#D4AF37;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="hero">

<div class="hero-content">

<h1>Đẳng cấp được định nghĩa lại</h1>

<p>Tận hưởng tiện nghi, sự tinh tế và dịch vụ hiếu khách đẳng cấp</p>

<a class="book" href="<%=request.getContextPath()%>/RoomServlet">Đặt ngay</a>

<a class="explore" href="<%=request.getContextPath()%>/RoomServlet">Khám phá phòng nghỉ</a>

</div>

</div>

<!------------ Why Choose Us ------------>

<h2 class="section-title">Vì sao chọn chúng tôi</h2>

<div class="container">

<div class="row">

<div class="col-md-3 feature">

<i class="fa-solid fa-bed"></i>

<h4>Phòng nghỉ sang trọng</h4>

<p>Phòng nghỉ trang nhã với nội thất cao cấp.</p>

</div>

<div class="col-md-3 feature">

<i class="fa-solid fa-utensils"></i>

<h4>Ẩm thực tinh tế</h4>

<p>Thưởng thức những món ăn hấp dẫn do đầu bếp của chúng tôi chế biến.</p>

</div>

<div class="col-md-3 feature">

<i class="fa-solid fa-wifi"></i>

<h4>Wi-Fi miễn phí</h4>

<p>Internet tốc độ cao trong toàn khách sạn.</p>

</div>

<div class="col-md-3 feature">

<i class="fa-solid fa-person-swimming"></i>

<h4>Hồ bơi</h4>

<p>Thư giãn tại hồ bơi ngoài trời sang trọng.</p>

</div>

</div>

</div>

<!------------ Featured Rooms ------------>

<h2 class="section-title">Phòng nổi bật</h2>

<div class="container">

<div class="row">

<div class="col-md-4">

<div class="card">

<img src="images/room1.png">

<div class="card-body">

<h4>Phòng đơn</h4>

<p>850.000 ₫ / đêm</p>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<img src="images/singleroom.jpg">

<div class="card-body">

<h4>Phòng Deluxe</h4>

<p>1.250.000 ₫ / đêm</p>

</div>

</div>

</div>

<div class="col-md-4">

<div class="card">

<img src="images/deluxroom.jpg">

<div class="card-body">

<h4>Phòng Suite</h4>

<p>2.500.000 ₫ / đêm</p>

</div>

</div>

</div>

</div>

</div>

<!------------ Reviews ------------>

<div class="review">

<h2>

★★★★★

</h2>

<h3>

"Thật là một trải nghiệm tuyệt vời!"

</h3>

<p>Phòng nghỉ sang trọng, món ăn ngon và dịch vụ tuyệt vời.</p>

<h5>

- Khách hàng hài lòng

</h5>

</div>

<%@include file="footer.jsp"%>

</body>

</html>

<%-- 
    Document   : gallery
    Created on : 23 Jul 2026, 8:56:42 pm
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Thư viện ảnh | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

    font-family:Segoe UI,sans-serif;
    background:#f5f5f5;

}

.banner{

    height:300px;
    background:url("images/virasat.jpg");
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
    font-size:52px;
    letter-spacing:3px;
    font-weight:bold;

}

.heading{

    text-align:center;
    margin:60px 0 15px;
    color:#D4AF37;
    font-weight:bold;

}

.subheading{

    text-align:center;
    color:#666;
    margin-bottom:40px;

}

.gallery-item{

    overflow:hidden;
    border-radius:15px;
    margin-bottom:30px;
    box-shadow:0 0 15px rgba(0,0,0,.15);
    transition:.3s;

}

.gallery-item img{

    width:100%;
    height:260px;
    object-fit:cover;
    transition:.5s;

}

.gallery-item:hover{

    transform:translateY(-8px);

}

.gallery-item:hover img{

    transform:scale(1.08);

}

.caption{

    background:white;
    text-align:center;
    padding:15px;
    font-weight:bold;
    color:#444;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Thư viện ảnh</h1>

</div>

<div class="container">

<h2 class="heading">Trải nghiệm đẳng cấp</h2>

<p class="subheading">Khám phá sự tinh tế và tiện nghi tại Khách sạn Mường Thanh Sông Lam.</p>

<div class="row">

<div class="col-md-4">

<div class="gallery-item">

<img src="images/deluxe1.jpg">

<div class="caption">Phòng Deluxe sang trọng</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/suitemotropole.jpg">

<div class="caption">Phòng Suite Executive</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/suitepresident.jpg">

<div class="caption">Phòng Suite Tổng thống</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/sanhmetrople.jpg">

<div class="caption">Sảnh khách sạn</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/swimmingpool.jpg">

<div class="caption">Hồ bơi</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/restaurantmetropole.jpg">

<div class="caption">Nhà hàng ẩm thực cao cấp</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/spa.jpg">

<div class="caption">Spa và chăm sóc sức khỏe</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/bathroom.jpg">

<div class="caption">

Phòng tắm sang trọng

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/meetingroom.jpg">

<div class="caption">

Phòng hội nghị

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/gymfittness.jpg">

<div class="caption">Trung tâm thể hình</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/vuonmetropole.jpg">

<div class="caption">Hướng nhìn ra vườn</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/night1.jpg">

<div class="caption">Khung cảnh ban đêm</div>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>
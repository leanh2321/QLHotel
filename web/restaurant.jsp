<%-- 
    Document   : restaurant
    Created on : 23 Jul 2026, 8:57:18 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Restaurant | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

font-family:Arial,Helvetica,sans-serif;

background:#f8f8f8;

}

.banner{

height:450px;

background:url("images/fairmont.jpg") center center/cover;

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

<h1>Luxury Restaurant</h1>

</div>

<div class="container mt-5">

<div class="about">

<h2 class="section-title">

Fine Dining Experience

</h2>

<p class="text-center">

Experience world-class dining prepared by internationally renowned chefs.

Our restaurant serves Indian, Continental, Chinese, Italian and Mexican cuisine

using premium ingredients with exceptional hospitality.

</p>

</div>

<h2 class="section-title">

Our Signature Dishes

</h2>

<div class="row">

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/thali.jpg">

<div class="card-body text-center">

<h5>Royal Indian Thali</h5>

<p>

Traditional royal meal with premium flavours.

</p>

<p class="price">

₹1,499

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/pasta.jpg">

<div class="card-body text-center">

<h5>Italian Pasta</h5>

<p>

Creamy Alfredo Pasta served with garlic bread.

</p>

<p class="price">

₹999

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/steak.jpg">

<div class="card-body text-center">

<h5>Grilled Steak</h5>

<p>

Premium grilled steak with vegetables.

</p>

<p class="price">

₹2,499

</p>

</div>

</div>

</div>

<div class="col-md-3 mb-4">

<div class="card">

<img src="images/sweet.jpg">

<div class="card-body text-center">

<h5>Luxury Dessert</h5>

<p>

Chef's signature chocolate delight.

</p>

<p class="price">

₹699

</p>

</div>

</div>

</div>

</div>

<h2 class="section-title">

Restaurant Facilities

</h2>

<div class="row text-center">

<div class="col-md-3">

<h4>🍽 Fine Dining</h4>

<p>Elegant luxury ambience.</p>

</div>

<div class="col-md-3">

<h4>🎵 Live Music</h4>

<p>Every evening from 7 PM.</p>

</div>

<div class="col-md-3">

<h4>👨‍🍳 Master Chefs</h4>

<p>International culinary experts.</p>

</div>

<div class="col-md-3">

<h4>🥂 Private Dining</h4>

<p>Exclusive family & corporate events.</p>

</div>

</div>

<div class="row mt-5">

<div class="col-md-6">

<div class="info-box">

<h3>Restaurant Timings</h3>

<hr>

<p><b>Breakfast :</b> 7:00 AM – 10:30 AM</p>

<p><b>Lunch :</b> 12:30 PM – 3:30 PM</p>

<p><b>Dinner :</b> 7:00 PM – 11:30 PM</p>

<p><b>Live Music :</b> Every Evening</p>

</div>

</div>

<div class="col-md-6 d-flex align-items-center justify-content-center">

<div class="text-center">

<h2>

Reserve Your Table

</h2>

<p>

Book your luxury dining experience today.

</p>

<a href="contact.jsp" class="btn btn-book">

Reserve Now

</a>

</div>

</div>

</div>

</div>

<br><br>

<%@include file="footer.jsp"%>

</body>

</html>

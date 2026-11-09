<%-- 
    Document   : about.jsp
    Created on : 23 Jul 2026, 8:55:44 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>About Us | Royal Stay Hotel</title>

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

background:url("images/fairmont.jpg");

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

<h1>ABOUT US</h1>

</div>

<div class="container about">

<div class="row align-items-center">

<div class="col-md-6">

<img src="images/loby.jpg">

</div>

<div class="col-md-6">

<h2>Welcome to Royal Virasat Hotel</h2>

<p>

Royal Virasat Hotel is a premium luxury destination designed for guests who seek elegance,
comfort, and world-class hospitality.

From beautifully designed rooms to exceptional dining experiences,
every detail is carefully crafted to provide an unforgettable stay.

Whether you are travelling for business or leisure, our hotel offers
luxurious accommodation, modern facilities, fine dining, spa services,
and personalized customer care.

</p>

</div>

</div>

</div>

<h2 class="section-title">

Why Choose Royal Virasat

</h2>

<div class="container">

<div class="row g-4">

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-bed"></i>

<h4>Luxury Rooms</h4>

<p>

Elegant rooms with premium interiors.

</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-utensils"></i>

<h4>Fine Dining</h4>

<p>

Multi-cuisine restaurant with expert chefs.

</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-person-swimming"></i>

<h4>Swimming Pool</h4>

<p>

Relax and refresh in our luxurious pool.

</p>

</div>

</div>

<div class="col-md-3">

<div class="feature-box">

<i class="fa-solid fa-spa"></i>

<h4>Spa & Wellness</h4>

<p>

Professional spa and wellness treatments.

</p>

</div>

</div>

</div>

</div>

<div class="vm">

<div class="container">

<div class="row">

<div class="col-md-6">

<h2>Our Vision</h2>

<p>

To become one of the finest luxury hotels by delivering exceptional hospitality,
comfort, and unforgettable guest experiences.

</p>

</div>

<div class="col-md-6">

<h2>Our Mission</h2>

<p>

To provide world-class accommodation, outstanding customer service,
and premium facilities while maintaining the highest standards of quality.

</p>

</div>

</div>

</div>

</div>

<h2 class="section-title">

Our Achievements

</h2>

<div class="container mb-5">

<div class="row g-4">

<div class="col-md-3">

<div class="counter">

<h1>250+</h1>

<p>Luxury Rooms</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>15+</h1>

<p>Years Experience</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>50+</h1>

<p>Professional Staff</p>

</div>

</div>

<div class="col-md-3">

<div class="counter">

<h1>25000+</h1>

<p>Happy Guests</p>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>
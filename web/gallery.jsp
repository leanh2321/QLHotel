<%-- 
    Document   : gallery
    Created on : 23 Jul 2026, 8:56:42 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Gallery | Royal Virasat Hotel</title>

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

<h1>Our Gallery</h1>

</div>

<div class="container">

<h2 class="heading">

Experience Luxury

</h2>

<p class="subheading">

Explore the elegance and comfort of Royal Stay Hotel.

</p>

<div class="row">

<div class="col-md-4">

<div class="gallery-item">

<img src="images/deluxe.jpg">

<div class="caption">

Luxury Deluxe Room

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/executive.jpg">

<div class="caption">

Executive Suite

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/presidential.jpg">

<div class="caption">

Presidential Suite

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/loby.jpg">

<div class="caption">

Hotel Lobby

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/swimming.jpg">

<div class="caption">

Swimming Pool

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/fine.jpg">

<div class="caption">

Fine Dining Restaurant

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/spa.jpg">

<div class="caption">

Spa & Wellness

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/honeymooon.jpg">

<div class="caption">

Luxury Bathroom

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/loby.jpg">

<div class="caption">

Conference Hall

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/gym.jpg">

<div class="caption">

Fitness Center

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/ggarden.jpg">

<div class="caption">

Garden View

</div>

</div>

</div>

<div class="col-md-4">

<div class="gallery-item">

<img src="images/night.jpg">

<div class="caption">

Night View

</div>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>
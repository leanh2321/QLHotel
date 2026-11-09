<%-- 
    Document   : footer
    Created on : 23 Jul 2026, 9:10:04 pm
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.footer{

background:#111;
color:white;

padding:50px 80px 20px;

margin-top:70px;

}

.footer-container{

display:flex;
justify-content:space-between;
flex-wrap:wrap;

}

.footer-box{

width:250px;

}

.footer-box h3{

color:#D4AF37;
margin-bottom:18px;

}

.footer-box p{

line-height:28px;

}

.footer-box a{

display:block;
color:white;
text-decoration:none;
margin:10px 0;
transition:.3s;

}

.footer-box a:hover{

color:#D4AF37;
padding-left:8px;

}

.social i{

font-size:25px;
margin-right:18px;
margin-top:15px;
cursor:pointer;
transition:.3s;

}

.social i:hover{

color:#D4AF37;
transform:scale(1.2);

}

.bottom{

margin-top:40px;
text-align:center;
border-top:1px solid gray;
padding-top:20px;
font-size:15px;

}

</style>

</head>

<body>

<footer class="footer">

<div class="footer-container">

<div class="footer-box">

<h3>

Royal Virasat

</h3>

<p>

Experience luxury, comfort and elegance with world-class hospitality.

</p>

<div class="social">

<i class="fab fa-facebook"></i>

<i class="fab fa-instagram"></i>

<i class="fab fa-twitter"></i>

<i class="fab fa-linkedin"></i>

</div>

</div>

<div class="footer-box">

<h3>

Quick Links

</h3>

<a href="index.jsp">Home</a>

<a href="about.jsp">About</a>

<a href="RoomServlet">Rooms</a>

<a href="gallery.jsp">Gallery</a>

<a href="contact.jsp">Contact</a>

</div>

<div class="footer-box">

<h3>

Contact

</h3>

<p>

<i class="fa-solid fa-location-dot"></i>

 Udaipur, Rajasthan

</p>

<p>

<i class="fa-solid fa-phone"></i>

 +91 9876543210

</p>

<p>

<i class="fa-solid fa-envelope"></i>

 info@royalvirasat.com

</p>

</div>

<div class="footer-box">

<h3>

Facilities

</h3>

<p>✔ Luxury Rooms</p>

<p>✔ Swimming Pool</p>

<p>✔ Spa & Wellness</p>

<p>✔ Free Wi-Fi</p>

<p>✔ Restaurant</p>

</div>

</div>

<div class="bottom">

© 2026 Royal Virasat | All Rights Reserved

</div>

</footer>

</body>
</html>

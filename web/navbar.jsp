<%-- 
    Document   : navbar
    Created on : 23 Jul 2026, 9:09:49 pm
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
Object loggedCustomer = session.getAttribute("customer");
Object loggedAdmin = session.getAttribute("admin");
%>

<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Segoe UI,sans-serif;
}

.navbar{

background:#111;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;

position:sticky;
top:0;
z-index:1000;

box-shadow:0 4px 12px rgba(0,0,0,.5);

}

.logo{

display:flex;
align-items:center;

}

.logo img{

height:55px;
width:90px;
border-radius:50%;
margin-right:10px;

}

.logo-text h2{

margin:0;
font-size:28px;
color:#D4AF37;
font-family:Georgia, serif;

}

.logo-text p{

margin:0;
font-size:12px;
letter-spacing:3px;
color:white;

}

.logo i{

margin-right:8px;

}

.nav-links{

list-style:none;
display:flex;
gap:30px;

}

.nav-links li a{

text-decoration:none;
color:white;
font-size:17px;
transition:.4s;
padding:8px 0;

}

.nav-links li a:hover{

color:#D4AF37;

}

.right-buttons a{

text-decoration:none;
margin-left:15px;
padding:10px 22px;
border-radius:30px;
font-weight:bold;
transition:.4s;

}

.register{

background:#D4AF37;
color:black;

}

.login{

border:2px solid #D4AF37;
color:#D4AF37;

}

.register:hover{

background:white;

}

.login:hover{

background:#D4AF37;
color:black;

}

</style>

</head>

<body>

<nav class="navbar">

<div class="logo">

<img src="images/Gemini_Generated_Image_e9hnoce9hnoce9hn-removebg-preview.png" alt="Royal Virasat Logo">

<div class="logo-text">

<h2>Khách sạn Mường Thanh</h2>

<p>Luxury Hotel & Resort</p>

</div>

</div>

<ul class="nav-links">

<li><a href="index.jsp">Home</a></li>

<li><a href="about.jsp">About</a></li>

<li><a href="RoomServlet">Rooms</a></li>

<li><a href="gallery.jsp">Gallery</a></li>

<li><a href="restaurant.jsp">Restaurant</a></li>

<li><a href="contact.jsp">Contact</a></li>

</ul>

<div class="right-buttons">

<% if(loggedAdmin != null){ %>

<a href="admindashboard.jsp" class="login">
Dashboard
</a>

<a href="LogoutServlet" class="register">
Logout
</a>

<% } else if(loggedCustomer != null){ %>

<a href="CustomerDashboardServlet" class="login">
Dashboard
</a>

<a href="LogoutServlet" class="register">
Logout
</a>

<% } else { %>

<a href="register.jsp" class="register">

Register

</a>

<a href="login.jsp" class="login">

Login

</a>

<% } %>

</div>

</nav>

</body>
</html>

<%-- 
    Document   : contact
    Created on : 23 Jul 2026, 8:57:49 pm
    Author     : Asus
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Contact Us | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    font-family:Segoe UI,sans-serif;
    background:#f8f8f8;
}

/************ Banner ************/

.banner{

height:300px;

background:url("images/contact1.jpg");

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

background:rgba(0,0,0,.6);

}

.banner h1{

position:relative;

color:white;

font-size:55px;

letter-spacing:3px;

}

/************ Contact ************/

.contact{

padding:70px 0;

}

.info{

background:#111;

color:white;

padding:40px;

border-radius:10px;

height:100%;

}

.info h2{

color:#D4AF37;

margin-bottom:30px;

}

.info p{

font-size:17px;

margin:18px 0;

}

.info i{

color:#D4AF37;

margin-right:12px;

font-size:20px;

}

.social i{

font-size:25px;

margin-right:20px;

cursor:pointer;

transition:.3s;

}

.social i:hover{

color:#D4AF37;

}

.form-box{

background:white;

padding:40px;

border-radius:10px;

box-shadow:0 0 15px rgba(0,0,0,.1);

}

.form-box h2{

color:#D4AF37;

margin-bottom:25px;

}

label{

font-weight:bold;

margin-top:15px;

}

input,textarea{

margin-top:5px;

}

.btn-send{

background:#D4AF37;

color:black;

font-weight:bold;

width:100%;

padding:12px;

margin-top:20px;

}

.btn-send:hover{

background:#111;

color:white;

}

.map{

margin-top:70px;

}

.success-box{

background:#e8f5e9;
border-left:6px solid #28a745;
padding:20px;
margin-top:25px;
border-radius:8px;
text-align:center;
box-shadow:0 5px 10px rgba(0,0,0,.15);

}

.success-box h3{

color:#28a745;
margin-bottom:10px;

}

.success-box p{

font-size:17px;
margin:0;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>CONTACT US</h1>

</div>
<%
String msg=request.getParameter("msg");

if(msg!=null)
{
%>

<div class="success-box">

<h3>✔ Thank You!</h3>

<p><%=msg%></p>

</div>

<%
}
%>

<div class="container contact">

<div class="row g-4">

<div class="col-md-5">

<div class="info">

<h2>Royal Virasat Hotel</h2>

<p>

<i class="fa-solid fa-location-dot"></i>

Lake City Road, Udaipur, Rajasthan

</p>

<p>

<i class="fa-solid fa-phone"></i>

+91 9876543210

</p>

<p>

<i class="fa-solid fa-envelope"></i>

info@royalvirasat.com

</p>

<p>

<i class="fa-solid fa-clock"></i>

24 × 7 Reception

</p>

<hr>

<h4 style="color:#D4AF37;">

Follow Us

</h4>

<div class="social">

<i class="fab fa-facebook"></i>

<i class="fab fa-instagram"></i>

<i class="fab fa-twitter"></i>

<i class="fab fa-linkedin"></i>

</div>

</div>

</div>

<div class="col-md-7">

<div class="form-box">

<h2>Send Us A Message</h2>

<form action="savecontact.jsp" method="post">

<label>Full Name</label>

<input
type="text"
name="name"
class="form-control"
required>

<label>Mobile Number</label>

<input
type="text"
name="mobile"
class="form-control"
maxlength="10"
required>

<label>Email Address</label>

<input
type="email"
name="email"
class="form-control"
required>

<label>Your Message</label>

<textarea
name="message"
rows="5"
class="form-control"
required></textarea>

<button
type="submit"
class="btn btn-send">

Send Message

</button>

</form>

</div>

</div>

</div>

<div class="map">

<iframe

src="https://www.google.com/maps?q=Udaipur,Rajasthan&output=embed"

width="100%"

height="400"

style="border:0; border-radius:10px;"

loading="lazy">

</iframe>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>

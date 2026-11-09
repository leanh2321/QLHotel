<%-- 
    Document   : customerdashboard
    Created on : 23 Jul 2026, 9:02:10 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String customerName = (String) session.getAttribute("customerName");

int totalBookings = (Integer) request.getAttribute("totalBookings");
int activeBookings = (Integer) request.getAttribute("activeBookings");
int completedBookings = (Integer) request.getAttribute("completedBookings");
int cancelledBookings = (Integer) request.getAttribute("cancelledBookings");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Customer Dashboard | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f4f4f4;
font-family:Segoe UI,sans-serif;

}

.banner{

height:280px;
background:url("images/night.jpg");
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
font-size:48px;

}

.welcome{

text-align:center;
margin-top:40px;

}

.welcome h2{

color:#D4AF37;

}

.card{

border:none;
border-radius:12px;
box-shadow:0 0 15px rgba(0,0,0,.15);
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card i{

font-size:50px;
color:#D4AF37;

}

.card-title{

margin-top:15px;

}

.btn-custom{

background:#D4AF37;
color:black;
font-weight:bold;

}

.btn-custom:hover{

background:black;
color:white;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Customer Dashboard</h1>

</div>

<div class="container">

<div class="welcome">

<h2>

Welcome,

<%=customerName%>

👋

</h2>

<p>

Manage your bookings and enjoy your stay.

</p>

</div>

<div class="row mt-5">

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Total Bookings</h5>

<h2 style="color:#D4AF37;">
<%=totalBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Active Bookings</h5>

<h2 style="color:green;">
<%=activeBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Completed</h5>

<h2 style="color:blue;">
<%=completedBookings%>
</h2>

</div>

</div>

<div class="col-md-3">

<div class="card p-3 text-center">

<h5>Cancelled</h5>

<h2 style="color:red;">
<%=cancelledBookings%>
</h2>

</div>

</div>

</div>

<div class="row mt-4">

<div class="col-md-3">

<div class="card p-4 text-center">

<i>🏨</i>

<h4 class="card-title">

Book Room

</h4>

<p>

Reserve luxury rooms instantly.

</p>

<a href="RoomServlet" class="btn btn-custom">

Book Now

</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>📖</i>

<h4 class="card-title">

Booking History

</h4>

<p>

View all previous bookings.

</p>

<a href="BookingHistoryServlet"

class="btn btn-custom">

View

</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>👤</i>

<h4 class="card-title">

My Profile

</h4>

<p>

Update your account details.

</p>

<a href="ProfileServlet"

class="btn btn-custom">

Profile

</a>

</div>

</div>

<div class="col-md-3">

<div class="card p-4 text-center">

<i>🚪</i>

<h4 class="card-title">

Logout

</h4>

<p>

Securely logout from account.

</p>

<a href="LogoutServlet"

class="btn btn-danger">

Logout

</a>

</div>

</div>

</div>

<div class="row mt-5">

<div class="col-md-6">

<div class="card p-4">

<h3 style="color:#D4AF37">

Hotel Facilities

</h3>

<ul>

<li>Luxury Rooms</li>

<li>Free Wi-Fi</li>

<li>Swimming Pool</li>

<li>Spa & Wellness</li>

<li>Restaurant</li>

<li>Gym</li>

<li>24×7 Room Service</li>

</ul>

</div>

</div>

<div class="col-md-6">

<div class="card p-4">

<h3 style="color:#D4AF37">

Need Help?

</h3>

<p>

Email : support@royalstay.com

</p>

<p>

Phone : +91 9876543210

</p>

<p>

Reception Available 24 × 7

</p>

<a href="contact.jsp"

class="btn btn-custom">

Contact Support

</a>

</div>

</div>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>

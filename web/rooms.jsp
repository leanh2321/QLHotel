<%-- 
    Document   : rooms.jsp
    Created on : 23 Jul 2026, 8:56:03?pm
    Author     : Asus
--%>

<%@page import="java.sql.*"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Rooms | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

font-family:Segoe UI,sans-serif;
background:#f5f5f5;

}

.banner{

height:280px;
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
font-size:50px;
letter-spacing:2px;

}

.section-title{

text-align:center;
margin:50px 0;
color:#D4AF37;
font-weight:bold;

}

.room-card{

border:none;
border-radius:12px;
overflow:hidden;
box-shadow:0 0 15px rgba(0,0,0,.15);
transition:.3s;
margin-bottom:30px;

}

.room-card:hover{

transform:translateY(-8px);

}

.room-card img{

height:230px;
object-fit:cover;

}

.price{

font-size:22px;
color:#D4AF37;
font-weight:bold;

}

.available{

color:green;
font-weight:bold;

}

.booked{

color:red;
font-weight:bold;

}

.btn-book{

background:#D4AF37;
color:black;
font-weight:bold;
width:100%;

}

.btn-book:hover{

background:black;
color:white;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Luxury Rooms</h1>

</div>

<div class="container">

<h2 class="section-title">

Choose Your Perfect Room

</h2>

<div class="row">

<%

try
{
ArrayList<Room> rooms =
(ArrayList<Room>)request.getAttribute("rooms");

for(Room room : rooms)
{

%>

<div class="col-md-4">

<div class="card room-card">

<img
src="images/<%=room.getRoomImage()%>"
class="card-img-top">

<div class="card-body">

<h4>

<%=room.getRoomType()%>

</h4>

<p>

<b>Room No :</b>

<%=room.getRoomNumber()%>

</p>

<p class="price">

? <%=room.getPrice()%> / Night

</p>

<p>

<b>Capacity :</b>

<%=room.getCapacity()%> Guests

</p>

<p>

<%=room.getDescription()%>

</p>

<%

if(room.getStatus().equalsIgnoreCase("Available"))
{

%>

<p class="available">

Available

</p>

<%

if(session.getAttribute("customerId") != null)
{

%>

<a href="BookRoomServlet?roomId=<%=room.getRoomId()%>"
class="btn btn-book">

Book Now

</a>

<%

}
else
{

%>

<a href="login.jsp?error=Please login to book a room."
class="btn btn-book">

Book Now

</a>

<%

}

}
else
{

%>

<p class="booked">

Booked

</p>

<button
class="btn btn-secondary w-100"
disabled>

Not Available

</button>

<%

}

%>

</div>

</div>

</div>

<%

}

}
catch(Exception e)
{

out.println(e);

}

%>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>

</html>

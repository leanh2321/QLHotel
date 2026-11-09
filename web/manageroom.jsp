<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Room"%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Room> rooms =
(ArrayList<Room>)request.getAttribute("rooms");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>

Manage Rooms | Royal Virasat Hotel

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:Segoe UI,sans-serif;

}

.heading{

color:#D4AF37;

font-weight:bold;

margin:35px 0;

}

.table-container{

background:white;

padding:30px;

border-radius:15px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

.table img{

width:120px;

height:80px;

object-fit:cover;

border-radius:10px;

}

.badge-available{

background:#198754;

color:white;

padding:8px 15px;

border-radius:20px;

}

.badge-booked{

background:#dc3545;

color:white;

padding:8px 15px;

border-radius:20px;

}

.badge-maintenance{

background:#ffc107;

color:black;

padding:8px 15px;

border-radius:20px;

}

.search-box{

display:flex;

justify-content:space-between;

margin-bottom:25px;

}

.btn-add{

background:#D4AF37;

color:black;

font-weight:bold;

}

.btn-add:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container">

<h2 class="heading">

Manage Rooms

</h2>

<div class="table-container">

<div class="search-box">

<form action="ManageRoomServlet" method="get">

<div class="input-group">

<input

type="text"

name="search"

class="form-control"

placeholder="Search Room Number"

value="<%=search%>">

<button class="btn btn-dark">

<i class="fa-solid fa-magnifying-glass"></i>

Search

</button>

</div>

</form>

<a href="addroom.jsp"
class="btn btn-add">

<i class="fa-solid fa-plus"></i>

Add New Room

</a>

</div>

<table class="table table-bordered table-hover align-middle">

<thead class="table-dark">

<tr>

<th>Image</th>

<th>Room No.</th>

<th>Room Type</th>

<th>Capacity</th>

<th>Price</th>

<th>Status</th>

<th width="170">

Actions

</th>

</tr>

</thead>

<tbody>

<%
for(Room room : rooms){
%>

<tr>

<td>

<img src="images/<%=room.getRoomImage()%>">

</td>

<td>

<%=room.getRoomNumber()%>

</td>

<td>

<%=room.getRoomType()%>

</td>

<td>

<%=room.getCapacity()%> Persons

</td>

<td>

₹ <%=String.format("%.2f", room.getPrice())%>

</td>

<td>

<%

String status = room.getStatus();

if(status.equalsIgnoreCase("Available")){

%>

<span class="badge-available">

Available

</span>

<%

}
else if(status.equalsIgnoreCase("Booked")){

%>

<span class="badge-booked">

Booked

</span>

<%

}
else{

%>

<span class="badge-maintenance">

Maintenance

</span>

<%

}

%>

</td>

<td>

<a href="EditRoomServlet?id=<%=room.getRoomId()%>"
class="btn btn-success btn-sm">

<i class="fa-solid fa-pen-to-square"></i>

Edit

</a>

<a href="DeleteRoomServlet?id=<%=room.getRoomId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this room?');">

<i class="fa-solid fa-trash"></i>

Delete

</a>

</td>

</tr>

<%

}

if(rooms.isEmpty()){

%>

<tr>

<td colspan="7"
class="text-center text-danger fw-bold">

No Rooms Found

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

</div>

<footer class="admin-footer">

<div class="container">

<div class="row">

<div class="col-md-6">

<h5>

Royal Virasat Hotel

</h5>

<p>

Luxury Hotel Management System

</p>

</div>

<div class="col-md-6 text-end">

<p>

© 2026 Royal Virasat Hotel

</p>

<p>

Designed by Siddharth Rathore

</p>

</div>

</div>

</div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
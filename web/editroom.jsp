<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="model.Room"%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp");
    return;

}

Room room=(Room)request.getAttribute("room");

if(room==null){

    response.sendRedirect("ManageRoomServlet");
    return;

}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>

Edit Room

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

.card{

margin:40px auto;

max-width:900px;

border:none;

border-radius:15px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

.card-header{

background:#111;

color:#D4AF37;

font-size:28px;

font-weight:bold;

text-align:center;

padding:20px;

}

.btn-save{

background:#D4AF37;

color:black;

font-weight:bold;

}

.btn-save:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container">

<div class="card">

<div class="card-header">

Edit Room

</div>

<div class="card-body">

<form action="UpdateRoomServlet" method="post">

<input
type="hidden"
name="roomId"
value="<%=room.getRoomId()%>">

<div class="row">

<div class="col-md-6 mb-3">

<label>

Room Number

</label>

<input
type="number"
name="roomNumber"
class="form-control"
required
value="<%=room.getRoomNumber()%>">

</div>

<div class="col-md-6 mb-3">

<label>

Room Type

</label>

<select
name="roomType"
class="form-select"
required>

<option value="Single"
<%=room.getRoomType().equals("Single")?"selected":""%>>

Single

</option>

<option value="Double"
<%=room.getRoomType().equals("Double")?"selected":""%>>

Double

</option>

<option value="Deluxe"
<%=room.getRoomType().equals("Deluxe")?"selected":""%>>

Deluxe

</option>

<option value="Suite"
<%=room.getRoomType().equals("Suite")?"selected":""%>>

Suite

</option>

</select>

</div>

<div class="col-md-6 mb-3">

<label>

Capacity

</label>

<input
type="number"
name="capacity"
class="form-control"
required
value="<%=room.getCapacity()%>">

</div>

<div class="col-md-6 mb-3">

<label>

Price Per Night

</label>

<input
type="number"
step="0.01"
name="price"
class="form-control"
required
value="<%=room.getPrice()%>">

</div>

<div class="col-md-12 mb-3">

<label>

Description

</label>

<textarea
name="description"
class="form-control"
rows="4"
required><%=room.getDescription()%></textarea>

</div>

<div class="col-md-6 mb-3">

<label>

Room Image

</label>

<input
type="text"
name="roomImage"
class="form-control"
required
value="<%=room.getRoomImage()%>">

<small class="text-muted">

Example:
deluxe.jpg

</small>

</div>

<div class="col-md-6 mb-3">

<label>

Status

</label>

<select
name="status"
class="form-select"
required>

<option value="Available"
<%=room.getStatus().equals("Available")?"selected":""%>>

Available

</option>

<option value="Booked"
<%=room.getStatus().equals("Booked")?"selected":""%>>

Booked

</option>

<option value="Maintenance"
<%=room.getStatus().equals("Maintenance")?"selected":""%>>

Maintenance

</option>

</select>

</div>

<div class="col-md-12 text-center mt-4">

<button
type="submit"
class="btn btn-save btn-lg">

<i class="fa-solid fa-floppy-disk"></i>

Update Room

</button>

<a href="ManageRoomServlet"
class="btn btn-secondary btn-lg ms-3">

<i class="fa-solid fa-arrow-left"></i>

Cancel

</a>

</div>

</div>

</form>

</div>

</div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
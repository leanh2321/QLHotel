<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Booking"%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Booking> bookings =
(ArrayList<Booking>)request.getAttribute("bookings");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html>

<head>

<title>

Manage Bookings

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.container-box{

background:white;

margin:40px auto;

padding:30px;

border-radius:12px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

font-weight:bold;

margin-bottom:25px;

}

.table th{

background:black;

color:#D4AF37;

}

.pending{

color:orange;

font-weight:bold;

}

.confirmed{

color:green;

font-weight:bold;

}

.checkedin{

color:#0d6efd;

font-weight:bold;

}

.checkedout{

color:#6f42c1;

font-weight:bold;

}

.cancelled{

color:red;

font-weight:bold;

}

.btn-approve{

background:green;

color:white;

}

.btn-reject{

background:red;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container container-box">

<h2>

Manage Bookings

</h2>

<%

String success=request.getParameter("success");

String error=request.getParameter("error");

if(success!=null){
%>

<div class="alert alert-success">

<%=success%>

</div>

<%
}

if(error!=null){
%>

<div class="alert alert-danger">

<%=error%>

</div>

<%
}
%>

<form action="ManageBookingServlet" method="get">

<div class="row mb-4">

<div class="col-md-10">

<input

type="text"

name="search"

class="form-control"

placeholder="Search Customer / Email / Room Number"

value="<%=search%>">

</div>

<div class="col-md-2">

<button class="btn btn-dark w-100">

<i class="fa-solid fa-magnifying-glass"></i>

Search

</button>

</div>

</div>

</form>

<table class="table table-bordered table-hover align-middle text-center">

<thead>

<tr>

<th>Booking ID</th>

<th>Customer</th>

<th>Mobile</th>

<th>Email</th>

<th>Room No.</th>

<th>Room Type</th>

<th>Check In</th>

<th>Check Out</th>

<th>Guests</th>

<th>Total Amount</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
for(Booking booking : bookings){

String status = booking.getBookingStatus();
%>

<tr>

<td><%=booking.getBookingId()%></td>

<td><%=booking.getCustomerName()%></td>

<td><%=booking.getCustomerMobile()%></td>

<td><%=booking.getCustomerEmail()%></td>

<td><%=booking.getRoomNumber()%></td>

<td><%=booking.getRoomType()%></td>

<td><%=booking.getCheckIn()%></td>

<td><%=booking.getCheckOut()%></td>

<td><%=booking.getGuests()%></td>

<td>

₹ <%=String.format("%.2f", booking.getTotalAmount())%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<span class="pending">

Pending

</span>

<%

}else if(status.equalsIgnoreCase("Confirmed")){

%>

<span class="confirmed">

Confirmed

</span>

<%

}else if(status.equalsIgnoreCase("Checked In")){

%>

<span class="checkedin">

Checked In

</span>

<%

}else if(status.equalsIgnoreCase("Checked Out")){

%>

<span class="checkedout">

Checked Out

</span>

<%

}else{

%>

<span class="cancelled">

Cancelled

</span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<a href="ApproveBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-success btn-sm">

Approve

</a>

<a href="RejectBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm">

Reject

</a>

<%

}else if(status.equalsIgnoreCase("Confirmed")){

%>

<a href="CheckInServlet?id=<%=booking.getBookingId()%>"
class="btn btn-primary btn-sm">

Check In

</a>

<a href="RejectBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm">

Cancel

</a>

<%

}else if(status.equalsIgnoreCase("Checked In")){

%>

<a href="CheckOutServlet?id=<%=booking.getBookingId()%>"
class="btn btn-warning btn-sm">

Check Out

</a>

<%

}else if(status.equalsIgnoreCase("Checked Out")){

%>

<a href="invoice.jsp?id=<%=booking.getBookingId()%>"
class="btn btn-dark btn-sm">

Invoice

</a>

<%

}else{

%>

-

<%

}

%>

</td>

</tr>

<%

}

if(bookings.isEmpty()){

%>

<tr>

<td colspan="12" class="text-center text-danger fw-bold">

No Bookings Found

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
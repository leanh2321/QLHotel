<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Booking"%>

<%
ArrayList<Booking> bookingList =
(ArrayList<Booking>)request.getAttribute("bookingList");

if(session.getAttribute("customerId")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Booking History</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;

}

.box{

width:95%;

margin:40px auto;

background:white;

padding:30px;

border-radius:15px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

margin-bottom:25px;

font-weight:bold;

}

.badge{

font-size:14px;

padding:8px 14px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="box">

<h2>My Booking History</h2>

<table class="table table-bordered table-hover text-center align-middle">

<thead class="table-dark">

<tr>

<th>Booking ID</th>

<th>Room No.</th>

<th>Room Type</th>

<th>Check In</th>

<th>Check Out</th>

<th>Guests</th>

<th>Amount</th>

<th>Status</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%

if(bookingList!=null && !bookingList.isEmpty()){

for(Booking booking : bookingList){

%>

<tr>

<td><%=booking.getBookingId()%></td>

<td><%=booking.getRoomNumber()%></td>

<td><%=booking.getRoomType()%></td>

<td><%=booking.getCheckIn()%></td>

<td><%=booking.getCheckOut()%></td>

<td><%=booking.getGuests()%></td>

<td>₹ <%=booking.getTotalAmount()%></td>

<td>

<%

String status=booking.getBookingStatus();

if(status.equalsIgnoreCase("Confirmed")){

%>

<span class="badge bg-success">Confirmed</span>

<%

}else if(status.equalsIgnoreCase("Pending")){

%>

<span class="badge bg-warning text-dark">Pending</span>

<%

}else if(status.equalsIgnoreCase("Cancelled")){

%>

<span class="badge bg-danger">Cancelled</span>

<%

}else{

%>

<span class="badge bg-primary"><%=status%></span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")
|| status.equalsIgnoreCase("Confirmed")){

%>

<a href="CancelBookingServlet?bookingId=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Cancel this booking?')">

Cancel

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

}else{

%>

<tr>

<td colspan="9">

No bookings found.

</td>

</tr>

<%

}

%>

</tbody>

</table>

<div class="text-center mt-4">

<a href="CustomerDashboardServlet"
class="btn btn-secondary">

Back to Dashboard

</a>

</div>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
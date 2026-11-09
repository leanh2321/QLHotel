<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="model.Booking"%>
<%@page import="model.Customer"%>
<%@page import="model.Room"%>

<%
Booking booking=(Booking)request.getAttribute("booking");
Customer customer=(Customer)request.getAttribute("customer");
Room room=(Room)request.getAttribute("room");

if(booking==null || customer==null || room==null){

    response.sendRedirect("CustomerDashboardServlet");
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

Invoice

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:'Segoe UI',sans-serif;

}

.invoice{

width:1000px;

margin:40px auto;

background:white;

padding:40px;

box-shadow:0 0 20px rgba(0,0,0,.15);

border-radius:15px;

}

.hotel-name{

font-size:36px;

font-weight:bold;

color:#D4AF37;

}

.invoice-title{

font-size:30px;

font-weight:bold;

color:#111;

}

.section-title{

font-size:18px;

font-weight:bold;

color:#D4AF37;

margin-top:30px;

margin-bottom:15px;

border-bottom:2px solid #D4AF37;

padding-bottom:8px;

}

.table td{

padding:12px;

}

.label{

font-weight:bold;

width:220px;

background:#fafafa;

}

.status{

padding:8px 20px;

background:#198754;

color:white;

border-radius:30px;

font-weight:bold;

display:inline-block;

}

.logo{

width:110px;

height:auto;

}

</style>

</head>

<body>

<div class="invoice">

<div class="row align-items-center">

<div class="col-md-3">

<img
src="images/Gemini_Generated_Image_e9hnoce9hnoce9hn-removebg-preview.png"
class="logo">

</div>

<div class="col-md-6 text-center">

<div class="hotel-name">

Royal Virasat Hotel

</div>

<div>

Luxury Hotel & Resort

</div>

</div>

<div class="col-md-3 text-end">

<div class="invoice-title">

INVOICE

</div>

<p>

Invoice #

<b>

<%=booking.getBookingId()%>

</b>

</p>

<p>

Booking Date

<br>

<b>

<%=booking.getBookingDate()%>

</b>

</p>

</div>

</div>

<hr>

<div class="section-title">

Customer Details

</div>

<table class="table table-bordered">

<tr>

<td class="label">

Customer ID

</td>

<td>

<%=customer.getCustomerId()%>

</td>

</tr>

<tr>

<td class="label">

Customer Name

</td>

<td>

<%=customer.getName()%>

</td>

</tr>

<tr>

<td class="label">

Email

</td>

<td>

<%=customer.getEmail()%>

</td>

</tr>

<tr>

<td class="label">

Mobile Number

</td>

<td>

<%=customer.getMobile()%>

</td>

</tr>

<tr>

<td class="label">

Address

</td>

<td>

<%=customer.getAddress()%>

<%=customer.getCity()%>,

<%=customer.getState()%>

-

<%=customer.getPincode()%>

</td>

</tr>

</table>

<div class="section-title">

Room & Booking Details

</div>

<table class="table table-bordered">

<tr>

<td class="label">

Room Number

</td>

<td>

<%=room.getRoomNumber()%>

</td>

</tr>

<tr>

<td class="label">

Room Type

</td>

<td>

<%=room.getRoomType()%>

</td>

</tr>

<tr>

<td class="label">

Check-In Date

</td>

<td>

<%=booking.getCheckIn()%>

</td>

</tr>

<tr>

<td class="label">

Check-Out Date

</td>

<td>

<%=booking.getCheckOut()%>

</td>

</tr>

<tr>

<td class="label">

Guests

</td>

<td>

<%=booking.getGuests()%>

</td>

</tr>

<tr>

<td class="label">

Booking Status

</td>

<td>

<span class="status">

<%=booking.getBookingStatus()%>

</span>

</td>

</tr>

</table>

<div class="section-title">

Payment Summary

</div>

<table class="table table-bordered text-center">

<thead class="table-dark">

<tr>

<th>

Description

</th>

<th>

Amount (₹)

</th>

</tr>

</thead>

<tbody>

<tr>

<td>

<%=room.getRoomType()%> Room Charges

</td>

<td>

₹ <%=booking.getTotalAmount()%>

</td>

</tr>

<tr>

<td>

GST & Service Charges

</td>

<td>

Included

</td>

</tr>

<tr>

<td>

Other Charges

</td>

<td>

₹ 0.00

</td>

</tr>

<tr class="table-warning">

<td>

<b>

Grand Total

</b>

</td>

<td>

<b>

₹ <%=booking.getTotalAmount()%>

</b>

</td>

</tr>

</tbody>

</table>

<div class="alert alert-success mt-4 text-center">

<h4>

✅ Booking Confirmed Successfully

</h4>

<p class="mb-0">

Thank you for choosing

<b>

Royal Virasat Hotel

</b>.

We wish you a pleasant stay.

</p>

</div>

<div class="text-center mt-5">

<button
onclick="window.print()"
class="btn btn-warning btn-lg me-3">

🖨 Print Invoice

</button>

<a
href="CustomerDashboardServlet"
class="btn btn-dark btn-lg">

🏠 Back to Dashboard

</a>

</div>

<hr class="mt-5">

<div class="text-center">

<h5 style="color:#D4AF37;">

Royal Virasat Hotel

</h5>

<p>

Thank you for choosing Royal Virasat Hotel.

We look forward to welcoming you again.

</p>

<p>

📍 Bengaluru, Karnataka, India

</p>

<p>

📞 +91 9876543210

</p>

<p>

✉ support@royalvirasathotel.com

</p>

</div>

</div>

<style>

@media print{

body{

background:white;

}

button,

.btn{

display:none !important;

}

.invoice{

width:100%;

margin:0;

padding:20px;

box-shadow:none;

border:none;

}

}

</style>

</body>

</html>
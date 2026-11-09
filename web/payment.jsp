<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.BookingDAO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="model.Booking"%>
<%@page import="model.Room"%>

<%
if(session.getAttribute("customerId")==null){

    response.sendRedirect("login.jsp?error=Please Login First");
    return;

}

int bookingId=Integer.parseInt(request.getParameter("bookingId"));

BookingDAO bookingDAO=new BookingDAO();

Booking booking=bookingDAO.getBookingById(bookingId);

RoomDAO roomDAO=new RoomDAO();

Room room=roomDAO.getRoomById(booking.getRoomId());
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>

Payment

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f4f4f4;

font-family:Segoe UI,sans-serif;

}

.payment-box{

width:1100px;

margin:40px auto;

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 0 20px rgba(0,0,0,.15);

}

.left-box{

background:#111;

color:white;

padding:30px;

border-radius:15px;

height:100%;

}

.gold{

color:#D4AF37;

}

.amount{

font-size:40px;

font-weight:bold;

color:#D4AF37;

}

.method{

padding:15px;

border:2px solid #ddd;

border-radius:10px;

margin-bottom:15px;

cursor:pointer;

transition:.3s;

}

.method:hover{

border-color:#D4AF37;

background:#faf7ef;

}

.pay-btn{

background:#D4AF37;

font-size:20px;

font-weight:bold;

width:100%;

}

.pay-btn:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="payment-box">

<div class="row">

<div class="col-md-5">

<div class="left-box">

<h2 class="gold">

Royal Virasat Hotel

</h2>

<hr>

<h5>

Booking ID

</h5>

<p>

#<%=booking.getBookingId()%>

</p>

<h5>

Room

</h5>

<p>

<%=room.getRoomType()%>

</p>

<h5>

Room Number

</h5>

<p>

<%=room.getRoomNumber()%>

</p>

<h5>

Check In

</h5>

<p>

<%=booking.getCheckIn()%>

</p>

<h5>

Check Out

</h5>

<p>

<%=booking.getCheckOut()%>

</p>

<h5>

Guests

</h5>

<p>

<%=booking.getGuests()%>

</p>

<hr>

<div class="amount">

₹ <%=booking.getTotalAmount()%>

</div>

<p>

Amount Payable

</p>

</div>

</div>

<div class="col-md-7">

<h2 class="gold mb-4">

Choose Payment Method

</h2>

<form
action="ProcessPaymentServlet"
method="post"
id="paymentForm">

<input
type="hidden"
name="bookingId"
value="<%=booking.getBookingId()%>">

<div class="method">

<input
type="radio"
name="paymentMethod"
value="UPI"
checked
onclick="showMethod('upi')">

<b>

UPI Payment

</b>

</div>

<div id="upiBox" class="mb-4">

<label>

Select UPI App

</label>

<select
class="form-select"
name="upi">

<option>

Google Pay

</option>

<option>

PhonePe

</option>

<option>

Paytm

</option>

<option>

BHIM UPI

</option>

</select>

</div>

<div class="method">

<input
type="radio"
name="paymentMethod"
value="Card"
onclick="showMethod('card')">

<b>

Credit / Debit Card

</b>

</div>

<div
id="cardBox"
style="display:none;">

<div class="mb-3">

<label>

Card Number

</label>

<input
type="text"
class="form-control"
maxlength="16"
placeholder="1234 5678 9012 3456">

</div>

<div class="row">

<div class="col-md-8">

<label>

Card Holder

</label>

<input
type="text"
class="form-control"
placeholder="Name on Card">

</div>

<div class="col-md-2">

<label>

MM/YY

</label>

<input
type="text"
class="form-control"
maxlength="5">

</div>

<div class="col-md-2">

<label>

CVV

</label>

<input
type="password"
class="form-control"
maxlength="3">

</div>

</div>

</div>

<div class="method mt-3">

<input
type="radio"
name="paymentMethod"
value="Net Banking"
onclick="showMethod('bank')">

<b>

Net Banking

</b>

</div>

<div
id="bankBox"
style="display:none;"
class="mb-3">

<label>

Select Bank

</label>

<select class="form-select">

<option>

State Bank of India

</option>

<option>

HDFC Bank

</option>

<option>

ICICI Bank

</option>

<option>

Axis Bank

</option>

<option>

Punjab National Bank

</option>

</select>

</div>

<div class="method">

<input
type="radio"
name="paymentMethod"
value="Cash"
onclick="showMethod('cash')">

<b>

Cash at Hotel

</b>

</div>

<div
id="cashBox"
style="display:none;"
class="alert alert-warning">

You can pay at the hotel reception during Check-In.

</div>

<div class="mt-4">

<button
type="submit"
class="btn pay-btn">

Pay Now

</button>

</div>

</form>

</div>

</div>

</div>

<script>

function showMethod(type){

document.getElementById("upiBox").style.display="none";
document.getElementById("cardBox").style.display="none";
document.getElementById("bankBox").style.display="none";
document.getElementById("cashBox").style.display="none";

if(type=="upi"){

document.getElementById("upiBox").style.display="block";

}

if(type=="card"){

document.getElementById("cardBox").style.display="block";

}

if(type=="bank"){

document.getElementById("bankBox").style.display="block";

}

if(type=="cash"){

document.getElementById("cashBox").style.display="block";

}

}

document.getElementById("paymentForm").addEventListener("submit",function(e){

e.preventDefault();

let button=document.querySelector(".pay-btn");

button.disabled=true;

button.innerHTML=`
<div class="spinner-border spinner-border-sm text-dark me-2"></div>
Processing Payment...
`;

setTimeout(function(){

document.getElementById("paymentForm").submit();

},2000);

});

</script>

<%@include file="footer.jsp"%>

</body>

</html>
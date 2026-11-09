<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Room"%>

<%
if(session.getAttribute("customerId")==null){

    response.sendRedirect("login.jsp?error=Please Login First");
    return;

}

Room room=(Room)request.getAttribute("room");

if(room==null){

    response.sendRedirect("rooms.jsp");
    return;

}

int customerId=(Integer)session.getAttribute("customerId");
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>

Book Room

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f4f4f4;

font-family:Segoe UI,sans-serif;

}

.booking-box{

width:1100px;

margin:50px auto;

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 0 20px rgba(0,0,0,.15);

}

.room-image{

width:100%;

height:350px;

object-fit:cover;

border-radius:12px;

}

.gold{

color:#D4AF37;

font-weight:bold;

}

.price{

font-size:30px;

font-weight:bold;

color:#D4AF37;

}

.total-box{

background:#f8f8f8;

padding:20px;

border-radius:10px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="booking-box">

<div class="row">

<div class="col-md-6">

<img
src="images/<%=room.getRoomImage()%>"
class="room-image">

</div>

<div class="col-md-6">

<h2 class="gold">

<%=room.getRoomType()%>

</h2>

<hr>

<h4>

Room Number :

<%=room.getRoomNumber()%>

</h4>

<h4>

Capacity :

<%=room.getCapacity()%> Guests

</h4>

<p>

<%=room.getDescription()%>

</p>

<div class="price">

₹ <%=room.getPrice()%> / Night

</div>

<hr>

<form action="ConfirmBookingServlet" method="post">

<input type="hidden"
name="roomId"
value="<%=room.getRoomId()%>">

<input type="hidden"
name="customerId"
value="<%=customerId%>">

<input type="hidden"
id="price"
value="<%=room.getPrice()%>">

<div class="mb-3">

<label class="form-label">

Check In

</label>

<input
type="date"
class="form-control"
id="checkIn"
name="checkIn"
required>

</div>

<div class="mb-3">

<label class="form-label">

Check Out

</label>

<input
type="date"
class="form-control"
id="checkOut"
name="checkOut"
required>

</div>

<div class="mb-3">

<label class="form-label">

Guests

</label>

<select
class="form-select"
name="guests"
id="guests"
required>

<%
for(int i=1;i<=room.getCapacity();i++)
{
%>

<option value="<%=i%>">

<%=i%>

</option>

<%
}
%>

</select>

</div>

<div class="total-box">

<div class="d-flex justify-content-between">

<h5>

Price / Night

</h5>

<h5>

₹ <%=room.getPrice()%>

</h5>

</div>

<hr>

<div class="d-flex justify-content-between">

<h5>

Total Nights

</h5>

<h5 id="nights">

0

</h5>

</div>

<hr>

<div class="d-flex justify-content-between">

<h4 class="gold">

Total Amount

</h4>

<h4
class="gold"
id="totalAmount">

₹ 0

</h4>

</div>

</div>

<input
type="hidden"
name="totalAmount"
id="hiddenTotal">

<div class="mt-4">

<button
type="submit"
class="btn btn-warning btn-lg w-100">

Confirm Booking

</button>

</div>

</form>

</div>

</div>

</div>

<script>

const checkIn=document.getElementById("checkIn");

const checkOut=document.getElementById("checkOut");

const price=parseFloat(document.getElementById("price").value);

const nights=document.getElementById("nights");

const total=document.getElementById("totalAmount");

const hiddenTotal=document.getElementById("hiddenTotal");

// Today's Date

let today=new Date().toISOString().split("T")[0];

checkIn.min=today;

function calculateTotal(){

if(checkIn.value=="" || checkOut.value=="")
{

nights.innerHTML="0";

total.innerHTML="₹ 0";

hiddenTotal.value=0;

return;

}

let inDate=new Date(checkIn.value);

let outDate=new Date(checkOut.value);

if(outDate<=inDate)
{

alert("Check-Out date must be after Check-In date.");

checkOut.value="";

nights.innerHTML="0";

total.innerHTML="₹ 0";

hiddenTotal.value=0;

return;

}

let diff=outDate-inDate;

let totalNights=Math.ceil(diff/(1000*60*60*24));

let amount=totalNights*price;

nights.innerHTML=totalNights;

total.innerHTML="₹ "+amount.toFixed(2);

hiddenTotal.value=amount;

}

// When Check-In changes

checkIn.addEventListener("change",function(){

checkOut.min=checkIn.value;

calculateTotal();

});

// When Check-Out changes

checkOut.addEventListener("change",calculateTotal);

</script>

<%@include file="footer.jsp"%>

</body>

</html>
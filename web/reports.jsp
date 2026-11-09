<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp");
    return;

}

int totalRooms=(Integer)request.getAttribute("totalRooms");
int availableRooms=(Integer)request.getAttribute("availableRooms");
int bookedRooms=(Integer)request.getAttribute("bookedRooms");
int totalCustomers=(Integer)request.getAttribute("totalCustomers");
int totalBookings=(Integer)request.getAttribute("totalBookings");
int confirmedBookings=(Integer)request.getAttribute("confirmedBookings");
int cancelledBookings=(Integer)request.getAttribute("cancelledBookings");

double totalRevenue=(Double)request.getAttribute("totalRevenue");
double occupancy=(Double)request.getAttribute("occupancy");

%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

Reports

</title>

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>

body{

background:#f5f5f5;

font-family:Segoe UI,sans-serif;

}

.report-title{

margin:35px 0;

font-weight:bold;

color:#D4AF37;

}

.report-card{

border:none;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.15);

transition:.3s;

}

.report-card:hover{

transform:translateY(-6px);

}

.report-card .card-body{

text-align:center;

padding:25px;

}

.report-card i{

font-size:38px;

margin-bottom:10px;

color:#D4AF37;

}

.report-card h2{

font-weight:bold;

margin:10px 0;

}

.chart-card{

margin-top:35px;

padding:25px;

background:white;

border-radius:15px;

box-shadow:0 5px 15px rgba(0,0,0,.15);

}

.progress{

height:28px;

border-radius:20px;

}

.progress-bar{

font-size:15px;

font-weight:bold;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container">

<h2 class="report-title">

Hotel Reports

</h2>

<div class="row g-4">
    
<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-hotel"></i>

<h2>

<%=totalRooms%>

</h2>

<p>

Total Rooms

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-bed"></i>

<h2>

<%=availableRooms%>

</h2>

<p>

Available Rooms

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-calendar-check"></i>

<h2>

<%=totalBookings%>

</h2>

<p>

Total Bookings

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-users"></i>

<h2>

<%=totalCustomers%>

</h2>

<p>

Customers

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-indian-rupee-sign"></i>

<h2>

₹ <%=String.format("%.2f",totalRevenue)%>

</h2>

<p>

Revenue

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-circle-check"></i>

<h2>

<%=confirmedBookings%>

</h2>

<p>

Confirmed

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-circle-xmark"></i>

<h2>

<%=cancelledBookings%>

</h2>

<p>

Cancelled

</p>

</div>

</div>

</div>

<div class="col-md-3">

<div class="card report-card">

<div class="card-body">

<i class="fa-solid fa-chart-line"></i>

<h2>

<%=String.format("%.1f",occupancy)%>%

</h2>

<p>

Occupancy

</p>

</div>

</div>

</div>

</div>

<div class="chart-card">

<h4 class="mb-4">

Room Occupancy

</h4>

<div class="progress">

<div
class="progress-bar bg-success"
role="progressbar"
style="width:<%=occupancy%>%">

<%=String.format("%.1f",occupancy)%>%

</div>

</div>

</div>

<div class="row mt-4">

<div class="col-md-6">

<div class="chart-card">

<h4 class="mb-3">

Room Status

</h4>

<canvas id="roomChart"></canvas>

</div>

</div>

<div class="col-md-6">

<div class="chart-card">

<h4 class="mb-3">

Booking Status

</h4>

<canvas id="bookingChart"></canvas>

</div>

</div>

</div>

<script>

// Room Status Chart
new Chart(document.getElementById("roomChart"), {

    type: 'pie',

    data: {

        labels: ['Available','Booked'],

        datasets: [{

            data: [<%=availableRooms%>, <%=bookedRooms%>],

            backgroundColor: [

                '#198754',

                '#dc3545'

            ]

        }]

    },

    options: {

        responsive: true

    }

});

// Booking Status Chart
new Chart(document.getElementById("bookingChart"), {

    type: 'doughnut',

    data: {

        labels: ['Confirmed','Cancelled'],

        datasets: [{

            data: [<%=confirmedBookings%>, <%=cancelledBookings%>],

            backgroundColor: [

                '#0d6efd',

                '#ffc107'

            ]

        }]

    },

    options: {

        responsive: true

    }

});

</script>

<footer class="mt-5 bg-dark text-white text-center p-3">

Royal Virasat Hotel — Reports Dashboard © 2026

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
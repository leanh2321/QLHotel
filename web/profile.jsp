<%--
    Document   : profile
    Created on : 23 Jul 2026
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>

<%
Customer customer = (Customer) request.getAttribute("customer");

if(customer == null){
    response.sendRedirect("CustomerDashboardServlet");
    return;
}
%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>

My Profile

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.profile-box{

width:900px;

margin:40px auto;

background:white;

padding:35px;

border-radius:12px;

box-shadow:0px 0px 20px rgba(0,0,0,.15);

}

.heading{

text-align:center;

color:#D4AF37;

font-weight:bold;

margin-bottom:30px;

}

.table td{

padding:15px;

font-size:16px;

}

.label{

font-weight:bold;

width:220px;

background:#f8f8f8;

}

.btn-gold{

background:#D4AF37;

color:black;

font-weight:bold;

}

.btn-gold:hover{

background:black;

color:white;

}

.btn-dark{

font-weight:bold;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="profile-box">

<h2 class="heading">

My Profile

</h2>

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

Full Name

</td>

<td>

<%=customer.getName()%>

</td>

</tr>

<tr>

<td class="label">

Gender

</td>

<td>

<%=customer.getGender()%>

</td>

</tr>

<tr>

<td class="label">

Date of Birth

</td>

<td>

<%=customer.getDob()%>

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

Email Address

</td>

<td>

<%=customer.getEmail()%>

</td>

</tr>

<tr>

<td class="label">

Address

</td>

<td>

<%=customer.getAddress()%>

</td>

</tr>

<tr>

<td class="label">

City

</td>

<td>

<%=customer.getCity()%>

</td>

</tr>

<tr>

<td class="label">

State

</td>

<td>

<%=customer.getState()%>

</td>

</tr>

<tr>

<td class="label">

PIN Code

</td>

<td>

<%=customer.getPincode()%>

</td>

</tr>

</table>

<div class="text-center mt-4">

<a
href="EditProfileServlet"
class="btn btn-gold me-2">

Edit Profile

</a>

<a
href="changepassword.jsp"
class="btn btn-dark me-2">

Change Password

</a>

<a
href="CustomerDashboardServlet"
class="btn btn-secondary">

Back to Dashboard

</a>

</div>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
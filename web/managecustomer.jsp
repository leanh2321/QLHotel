<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Customer"%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Customer> customers =
(ArrayList<Customer>)request.getAttribute("customers");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html>

<head>

<title>

Manage Customers

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.container-box{

margin:40px auto;

background:white;

padding:30px;

border-radius:12px;

box-shadow:0px 0px 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

font-weight:bold;

margin-bottom:25px;

}

.btn-delete{

background:#dc3545;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container container-box">

<h2>

Manage Customers

</h2>

<form action="ManageCustomerServlet" method="get">

<div class="row">

<div class="col-md-10">

<input
type="text"
name="search"
class="form-control"
placeholder="Search by Name, Email or Mobile"
value="<%=search%>">

</div>

<div class="col-md-2">

<button class="btn btn-dark w-100">

Search

</button>

</div>

</div>

</form>

<br>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>ID</th>

<th>Name</th>

<th>Email</th>

<th>Mobile</th>

<th>Gender</th>

<th>City</th>

<th>State</th>

<th>Action</th>

</tr>

</thead>

<tbody>

<%
for(Customer customer : customers){
%>

<tr>

<td>

<%=customer.getCustomerId()%>

</td>

<td>

<%=customer.getName()%>

</td>

<td>

<%=customer.getEmail()%>

</td>

<td>

<%=customer.getMobile()%>

</td>

<td>

<%=customer.getGender()%>

</td>

<td>

<%=customer.getCity()%>

</td>

<td>

<%=customer.getState()%>

</td>

<td>

<a href="DeleteCustomerServlet?id=<%=customer.getCustomerId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Delete this customer?');">

Delete

</a>

</td>

</tr>

<%

}

if(customers.isEmpty()){

%>

<tr>

<td colspan="8" class="text-center text-danger fw-bold">

No Customers Found

</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<%@include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>
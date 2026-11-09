<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
if(session.getAttribute("customerId")==null){
    response.sendRedirect("login.jsp?error=Please Login First");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Change Password | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;
font-family:Segoe UI,sans-serif;

}

.password-box{

width:500px;
margin:60px auto;
background:white;
padding:35px;
border-radius:15px;
box-shadow:0 0 20px rgba(0,0,0,.15);

}

.heading{

text-align:center;
color:#D4AF37;
font-weight:bold;
margin-bottom:30px;

}

label{

font-weight:bold;
margin-top:15px;

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

.error{

color:red;
font-size:14px;

}

.success{

color:green;
font-size:14px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="password-box">

<h2 class="heading">

Change Password

</h2>

<%

String error=request.getParameter("error");

if(error!=null){

%>

<div class="alert alert-danger">

<%=error%>

</div>

<%

}

String success=request.getParameter("success");

if(success!=null){

%>

<div class="alert alert-success">

<%=success%>

</div>

<%

}

%>

<form action="ChangePasswordServlet" method="post">

<label>

Current Password

</label>

<input
type="password"
class="form-control"
name="oldPassword"
required>

<label>

New Password

</label>

<input
type="password"
class="form-control"
name="newPassword"
required>

<label>

Confirm Password

</label>

<input
type="password"
class="form-control"
name="confirmPassword"
required>

<div class="text-center mt-4">

<button
type="submit"
class="btn btn-gold btn-lg">

Update Password

</button>

<a
href="ProfileServlet"
class="btn btn-secondary btn-lg ms-2">

Cancel

</a>

</div>

</form>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
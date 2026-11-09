<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Forgot Password | Royal Virasat Hotel</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:'Segoe UI',sans-serif;

}

.forgot-section{

padding:70px 0;

min-height:75vh;

display:flex;

align-items:center;

justify-content:center;

}

.card{

width:500px;

border:none;

border-radius:20px;

box-shadow:0 0 20px rgba(0,0,0,.18);

overflow:hidden;

}

.card-header{

background:#111;

color:#D4AF37;

text-align:center;

padding:25px;

}

.card-header h2{

margin:0;

font-weight:bold;

}

.card-body{

padding:35px;

}

.form-label{

font-weight:bold;

}

.form-control{

height:48px;

border-radius:10px;

}

.btn-reset{

background:#D4AF37;

color:black;

font-weight:bold;

height:48px;

border:none;

border-radius:10px;

transition:.3s;

}

.btn-reset:hover{

background:#111;

color:#fff;

}

.back-link{

text-align:center;

margin-top:20px;

}

.back-link a{

text-decoration:none;

font-weight:bold;

color:#111;

}

.back-link a:hover{

color:#D4AF37;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<section class="forgot-section">

<div class="card">

<div class="card-header">

<h2>

<i class="fa-solid fa-key"></i>

Forgot Password

</h2>

</div>

<div class="card-body">

<%

String error=request.getParameter("error");
String success=request.getParameter("success");

if(error!=null){
%>

<div class="alert alert-danger">

<%=error%>

</div>

<%
}

if(success!=null){
%>

<div class="alert alert-success">

<%=success%>

</div>

<%
}
%>

<form action="ForgotPasswordServlet" method="post">

<div class="mb-3">

<label class="form-label">

Email Address

</label>

<input
type="email"
name="email"
class="form-control"
placeholder="Enter your registered email"
required>

</div>

<div class="mb-3">

<label class="form-label">

New Password

</label>

<input
type="password"
name="password"
class="form-control"
placeholder="Enter new password"
required>

</div>

<button
type="submit"
class="btn btn-reset w-100">

<i class="fa-solid fa-rotate-right"></i>

Update Password

</button>

</form>

<div class="back-link">

<a href="login.jsp">

<i class="fa-solid fa-arrow-left"></i>

Back to Login

</a>

</div>

</div>

</div>

</section>

<%@include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

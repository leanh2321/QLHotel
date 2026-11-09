<%-- 
    Document   : login
    Created on : 23 Jul 2026, 9:00:36 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Login | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    font-family:Segoe UI,sans-serif;
    background:#f4f4f4;
}

.banner{
    height:250px;
    background:url("images/virasat.jpg");
    background-size:cover;
    background-position:center;
    display:flex;
    justify-content:center;
    align-items:center;
    position:relative;
}

.banner::before{
    content:"";
    position:absolute;
    top:0;
    left:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,0.6);
}

.banner h1{
    position:relative;
    color:white;
    font-size:50px;
    letter-spacing:2px;
}

.login-card{

    width:500px;
    margin:50px auto;
    background:white;
    padding:35px;
    border-radius:10px;
    box-shadow:0px 0px 15px rgba(0,0,0,.2);

}

.login-card h2{

    text-align:center;
    color:#D4AF37;
    margin-bottom:25px;

}

label{

    font-weight:bold;
    margin-top:15px;

}

.error{

    color:red;
    font-size:14px;

}

.btn-login{

    width:100%;
    background:#D4AF37;
    color:black;
    font-weight:bold;
    padding:12px;
    margin-top:25px;
    border:none;

}

.btn-login:hover{

    background:black;
    color:white;

}

.links{

    display:flex;
    justify-content:space-between;
    margin-top:20px;

}

.links a{

    text-decoration:none;
    color:#D4AF37;
    font-weight:bold;

}

.links a:hover{

    text-decoration:underline;

}

.success-box{

    background:#d4edda;
    color:#155724;
    padding:15px;
    border-radius:8px;
    text-align:center;
    margin-bottom:20px;

}

.error-box{

    background:#f8d7da;
    color:#721c24;
    padding:15px;
    border-radius:8px;
    text-align:center;
    margin-bottom:20px;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Login</h1>

</div>

<div class="login-card">

<h2>Account Login</h2>

<%
String success=request.getParameter("success");
String error=request.getParameter("error");

if(success!=null){
%>

<div class="success-box">

Registration Successful! Please Login.

</div>

<%
}

if(error!=null){
%>

<div class="error-box">

<%=error%>

</div>

<%
}
%>

<form action="LoginServlet"
method="post"
onsubmit="return validateForm();">

<label>Login As</label>

<div class="mt-2">

<input type="radio"
name="role"
value="customer"
checked>

Customer

&nbsp;&nbsp;&nbsp;&nbsp;

<input type="radio"
name="role"
value="admin">

Admin

</div>

<label>Email Address</label>

<input
type="email"
class="form-control"
id="email"
name="email"
onkeyup="validateEmail()"
autocomplete="off">

<span id="emailError" class="error"></span>

<label>Password</label>

<div class="input-group">

<input
type="password"
class="form-control"
id="password"
name="password"
onkeyup="validatePassword()"
autocomplete="off">

<button
class="btn btn-outline-secondary"
type="button"
onclick="togglePassword()">

👁

</button>

</div>

<span id="passwordError" class="error"></span>

<button
type="submit"
class="btn-login">

Login

</button>

<div class="links">

<a href="forgotpassword.jsp">

Forgot Password?

</a>

<a href="register.jsp">

New User? Register

</a>

</div>

</form>

</div>

<%@ include file="footer.jsp" %>

<!-- JavaScript will be added in Part 2 -->

<script>

// Email Validation
function validateEmail(){

    let email=document.getElementById("email").value.trim();
    let error=document.getElementById("emailError");

    let pattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(email==""){
        error.innerHTML="Email is required";
        return false;
    }

    if(!pattern.test(email)){
        error.innerHTML="Enter a valid email address";
        return false;
    }

    error.innerHTML="";
    return true;
}

// Password Validation
function validatePassword(){

    let password=document.getElementById("password").value;
    let error=document.getElementById("passwordError");

    if(password==""){
        error.innerHTML="Password is required";
        return false;
    }

    if(password.length<8){
        error.innerHTML="Password must be at least 8 characters";
        return false;
    }

    error.innerHTML="";
    return true;
}

// Show / Hide Password
function togglePassword(){

    let x=document.getElementById("password");

    if(x.type==="password")
        x.type="text";
    else
        x.type="password";

}

// Form Validation
function validateForm(){

    if(!validateEmail()){
        document.getElementById("email").focus();
        return false;
    }

    if(!validatePassword()){
        document.getElementById("password").focus();
        return false;
    }

    return true;

}

</script>

</body>
</html>

<%-- 
    Document   : register
    Created on : 23 Jul 2026, 8:59:54 pm
    Author     : Asus
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Customer Registration | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{

background:#f4f4f4;
font-family:Segoe UI,sans-serif;

}

.banner{

height:250px;
background:url("images/register.jpg");
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
right:0;
bottom:0;
background:rgba(0,0,0,.6);

}

.banner h1{

position:relative;
color:white;
font-size:50px;
letter-spacing:3px;

}

.register-card{

background:white;
width:90%;
max-width:900px;
margin:50px auto;
padding:40px;
border-radius:12px;
box-shadow:0 0 20px rgba(0,0,0,.15);

}

.register-card h2{

text-align:center;
color:#D4AF37;
margin-bottom:30px;

}

label{

font-weight:bold;
margin-top:15px;

}

.form-control,
.form-select{

margin-top:5px;

}

.error{

color:red;
font-size:14px;
margin-top:4px;
display:block;

}

.btn-register{

background:#D4AF37;
color:black;
font-weight:bold;
width:100%;
padding:12px;
margin-top:30px;
border:none;
border-radius:5px;
transition:.3s;

}

.btn-register:hover{

background:#111;
color:white;

}

.success-box{

background:#d4edda;
color:#155724;
padding:15px;
border-radius:8px;
text-align:center;
margin-bottom:20px;
border:1px solid #c3e6cb;
font-weight:bold;

}

.error-box{

background:#f8d7da;
color:#721c24;
padding:15px;
border-radius:8px;
text-align:center;
margin-bottom:20px;
border:1px solid #f5c6cb;
font-weight:bold;

}

.form-control:focus,
.form-select:focus{

border:2px solid #D4AF37;
box-shadow:0 0 8px rgba(212,175,55,.5);

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>Customer Registration</h1>

</div>

<div class="register-card">

<h2>Create Your Account</h2>

<%
String success=request.getParameter("success");
String error=request.getParameter("error");
%>

<% if(success!=null){ %>

<div class="success-box">

✔ Registration Successful! Please login to continue.

</div>

<% } %>

<% if(error!=null){ %>

<div class="error-box">

<%=error%>

</div>

<% } %>

<form
action="RegisterServlet"
method="post"
id="registerForm"
onsubmit="return validateForm();">

<div class="row">

<div class="col-md-6">

<label>Full Name</label>

<input
type="text"
class="form-control"
name="name"
id="name"
onkeyup="validateName()">

<span id="nameError" class="error"></span>

</div>

<div class="col-md-6">

<label>Mobile Number</label>

<input
type="text"
class="form-control"
name="mobile"
id="mobile"
maxlength="10"
onkeyup="validateMobile()">

<span id="mobileError" class="error"></span>

</div>

<div class="col-md-6">

<label>Email Address</label>

<input
type="email"
class="form-control"
name="email"
id="email"
onkeyup="validateEmail()">

<span id="emailError" class="error"></span>

</div>

<div class="col-md-6">

<label>Password</label>

<div class="input-group">

<input
type="password"
class="form-control"
name="password"
id="password"
onkeyup="validatePassword();checkStrength();">

<button
class="btn btn-outline-secondary"
type="button"
onclick="togglePassword()">

👁

</button>

</div>

<span id="passwordError" class="error"></span>
<div id="strength" style="font-weight:bold;"></div>

</div>

<div class="col-md-6">

<label>Confirm Password</label>

<div class="input-group">

<input
type="password"
class="form-control"
name="confirmPassword"
id="confirmPassword"
onkeyup="validateConfirmPassword()">

<button
class="btn btn-outline-secondary"
type="button"
onclick="toggleConfirmPassword()">

👁

</button>

</div>

<span id="confirmPasswordError" class="error"></span>

</div>

<div class="col-md-6">

<label>Gender</label>

<select
class="form-select"
name="gender"
id="gender"
onchange="validateGender()">

<option value="">Select Gender</option>
<option>Male</option>
<option>Female</option>
<option>Other</option>

</select>

<span id="genderError" class="error"></span>

</div>

<div class="col-md-6">

<label>Date of Birth</label>

<input
type="date"
class="form-control"
name="dob"
id="dob"
onchange="validateDOB()">

<span id="dobError" class="error"></span>

</div>

<div class="col-md-6">

<label>Pincode</label>

<input
type="text"
class="form-control"
name="pincode"
id="pincode"
maxlength="6"
onkeyup="validatePincode()">

<span id="pincodeError" class="error"></span>

</div>

<div class="col-md-6">

<label>City</label>

<input
type="text"
class="form-control"
name="city"
id="city"
onkeyup="validateCity()">

<span id="cityError" class="error"></span>

</div>

<div class="col-md-6">

<label>State</label>

<input
type="text"
class="form-control"
name="state"
id="state"
onkeyup="validateState()">

<span id="stateError" class="error"></span>

</div>

<div class="col-12">

<label>Address</label>

<textarea
class="form-control"
rows="4"
name="address"
id="address"
onkeyup="validateAddress()"></textarea>

<span id="addressError" class="error"></span>

</div>

<div class="col-12">

<button
type="submit"
class="btn-register">

Register

</button>

</div>

</div>

</form>

</div>

<%@ include file="footer.jsp" %>

<!-- JavaScript validations will be added in Part 1B -->
<script>

function validateName(){

    let name=document.getElementById("name").value.trim();
    let error=document.getElementById("nameError");
    let pattern=/^[A-Za-z ]+$/;

    if(name==""){
        error.innerHTML="Name is required";
        return false;
    }

    if(name.length<3){
        error.innerHTML="Minimum 3 characters required";
        return false;
    }

    if(!pattern.test(name)){
        error.innerHTML="Only alphabets and spaces are allowed";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateMobile(){

    let mobile=document.getElementById("mobile").value.trim();
    let error=document.getElementById("mobileError");
    let pattern=/^[6-9][0-9]{9}$/;

    if(mobile==""){
        error.innerHTML="Mobile number is required";
        return false;
    }

    if(!pattern.test(mobile)){
        error.innerHTML="Enter a valid 10-digit mobile number";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateEmail(){

    let email=document.getElementById("email").value.trim();
    let error=document.getElementById("emailError");

    let pattern=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if(email==""){
        error.innerHTML="Email is required";
        return false;
    }

    if(!pattern.test(email)){
        error.innerHTML="Enter a valid email";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validatePassword(){

    let password=document.getElementById("password").value;
    let error=document.getElementById("passwordError");

    let pattern=/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$/;

    if(password==""){
        error.innerHTML="Password is required";
        return false;
    }

    if(!pattern.test(password)){
        error.innerHTML="Minimum 8 characters with uppercase, lowercase, number and special character";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateConfirmPassword(){

    let password=document.getElementById("password").value;
    let confirm=document.getElementById("confirmPassword").value;

    let error=document.getElementById("confirmPasswordError");

    if(confirm==""){
        error.innerHTML="Confirm your password";
        return false;
    }

    if(password!=confirm){
        error.innerHTML="Passwords do not match";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateGender(){

    let gender=document.getElementById("gender").value;
    let error=document.getElementById("genderError");

    if(gender==""){
        error.innerHTML="Select gender";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateDOB(){

    let dob=document.getElementById("dob").value;
    let error=document.getElementById("dobError");

    if(dob==""){
        error.innerHTML="Select your date of birth";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateCity(){

    let city=document.getElementById("city").value.trim();
    let error=document.getElementById("cityError");

    let pattern=/^[A-Za-z ]+$/;

    if(city==""){
        error.innerHTML="City is required";
        return false;
    }

    if(!pattern.test(city)){
        error.innerHTML="Only alphabets are allowed";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateState(){

    let state=document.getElementById("state").value.trim();
    let error=document.getElementById("stateError");

    let pattern=/^[A-Za-z ]+$/;

    if(state==""){
        error.innerHTML="State is required";
        return false;
    }

    if(!pattern.test(state)){
        error.innerHTML="Only alphabets are allowed";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validatePincode(){

    let pincode=document.getElementById("pincode").value.trim();
    let error=document.getElementById("pincodeError");

    let pattern=/^[0-9]{6}$/;

    if(pincode==""){
        error.innerHTML="Pincode is required";
        return false;
    }

    if(!pattern.test(pincode)){
        error.innerHTML="Enter a valid 6-digit pincode";
        return false;
    }

    error.innerHTML="";
    return true;
}

//------------------------------------------------------------

function validateAddress(){

    let address=document.getElementById("address").value.trim();
    let error=document.getElementById("addressError");

    if(address==""){
        error.innerHTML="Address is required";
        return false;
    }

    if(address.length<10){
        error.innerHTML="Address should be at least 10 characters";
        return false;
    }

    error.innerHTML="";
    return true;
}

function togglePassword(){

let x=document.getElementById("password");

if(x.type==="password")
x.type="text";
else
x.type="password";

}

//--------------------------------

function toggleConfirmPassword(){

let x=document.getElementById("confirmPassword");

if(x.type==="password")
x.type="text";
else
x.type="password";

}

//--------------------------------

function checkStrength(){

let password=document.getElementById("password").value;

let strength=document.getElementById("strength");

if(password.length<8){

strength.innerHTML="Weak Password";

strength.style.color="red";

}
else if(password.match(/[A-Z]/) &&
password.match(/[a-z]/) &&
password.match(/[0-9]/)){

strength.innerHTML="Medium Password";

strength.style.color="orange";

}

if(password.match(/[A-Z]/) &&
password.match(/[a-z]/) &&
password.match(/[0-9]/) &&
password.match(/[@$!%*?&]/) &&
password.length>=8){

strength.innerHTML="Strong Password";

strength.style.color="green";

}

}

//------------------------------------------------------------

function validateForm(){

    return validateName() &&
           validateMobile() &&
           validateEmail() &&
           validatePassword() &&
           validateConfirmPassword() &&
           validateGender() &&
           validateDOB() &&
           validateCity() &&
           validateState() &&
           validatePincode() &&
           validateAddress();

}

</script>

</body>

</html>

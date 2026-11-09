<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>

<%
Customer customer = (Customer) request.getAttribute("customer");

if(customer == null){
    response.sendRedirect("ProfileServlet");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Edit Profile | Royal Virasat Hotel</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{
    background:#f5f5f5;
    font-family:Segoe UI,sans-serif;
}

.profile-box{

    width:900px;
    margin:40px auto;
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
    margin-top:12px;

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

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="profile-box">

<h2 class="heading">

Edit Profile

</h2>

<form action="UpdateProfileServlet" method="post">

<input
type="hidden"
name="customerId"
value="<%=customer.getCustomerId()%>">

<div class="row">

<div class="col-md-6">

<label>Full Name</label>

<input
type="text"
class="form-control"
name="name"
value="<%=customer.getName()%>"
required>

</div>

<div class="col-md-6">

<label>Gender</label>

<select
class="form-select"
name="gender"
required>

<option value="Male"
<%=customer.getGender().equals("Male")?"selected":""%>>

Male

</option>

<option value="Female"
<%=customer.getGender().equals("Female")?"selected":""%>>

Female

</option>

<option value="Other"
<%=customer.getGender().equals("Other")?"selected":""%>>

Other

</option>

</select>

</div>

<div class="col-md-6">

<label>Date of Birth</label>

<input
type="date"
class="form-control"
name="dob"
value="<%=customer.getDob()%>">

</div>

<div class="col-md-6">

<label>Mobile Number</label>

<input
type="text"
class="form-control"
name="mobile"
maxlength="10"
value="<%=customer.getMobile()%>"
required>

</div>

<div class="col-md-6">

<label>Email Address</label>

<input
type="email"
class="form-control"
value="<%=customer.getEmail()%>"
readonly>

</div>

<div class="col-md-6">

<label>PIN Code</label>

<input
type="text"
class="form-control"
name="pincode"
maxlength="6"
value="<%=customer.getPincode()%>">

</div>

<div class="col-md-6">

<label>City</label>

<input
type="text"
class="form-control"
name="city"
value="<%=customer.getCity()%>">

</div>

<div class="col-md-6">

<label>State</label>

<input
type="text"
class="form-control"
name="state"
value="<%=customer.getState()%>">

</div>

<div class="col-12">

<label>Address</label>

<textarea
class="form-control"
rows="4"
name="address"><%=customer.getAddress()%></textarea>

</div>

<div class="text-center mt-4">

<button
type="submit"
class="btn btn-gold btn-lg">

Update Profile

</button>

<a
href="ProfileServlet"
class="btn btn-secondary btn-lg ms-2">

Cancel

</a>

</div>

</div>

</form>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
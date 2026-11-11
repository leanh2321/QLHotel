<%-- 
    Document   : contact
    Created on : 23 Jul 2026, 8:57:49 pm
    Author     : Asus
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<meta charset="UTF-8">

<title>Liên hệ | Khách sạn Mường Thanh</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

body{
    font-family:Segoe UI,sans-serif;
    background:#f8f8f8;
}

/************ Banner ************/

.banner{

height:300px;

background:url("images/metropole2.jpg");

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

font-size:55px;

letter-spacing:3px;

}

/************ Liên hệ ************/

.contact{

padding:70px 0;

}

.info{

background:#111;

color:white;

padding:40px;

border-radius:10px;

height:100%;

}

.info h2{

color:#D4AF37;

margin-bottom:30px;

}

.info p{

font-size:17px;

margin:18px 0;

}

.info i{

color:#D4AF37;

margin-right:12px;

font-size:20px;

}

.social i{

font-size:25px;

margin-right:20px;

cursor:pointer;

transition:.3s;

}

.social i:hover{

color:#D4AF37;

}

.form-box{

background:white;

padding:40px;

border-radius:10px;

box-shadow:0 0 15px rgba(0,0,0,.1);

}

.form-box h2{

color:#D4AF37;

margin-bottom:25px;

}

label{

font-weight:bold;

margin-top:15px;

}

input,textarea{

margin-top:5px;

}

.btn-send{

background:#D4AF37;

color:black;

font-weight:bold;

width:100%;

padding:12px;

margin-top:20px;

}

.btn-send:hover{

background:#111;

color:white;

}

.map{

margin-top:70px;

}

.success-box{

background:#e8f5e9;
border-left:6px solid #28a745;
padding:20px;
margin-top:25px;
border-radius:8px;
text-align:center;
box-shadow:0 5px 10px rgba(0,0,0,.15);

}

.success-box h3{

color:#28a745;
margin-bottom:10px;

}

.success-box p{

font-size:17px;
margin:0;

}

</style>

</head>

<body>

<%@ include file="navbar.jsp" %>

<div class="banner">

<h1>LIÊN HỆ</h1>

</div>
<%
String msg=request.getParameter("msg");

if(msg!=null)
{
%>

<div class="success-box">

<h3>✔ Cảm ơn bạn!</h3>

<p><%=msg%></p>

</div>

<%
}
%>

<div class="container contact">

<div class="row g-4">

<div class="col-md-5">

<div class="info">

<h2>Khách sạn Mường Thanh Sông Lamt</h2>

<p>

<i class="fa-solid fa-location-dot"></i>Đường Quang Trung, Thành phố Vinh, Nghệ An</p>

<p>

<i class="fa-solid fa-phone"></i>

+84 869096539

</p>

<p>

<i class="fa-solid fa-envelope"></i>

letuananh06012003@gmail.com

</p>

<p>

<i class="fa-solid fa-clock"></i>Lễ tân phục vụ 24/7</p>

<hr>

<h4 style="color:#D4AF37;">Theo dõi chúng tôi</h4>

<div class="social">

<i class="fab fa-facebook"></i>

<i class="fab fa-instagram"></i>

<i class="fab fa-twitter"></i>

<i class="fab fa-linkedin"></i>

</div>

</div>

</div>

<div class="col-md-7">

<div class="form-box">

<h2>Gửi lời nhắn cho chúng tôi</h2>

<% if ("1".equals(request.getParameter("sent"))) { %>
<div class="alert alert-success" role="alert">Lời nhắn của bạn đã được gửi thành công.</div>
<% } else if ("missing".equals(request.getParameter("error"))) { %>
<div class="alert alert-warning" role="alert">Vui lòng điền đầy đủ các trường.</div>
<% } else if ("save".equals(request.getParameter("error"))) { %>
<div class="alert alert-danger" role="alert">Không lưu được lời nhắn. Hãy kiểm tra kết nối MySQL và bảng contact_message.</div>
<% } %>

<form action="<%=request.getContextPath()%>/SaveContactServlet" method="post">

<label>Họ và tên</label>

<input
type="text"
name="name"
class="form-control"
required>

<label>Số điện thoại</label>

<input
type="text"
name="mobile"
class="form-control"
maxlength="10"
required>

<label>Địa chỉ email</label>

<input
type="email"
name="email"
class="form-control"
required>

<label>Lời nhắn của bạn</label>

<textarea
name="message"
rows="5"
class="form-control"
required></textarea>

<button
type="submit"
class="btn btn-send">Gửi lời nhắn</button>

</form>

</div>

</div>

</div>

<div class="map">

<iframe

src="https://www.google.com/maps?q=Vinh%2C+Nghe+An%2C+Vietnam&output=embed"

width="100%"

height="400"

style="border:0; border-radius:10px;"

loading="lazy">

</iframe>

</div>

</div>

<%@ include file="footer.jsp" %>

</body>
</html>

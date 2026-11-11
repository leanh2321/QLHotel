<%-- 
    Document   : footer
    Created on : 23 Jul 2026, 9:10:04 pm
    Author     : Asus
--%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="vi">
<head>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">

<style>

.footer{

background:#111;
color:white;

padding:50px 80px 20px;

margin-top:70px;

}

.footer-container{

display:flex;
justify-content:space-between;
flex-wrap:wrap;

}

.footer-box{

width:250px;

}

.footer-box h3{

color:#D4AF37;
margin-bottom:18px;

}

.footer-box p{

line-height:28px;

}

.footer-box a{

display:block;
color:white;
text-decoration:none;
margin:10px 0;
transition:.3s;

}

.footer-box a:hover{

color:#D4AF37;
padding-left:8px;

}

.social i{

font-size:25px;
margin-right:18px;
margin-top:15px;
cursor:pointer;
transition:.3s;

}

.social i:hover{

color:#D4AF37;
transform:scale(1.2);

}

.bottom{

margin-top:40px;
text-align:center;
border-top:1px solid gray;
padding-top:20px;
font-size:15px;

}

</style>

</head>

<body>

<footer class="footer">

<div class="footer-container">

<div class="footer-box">

<h3>

Mường Thanh Sông Lam

</h3>

<p>

Tận hưởng sự sang trọng, tiện nghi và tinh tế cùng dịch vụ hiếu khách đẳng cấp.

</p>

<div class="social">

<i class="fab fa-facebook"></i>

<i class="fab fa-instagram"></i>

<i class="fab fa-twitter"></i>

<i class="fab fa-linkedin"></i>

</div>

</div>

<div class="footer-box">

<h3>

Liên kết nhanh

</h3>

<a href="index.jsp">Trang chủ</a>

<a href="about.jsp">Giới thiệu</a>

<a href="RoomServlet">Phòng nghỉ</a>

<a href="gallery.jsp">Thư viện ảnh</a>

<a href="contact.jsp">Liên hệ</a>

</div>

<div class="footer-box">

<h3>Liên hệ</h3>

<p>

<i class="fa-solid fa-location-dot"></i>

 Vinh, Nghệ An

</p>

<p>

<i class="fa-solid fa-phone"></i>

 +84 859096539

</p>

<p>

<i class="fa-solid fa-envelope"></i>

 letuananh06012003@gmail.com

</p>

</div>

<div class="footer-box">

<h3>

Tiện ích

</h3>

<p>✔ Phòng nghỉ sang trọng</p>

<p>✔ Hồ bơi</p>

<p>✔ Spa và chăm sóc sức khỏe</p>

<p>✔ Wi-Fi miễn phí</p>

<p>✔ Nhà hàng</p>

</div>

</div>

<div class="bottom">

Bản quyền thuốc về Lê Tuấn Anh

</div>

</footer>

</body>
</html>

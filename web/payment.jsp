<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="dao.BookingDAO"%>
<%@page import="dao.RoomDAO"%>
<%@page import="model.Booking"%>
<%@page import="model.Room"%>

<%!
private String viRoomType(String value) {
    if (value == null) return "";
    switch (value) {
        case "Single": return "Phòng đơn";
        case "Double": return "Phòng đôi";
        case "Standard": return "Phòng tiêu chuẩn";
        case "Deluxe": return "Phòng Deluxe";
        case "Suite": return "Phòng Suite";
        case "Family": return "Phòng gia đình";
        case "Executive": return "Phòng Executive";
        case "Presidential": return "Phòng Tổng thống";
        case "Honeymoon": return "Phòng trăng mật";
        default: return value;
    }
}
private String viRoomStatus(String value) {
    if (value == null) return "";
    switch (value) {
        case "Available": return "Còn trống";
        case "Booked": return "Đã đặt";
        case "Maintenance": return "Đang bảo trì";
        case "Pending": return "Đang chờ";
        case "Confirmed": return "Đã xác nhận";
        case "Checked In": return "Đã nhận phòng";
        case "Checked Out": return "Đã trả phòng";
        case "Cancelled": return "Đã hủy";
        default: return value;
    }
}
private String viGender(String value) {
    if (value == null) return "";
    switch (value) {
        case "Male": return "Nam";
        case "Female": return "Nữ";
        case "Other": return "Khác";
        default: return value;
    }
}
private String viMessage(String value) {
    if (value == null) return "";
    switch (value) {
        case "Invalid Email": return "Email không tồn tại.";
        case "Invalid Password": return "Mật khẩu không chính xác.";
        case "Login Failed": return "Đăng nhập không thành công.";
        case "Please Login as Admin": return "Vui lòng đăng nhập bằng tài khoản quản trị viên.";
        case "Please Login First": return "Vui lòng đăng nhập trước.";
        case "Please login to book a room.": return "Vui lòng đăng nhập để đặt phòng.";
        case "Please Fill All Required Fields": return "Vui lòng điền đầy đủ các trường bắt buộc.";
        case "Email Already Registered": return "Email này đã được đăng ký.";
        case "Registration Failed": return "Đăng ký không thành công.";
        case "Something Went Wrong": return "Đã xảy ra lỗi. Vui lòng thử lại.";
        case "Email not found.": return "Không tìm thấy email này.";
        case "Something went wrong.": return "Đã xảy ra lỗi. Vui lòng thử lại.";
        case "Password updated successfully. Please login.": return "Cập nhật mật khẩu thành công. Vui lòng đăng nhập.";
        case "Customer Not Found": return "Không tìm thấy khách hàng.";
        case "Current Password is Incorrect": return "Mật khẩu hiện tại không đúng.";
        case "New Password and Confirm Password do not match": return "Mật khẩu mới và mật khẩu xác nhận không khớp.";
        case "Unable to Change Password": return "Không thể đổi mật khẩu.";
        case "Password Changed Successfully": return "Đổi mật khẩu thành công.";
        case "Room Added Successfully": return "Thêm phòng thành công.";
        case "Room Updated Successfully": return "Cập nhật phòng thành công.";
        case "Unable to Update Room": return "Không thể cập nhật phòng.";
        default: return value;
    }
}
%>

<%
if(session.getAttribute("customerId")==null){

    response.sendRedirect("login.jsp?error=Please Login First");
    return;

}

int bookingId=Integer.parseInt(request.getParameter("bookingId"));

BookingDAO bookingDAO=new BookingDAO();

Booking booking=bookingDAO.getBookingById(bookingId);

RoomDAO roomDAO=new RoomDAO();

Room room=roomDAO.getRoomById(booking.getRoomId());
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>

Thanh toán

</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f4f4f4;

font-family:Segoe UI,sans-serif;

}

.payment-box{

width:1100px;

margin:40px auto;

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 0 20px rgba(0,0,0,.15);

}

.left-box{

background:#111;

color:white;

padding:30px;

border-radius:15px;

height:100%;

}

.gold{

color:#D4AF37;

}

.amount{

font-size:40px;

font-weight:bold;

color:#D4AF37;

}

.method{

padding:15px;

border:2px solid #ddd;

border-radius:10px;

margin-bottom:15px;

cursor:pointer;

transition:.3s;

}

.method:hover{

border-color:#D4AF37;

background:#faf7ef;

}

.pay-btn{

background:#D4AF37;

font-size:20px;

font-weight:bold;

width:100%;

}

.pay-btn:hover{

background:black;

color:white;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="payment-box">

<div class="row">

<div class="col-md-5">

<div class="left-box">

<h2 class="gold">Khách sạn Mường Thanh</h2>

<hr>

<h5>Mã đặt phòng</h5>

<p>

#<%=booking.getBookingId()%>

</p>

<h5>Phòng</h5>

<p>

<%=viRoomType(room.getRoomType())%>

</p>

<h5>Số phòng</h5>

<p>

<%=room.getRoomNumber()%>

</p>

<h5>Nhận phòng</h5>

<p>

<%=booking.getCheckIn()%>

</p>

<h5>Trả phòng</h5>

<p>

<%=booking.getCheckOut()%>

</p>

<h5>Số khách</h5>

<p>

<%=booking.getGuests()%> khách

</p>

<hr>

<div class="amount">

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", booking.getTotalAmount())%> ₫

</div>

<p>Số tiền cần thanh toán</p>

</div>

</div>

<div class="col-md-7">

<h2 class="gold mb-4">Chọn phương thức thanh toán</h2>

<form
action="ProcessPaymentServlet"
method="post"
id="paymentForm">

<input
type="hidden"
name="bookingId"
value="<%=booking.getBookingId()%>">

<div class="method">

<input
type="radio"
name="paymentMethod"
value="UPI"
checked
onclick="showMethod('upi')">

<b>Thanh toán UPI</b>

</div>

<div id="upiBox" class="mb-4">

<label>Chọn ứng dụng UPI</label>

<select
class="form-select"
name="upi">

<option>

Google Pay

</option>

<option>

Điện thoạiPe

</option>

<option>

Paytm

</option>

<option>

BHIM UPI

</option>

</select>

</div>

<div class="method">

<input
type="radio"
name="paymentMethod"
value="Card"
onclick="showMethod('card')">

<b>Thẻ tín dụng / ghi nợ</b>

</div>

<div
id="cardBox"
style="display:none;">

<div class="mb-3">

<label>Số thẻ</label>

<input
type="text"
class="form-control"
maxlength="16"
placeholder="1234 5678 9012 3456">

</div>

<div class="row">

<div class="col-md-8">

<label>Chủ thẻ</label>

<input
type="text"
class="form-control"
placeholder="Tên in trên thẻ">

</div>

<div class="col-md-2">

<label>

MM/YY

</label>

<input
type="text"
class="form-control"
maxlength="5">

</div>

<div class="col-md-2">

<label>

CVV

</label>

<input
type="password"
class="form-control"
maxlength="3">

</div>

</div>

</div>

<div class="method mt-3">

<input
type="radio"
name="paymentMethod"
value="Net Banking"
onclick="showMethod('bank')">

<b>Ngân hàng trực tuyến</b>

</div>

<div
id="bankBox"
style="display:none;"
class="mb-3">

<label>Chọn ngân hàng</label>

<select class="form-select">

<option>Ngân hàng Tỉnh/Thành Bank of India</option>

<option>Ngân hàng HDFC</option>

<option>Ngân hàng ICICI</option>

<option>Ngân hàng Axis</option>

<option>Ngân hàng Punjab National Bank</option>

</select>

</div>

<div class="method">

<input
type="radio"
name="paymentMethod"
value="Cash"
onclick="showMethod('cash')">

<b>Thanh toán tiền mặt tại khách sạn</b>

</div>

<div
id="cashBox"
style="display:none;"
class="alert alert-warning">Bạn có thể thanh toán tại quầy lễ tân khi nhận phòng.</div>

<div class="mt-4">

<button
type="submit"
class="btn pay-btn">Thanh toán ngay</button>

</div>

</form>

</div>

</div>

</div>

<script>

function showMethod(type){

document.getElementById("upiBox").style.display="none";
document.getElementById("cardBox").style.display="none";
document.getElementById("bankBox").style.display="none";
document.getElementById("cashBox").style.display="none";

if(type=="upi"){

document.getElementById("upiBox").style.display="block";

}

if(type=="card"){

document.getElementById("cardBox").style.display="block";

}

if(type=="bank"){

document.getElementById("bankBox").style.display="block";

}

if(type=="cash"){

document.getElementById("cashBox").style.display="block";

}

}

document.getElementById("paymentForm").addEventListener("submit",function(e){

e.preventDefault();

let button=document.querySelector(".pay-btn");

button.disabled=true;

button.innerHTML=`
<div class="spinner-border spinner-border-sm text-dark me-2"></div>
Đang xử lý thanh toán...
`;

setTimeout(function(){

document.getElementById("paymentForm").submit();

},2000);

});

</script>

<%@include file="footer.jsp"%>

</body>

</html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

Room room=(Room)request.getAttribute("room");

if(room==null){

    response.sendRedirect("rooms.jsp");
    return;

}

int customerId=(Integer)session.getAttribute("customerId");
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Đặt phòng</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f4f4f4;

font-family:Segoe UI,sans-serif;

}

.booking-box{

width:1100px;

margin:50px auto;

background:white;

padding:35px;

border-radius:15px;

box-shadow:0 0 20px rgba(0,0,0,.15);

}

.room-image{

width:100%;

height:350px;

object-fit:cover;

border-radius:12px;

}

.gold{

color:#D4AF37;

font-weight:bold;

}

.price{

font-size:30px;

font-weight:bold;

color:#D4AF37;

}

.total-box{

background:#f8f8f8;

padding:20px;

border-radius:10px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="booking-box">

<div class="row">

<div class="col-md-6">

<img
src="images/<%=room.getRoomImage()%>"
class="room-image">

</div>

<div class="col-md-6">

<h2 class="gold">

<%=viRoomType(room.getRoomType())%>

</h2>

<hr>

<h4>

Số phòng:

<%=room.getRoomNumber()%>

</h4>

<h4>

Sức chứa:

<%=room.getCapacity()%> khách

</h4>

<p>

<%=room.getDescription()%>

</p>

<div class="price">

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", room.getPrice())%> ₫ / đêm

</div>

<hr>

<form action="ConfirmBookingServlet" method="post">

<input type="hidden"
name="roomId"
value="<%=room.getRoomId()%>">

<input type="hidden"
name="customerId"
value="<%=customerId%>">

<input type="hidden"
id="price"
value="<%=room.getPrice()%>">

<div class="mb-3">

<label class="form-label">Nhận phòng</label>

<input
type="date"
class="form-control"
id="checkIn"
name="checkIn"
required>

</div>

<div class="mb-3">

<label class="form-label">Trả phòng</label>

<input
type="date"
class="form-control"
id="checkOut"
name="checkOut"
required>

</div>

<div class="mb-3">

<label class="form-label">Số khách</label>

<select
class="form-select"
name="guests"
id="guests"
required>

<%
for(int i=1;i<=room.getCapacity();i++)
{
%>

<option value="<%=i%>">

<%=i%>

</option>

<%
}
%>

</select>

</div>

<div class="total-box">

<div class="d-flex justify-content-between">

<h5>Giá / đêm</h5>

<h5>

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", room.getPrice())%> ₫

</h5>

</div>

<hr>

<div class="d-flex justify-content-between">

<h5>Tổng số đêm</h5>

<h5 id="nights">

0

</h5>

</div>

<hr>

<div class="d-flex justify-content-between">

<h4 class="gold">Tổng tiền</h4>

<h4
class="gold"
id="totalAmount">

0 ₫

</h4>

</div>

</div>

<input
type="hidden"
name="totalAmount"
id="hiddenTotal">

<div class="mt-4">

<button
type="submit"
class="btn btn-warning btn-lg w-100">Xác nhận đặt phòng</button>

</div>

</form>

</div>

</div>

</div>

<script>

const checkIn=document.getElementById("checkIn");

const checkOut=document.getElementById("checkOut");

const price=parseFloat(document.getElementById("price").value);

const nights=document.getElementById("nights");

const total=document.getElementById("totalAmount");

const hiddenTotal=document.getElementById("hiddenTotal");

// Today's Date

let today=new Date().toISOString().split("T")[0];

checkIn.min=today;

function calculateTotal(){

if(checkIn.value=="" || checkOut.value=="")
{

nights.innerHTML="0";

total.innerHTML="0 ₫";

hiddenTotal.value=0;

return;

}

let inDate=new Date(checkIn.value);

let outDate=new Date(checkOut.value);

if(outDate<=inDate)
{

alert("Ngày trả phòng phải sau ngày nhận phòng.");

checkOut.value="";

nights.innerHTML="0";

total.innerHTML="0 ₫";

hiddenTotal.value=0;

return;

}

let diff=outDate-inDate;

let totalNights=Math.ceil(diff/(1000*60*60*24));

let amount=totalNights*price;

nights.innerHTML=totalNights;

total.innerHTML=new Intl.NumberFormat("vi-VN").format(amount)+" ₫";

hiddenTotal.value=amount;

}

// When Check-In changes

checkIn.addEventListener("change",function(){

checkOut.min=checkIn.value;

calculateTotal();

});

// When Check-Out changes

checkOut.addEventListener("change",calculateTotal);

</script>

<%@include file="footer.jsp"%>

</body>

</html>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Booking"%>

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
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Booking> bookings =
(ArrayList<Booking>)request.getAttribute("bookings");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<title>Quản lý đặt phòng</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.container-box{

background:white;

margin:40px auto;

padding:30px;

border-radius:12px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

font-weight:bold;

margin-bottom:25px;

}

.table th{

background:black;

color:#D4AF37;

}

.pending{

color:orange;

font-weight:bold;

}

.confirmed{

color:green;

font-weight:bold;

}

.checkedin{

color:#0d6efd;

font-weight:bold;

}

.checkedout{

color:#6f42c1;

font-weight:bold;

}

.cancelled{

color:red;

font-weight:bold;

}

.btn-approve{

background:green;

color:white;

}

.btn-reject{

background:red;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container container-box">

<h2>Quản lý đặt phòng</h2>

<%

String success=request.getParameter("success");

String error=request.getParameter("error");

if(success!=null){
%>

<div class="alert alert-success">

<%=viMessage(success)%>

</div>

<%
}

if(error!=null){
%>

<div class="alert alert-danger">

<%=viMessage(error)%>

</div>

<%
}
%>

<form action="ManageBookingServlet" method="get">

<div class="row mb-4">

<div class="col-md-10">

<input

type="text"

name="search"

class="form-control"

placeholder="Tìm khách hàng / email / số phòng"

value="<%=search%>">

</div>

<div class="col-md-2">

<button class="btn btn-dark w-100">

<i class="fa-solid fa-magnifying-glass"></i>Tìm kiếm</button>

</div>

</div>

</form>

<table class="table table-bordered table-hover align-middle text-center">

<thead>

<tr>

<th>Mã đặt phòng</th>

<th>Khách hàng</th>

<th>Điện thoại</th>

<th>Email</th>

<th>Số phòng</th>

<th>Loại phòng</th>

<th>Nhận phòng</th>

<th>Trả phòng</th>

<th>Số khách</th>

<th>Tổng tiền</th>

<th>Trạng thái</th>

<th>Thao tác</th>

</tr>

</thead>

<tbody>

<%
for(Booking booking : bookings){

String status = booking.getBookingStatus();
%>

<tr>

<td><%=booking.getBookingId()%></td>

<td><%=booking.getCustomerName()%></td>

<td><%=booking.getCustomerMobile()%></td>

<td><%=booking.getCustomerEmail()%></td>

<td><%=booking.getRoomNumber()%></td>

<td><%=viRoomType(booking.getRoomType())%></td>

<td><%=booking.getCheckIn()%></td>

<td><%=booking.getCheckOut()%></td>

<td><%=booking.getGuests()%> khách</td>

<td>

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", booking.getTotalAmount())%> ₫

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<span class="pending">Đang chờ</span>

<%

}else if(status.equalsIgnoreCase("Confirmed")){

%>

<span class="confirmed">Đã xác nhận</span>

<%

}else if(status.equalsIgnoreCase("Checked In")){

%>

<span class="checkedin">Đã nhận phòng</span>

<%

}else if(status.equalsIgnoreCase("Checked Out")){

%>

<span class="checkedout">Đã trả phòng</span>

<%

}else{

%>

<span class="cancelled">Đã hủy</span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")){

%>

<a href="ApproveBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-success btn-sm">Duyệt</a>

<a href="RejectBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm">Từ chối</a>

<%

}else if(status.equalsIgnoreCase("Confirmed")){

%>

<a href="CheckInServlet?id=<%=booking.getBookingId()%>"
class="btn btn-primary btn-sm">Nhận phòng</a>

<a href="RejectBookingServlet?id=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm">Hủy</a>

<%

}else if(status.equalsIgnoreCase("Checked In")){

%>

<a href="CheckOutServlet?id=<%=booking.getBookingId()%>"
class="btn btn-warning btn-sm">Trả phòng</a>

<%

}else if(status.equalsIgnoreCase("Checked Out")){

%>

<a href="InvoiceServlet?bookingId=<%=booking.getBookingId()%>"
class="btn btn-dark btn-sm">Hóa đơn</a>

<%

}else{

%>

-

<%

}

%>

</td>

</tr>

<%

}

if(bookings.isEmpty()){

%>

<tr>

<td colspan="12" class="text-center text-danger fw-bold">Không tìm thấy đặt phòng nào</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<%@include file="footer.jsp"%>

</body>

</html>

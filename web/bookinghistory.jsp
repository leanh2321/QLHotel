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
ArrayList<Booking> bookingList =
(ArrayList<Booking>)request.getAttribute("bookingList");

if(session.getAttribute("customerId")==null){
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Lịch sử đặt phòng</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;

}

.box{

width:95%;

margin:40px auto;

background:white;

padding:30px;

border-radius:15px;

box-shadow:0 0 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

margin-bottom:25px;

font-weight:bold;

}

.badge{

font-size:14px;

padding:8px 14px;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="box">

<h2>Lịch sử đặt phòng của tôi</h2>

<table class="table table-bordered table-hover text-center align-middle">

<thead class="table-dark">

<tr>

<th>Mã đặt phòng</th>

<th>Số phòng</th>

<th>Loại phòng</th>

<th>Nhận phòng</th>

<th>Trả phòng</th>

<th>Số khách</th>

<th>Thành tiền</th>

<th>Trạng thái</th>

<th>Thao tác</th>

</tr>

</thead>

<tbody>

<%

if(bookingList!=null && !bookingList.isEmpty()){

for(Booking booking : bookingList){

%>

<tr>

<td><%=booking.getBookingId()%></td>

<td><%=booking.getRoomNumber()%></td>

<td><%=viRoomType(booking.getRoomType())%></td>

<td><%=booking.getCheckIn()%></td>

<td><%=booking.getCheckOut()%></td>

<td><%=booking.getGuests()%> khách</td>

<td><%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", booking.getTotalAmount())%> ₫</td>

<td>

<%

String status=booking.getBookingStatus();

if(status.equalsIgnoreCase("Confirmed")){

%>

<span class="badge bg-success">Đã xác nhận</span>

<%

}else if(status.equalsIgnoreCase("Pending")){

%>

<span class="badge bg-warning text-dark">Đang chờ</span>

<%

}else if(status.equalsIgnoreCase("Cancelled")){

%>

<span class="badge bg-danger">Đã hủy</span>

<%

}else{

%>

<span class="badge bg-primary"><%=viRoomStatus(status)%></span>

<%

}

%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Pending")
|| status.equalsIgnoreCase("Confirmed")){

%>

<a href="CancelBookingServlet?bookingId=<%=booking.getBookingId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Bạn có chắc muốn hủy đặt phòng này?')">Hủy</a>

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

}else{

%>

<tr>

<td colspan="9">Bạn chưa có đặt phòng nào.</td>

</tr>

<%

}

%>

</tbody>

</table>

<div class="text-center mt-4">

<a href="CustomerDashboardServlet"
class="btn btn-secondary">Về trang tổng quan</a>

</div>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
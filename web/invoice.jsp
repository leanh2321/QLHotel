<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="model.Booking"%>
<%@page import="model.Customer"%>
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
Booking booking=(Booking)request.getAttribute("booking");
Customer customer=(Customer)request.getAttribute("customer");
Room room=(Room)request.getAttribute("room");

if(booking==null || customer==null || room==null){

    response.sendRedirect("ManageBookingServlet");
    return;

}
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<meta name="viewport"
content="width=device-width, initial-scale=1.0">

<title>Hóa đơn</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:'Segoe UI',sans-serif;

}

.invoice{

width:1000px;

margin:40px auto;

background:white;

padding:40px;

box-shadow:0 0 20px rgba(0,0,0,.15);

border-radius:15px;

}

.hotel-name{

font-size:36px;

font-weight:bold;

color:#D4AF37;

}

.invoice-title{

font-size:30px;

font-weight:bold;

color:#111;

}

.section-title{

font-size:18px;

font-weight:bold;

color:#D4AF37;

margin-top:30px;

margin-bottom:15px;

border-bottom:2px solid #D4AF37;

padding-bottom:8px;

}

.table td{

padding:12px;

}

.label{

font-weight:bold;

width:220px;

background:#fafafa;

}

.status{

padding:8px 20px;

background:#198754;

color:white;

border-radius:30px;

font-weight:bold;

display:inline-block;

}

.logo{

width:110px;

height:auto;

}

</style>

</head>

<body>

<div class="invoice">

<div class="row align-items-center">

<div class="col-md-3">

<img
src="images/Gemini_Generated_Image_e9hnoce9hnoce9hn-removebg-preview.png"
class="logo">

</div>

<div class="col-md-6 text-center">

<div class="hotel-name">Khách sạn Mường Thanh Sông Lam</div>

<div>Khách sạn và khu nghỉ dưỡng cao cấp</div>

</div>

<div class="col-md-3 text-end">

<div class="invoice-title">HÓA ĐƠN</div>

<p>Số hóa đơn<b>

<%=booking.getBookingId()%>

</b>

</p>

<p>Ngày đặt phòng<br>

<b>

<%=booking.getBookingDate()%>

</b>

</p>

</div>

</div>

<hr>

<div class="section-title">Thông tin khách hàng</div>

<table class="table table-bordered">

<tr>

<td class="label">Mã khách hàng</td>

<td>

<%=customer.getCustomerId()%>

</td>

</tr>

<tr>

<td class="label">Tên khách hàng</td>

<td>

<%=customer.getName()%>

</td>

</tr>

<tr>

<td class="label">Email</td>

<td>

<%=customer.getEmail()%>

</td>

</tr>

<tr>

<td class="label">Số điện thoại</td>

<td>

<%=customer.getMobile()%>

</td>

</tr>

<tr>

<td class="label">Địa chỉ</td>

<td>

<%=customer.getAddress()%>

<%=customer.getCity()%>,

<%=customer.getState()%>

-

<%=customer.getPincode()%>

</td>

</tr>

</table>

<div class="section-title">Thông tin phòng và đặt phòng</div>

<table class="table table-bordered">

<tr>

<td class="label">Số phòng</td>

<td>

<%=room.getRoomNumber()%>

</td>

</tr>

<tr>

<td class="label">Loại phòng</td>

<td>

<%=viRoomType(room.getRoomType())%>

</td>

</tr>

<tr>

<td class="label">Ngày nhận phòng</td>

<td>

<%=booking.getCheckIn()%>

</td>

</tr>

<tr>

<td class="label">Ngày trả phòng</td>

<td>

<%=booking.getCheckOut()%>

</td>

</tr>

<tr>

<td class="label">Số khách</td>

<td>

<%=booking.getGuests()%> khách

</td>

</tr>

<tr>

<td class="label">Trạng thái đặt phòng</td>

<td>

<span class="status">

<%=viRoomStatus(booking.getBookingStatus())%>

</span>

</td>

</tr>

</table>

<div class="section-title">Tổng kết thanh toán</div>

<table class="table table-bordered text-center">

<thead class="table-dark">

<tr>

<th>Mô tả</th>

<th>Thành tiền (₫)</th>

</tr>

</thead>

<tbody>

<tr>

<td>

<%=viRoomType(room.getRoomType())%> Tiền phòng

</td>

<td>

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", booking.getTotalAmount())%> ₫

</td>

</tr>

<tr>

<td>Thuế và phí dịch vụ</td>

<td>Đã bao gồm</td>

</tr>

<tr>

<td>Chi phí khác</td>

<td>

0 ₫

</td>

</tr>

<tr class="table-warning">

<td>

<b>Tổng cộng</b>

</td>

<td>

<b>

<%=String.format(java.util.Locale.forLanguageTag("vi-VN"), "%,.0f", booking.getTotalAmount())%> ₫

</b>

</td>

</tr>

</tbody>

</table>

<div class="alert alert-success mt-4 text-center">

<h4>

✅ Đặt phòng thành công

</h4>

<p class="mb-0">Cảm ơn bạn đã lựa chọn<b>Khách sạn Mường Thanh</b>.

Chúc bạn có kỳ nghỉ vui vẻ.

</p>

</div>

<div class="text-center mt-5">

<button
onclick="window.print()"
class="btn btn-warning btn-lg me-3">

🖨 In hóa đơn

</button>

<a
href="CustomerDashboardServlet"
class="btn btn-dark btn-lg">

🏠 Về trang tổng quan

</a>

</div>

<hr class="mt-5">

<div class="text-center">

<h5 style="color:#D4AF37;">Khách sạn Mường Thanh</h5>

<p>

Cảm ơn bạn đã lựa chọn Khách sạn Mường Thanh.

Chúng tôi mong sớm được đón tiếp bạn lần nữa.

</p>

<p>

📍 Vinh, Quang Trung, Nghệ An

</p>

<p>

📞 +84 859096539

</p>

<p>

✉ letuananh06012003@gmail.com

</p>

</div>

</div>

<style>

@media print{

body{

background:white;

}

button,

.btn{

display:none !important;

}

.invoice{

width:100%;

margin:0;

padding:20px;

box-shadow:none;

border:none;

}

}

</style>

</body>

</html>

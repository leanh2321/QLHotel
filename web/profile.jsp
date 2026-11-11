<%--
    Document   : profile
    Created on : 23 Jul 2026
    Author     : Asus
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="model.Customer"%>

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
Customer customer = (Customer) request.getAttribute("customer");

if(customer == null){
    response.sendRedirect("CustomerDashboardServlet");
    return;
}
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<meta charset="UTF-8">

<title>Hồ sơ của tôi</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.profile-box{

width:900px;

margin:40px auto;

background:white;

padding:35px;

border-radius:12px;

box-shadow:0px 0px 20px rgba(0,0,0,.15);

}

.heading{

text-align:center;

color:#D4AF37;

font-weight:bold;

margin-bottom:30px;

}

.table td{

padding:15px;

font-size:16px;

}

.label{

font-weight:bold;

width:220px;

background:#f8f8f8;

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

.btn-dark{

font-weight:bold;

}

</style>

</head>

<body>

<%@include file="navbar.jsp"%>

<div class="profile-box">

<h2 class="heading">Hồ sơ của tôi</h2>

<table class="table table-bordered">

<tr>

<td class="label">Mã khách hàng</td>

<td>

<%=customer.getCustomerId()%>

</td>

</tr>

<tr>

<td class="label">Họ và tên</td>

<td>

<%=customer.getName()%>

</td>

</tr>

<tr>

<td class="label">Giới tính</td>

<td>

<%=viGender(customer.getGender())%>

</td>

</tr>

<tr>

<td class="label">Ngày sinh</td>

<td>

<%=customer.getDob()%>

</td>

</tr>

<tr>

<td class="label">Số điện thoại</td>

<td>

<%=customer.getMobile()%>

</td>

</tr>

<tr>

<td class="label">Địa chỉ email</td>

<td>

<%=customer.getEmail()%>

</td>

</tr>

<tr>

<td class="label">Địa chỉ</td>

<td>

<%=customer.getAddress()%>

</td>

</tr>

<tr>

<td class="label">Thành phố</td>

<td>

<%=customer.getCity()%>

</td>

</tr>

<tr>

<td class="label">Tỉnh/Thành</td>

<td>

<%=customer.getState()%>

</td>

</tr>

<tr>

<td class="label">Mã bưu chính</td>

<td>

<%=customer.getPincode()%>

</td>

</tr>

</table>

<div class="text-center mt-4">

<a
href="EditProfileServlet"
class="btn btn-gold me-2">Chỉnh sửa hồ sơ</a>

<a
href="changepassword.jsp"
class="btn btn-dark me-2">Đổi mật khẩu</a>

<a
href="CustomerDashboardServlet"
class="btn btn-secondary">Về trang tổng quan</a>

</div>

</div>

<%@include file="footer.jsp"%>

</body>

</html>
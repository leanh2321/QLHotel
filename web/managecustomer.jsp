<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@page import="java.util.ArrayList"%>
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
        case "Customer Added Successfully": return "Thêm khách hàng thành công.";
        case "Unable to Add Customer": return "Không thể thêm khách hàng.";
        case "Customer Updated Successfully": return "Cập nhật khách hàng thành công.";
        case "Unable to Update Customer": return "Không thể cập nhật khách hàng.";
        default: return value;
    }
}
%>

<%
if(session.getAttribute("admin")==null){

    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;

}

ArrayList<Customer> customers =
(ArrayList<Customer>)request.getAttribute("customers");

String search=(String)request.getAttribute("search");

if(search==null){

    search="";

}
%>

<!DOCTYPE html>

<html lang="vi">

<head>

<title>Quản lý khách hàng</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css"
rel="stylesheet">

<style>

body{

background:#f5f5f5;

font-family:Arial,sans-serif;

}

.container-box{

margin:40px auto;

background:white;

padding:30px;

border-radius:12px;

box-shadow:0px 0px 15px rgba(0,0,0,.15);

}

h2{

color:#D4AF37;

font-weight:bold;

margin-bottom:25px;

}

.btn-delete{

background:#dc3545;

color:white;

}

</style>

</head>

<body>

<%@include file="adminnavbar.jsp"%>

<div class="container container-box">

<div class="d-flex justify-content-between align-items-center mb-4">
<h2 class="mb-0">Quản lý khách hàng</h2>
<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addCustomerModal">+ Thêm khách hàng</button>
</div>

<%
String success = request.getParameter("success");
String error = request.getParameter("error");
if (success != null) {
%>
<div class="alert alert-success"><%=viMessage(success)%></div>
<%
}
if (error != null) {
%>
<div class="alert alert-danger"><%=viMessage(error)%></div>
<%
}
%>

<form action="ManageCustomerServlet" method="get">

<div class="row">

<div class="col-md-10">

<input
type="text"
name="search"
class="form-control"
placeholder="Tìm theo tên, email hoặc số điện thoại"
value="<%=search%>">

</div>

<div class="col-md-2">

<button class="btn btn-dark w-100">Tìm kiếm</button>

</div>

</div>

</form>

<br>

<div class="modal fade" id="addCustomerModal" tabindex="-1" aria-labelledby="addCustomerModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-scrollable">
    <div class="modal-content">
      <form action="AddCustomerServlet" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="addCustomerModalLabel">Thêm khách hàng</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Đóng"></button>
        </div>
        <div class="modal-body">
          <div class="row g-3">
            <div class="col-md-6"><label class="form-label">Họ tên *</label><input name="name" class="form-control" required maxlength="100"></div>
            <div class="col-md-6"><label class="form-label">Email *</label><input name="email" type="email" class="form-control" required maxlength="150"></div>
            <div class="col-md-6"><label class="form-label">Điện thoại *</label><input name="mobile" class="form-control" required maxlength="20"></div>
            <div class="col-md-6"><label class="form-label">Mật khẩu *</label><input name="password" type="password" class="form-control" required minlength="6"></div>
            <div class="col-md-6"><label class="form-label">Giới tính</label><select name="gender" class="form-select"><option value="Other">Khác</option><option value="Male">Nam</option><option value="Female">Nữ</option></select></div>
            <div class="col-md-6"><label class="form-label">Ngày sinh *</label><input name="dob" type="date" class="form-control" required></div>
            <div class="col-12"><label class="form-label">Địa chỉ</label><input name="address" class="form-control" maxlength="255"></div>
            <div class="col-md-4"><label class="form-label">Thành phố</label><input name="city" class="form-control" maxlength="100"></div>
            <div class="col-md-4"><label class="form-label">Tỉnh/Thành</label><input name="state" class="form-control" maxlength="100"></div>
            <div class="col-md-4"><label class="form-label">Mã bưu điện</label><input name="pincode" class="form-control" maxlength="20"></div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
          <button type="submit" class="btn btn-success">Lưu khách hàng</button>
        </div>
      </form>
    </div>
  </div>
</div>

<table class="table table-bordered table-hover">

<thead class="table-dark">

<tr>

<th>Mã</th>

<th>Tên</th>

<th>Email</th>

<th>Điện thoại</th>

<th>Giới tính</th>

<th>Thành phố</th>

<th>Tỉnh/Thành</th>

<th>Thao tác</th>

</tr>

</thead>

<tbody>

<%
for(Customer customer : customers){
%>

<tr>

<td>

<%=customer.getCustomerId()%>

</td>

<td>

<%=customer.getName()%>

</td>

<td>

<%=customer.getEmail()%>

</td>

<td>

<%=customer.getMobile()%>

</td>

<td>

<%=viGender(customer.getGender())%>

</td>

<td>

<%=customer.getCity()%>

</td>

<td>

<%=customer.getState()%>

</td>

<td>

<a href="EditCustomerServlet?id=<%=customer.getCustomerId()%>" class="btn btn-primary btn-sm">Sửa</a>

<a href="DeleteCustomerServlet?id=<%=customer.getCustomerId()%>"
class="btn btn-danger btn-sm"
onclick="return confirm('Bạn có chắc muốn xóa khách hàng này?');">Xóa</a>

</td>

</tr>

<%

}

if(customers.isEmpty()){

%>

<tr>

<td colspan="8" class="text-center text-danger fw-bold">Không tìm thấy khách hàng nào</td>

</tr>

<%

}

%>

</tbody>

</table>

</div>

<%@include file="footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

</body>

</html>

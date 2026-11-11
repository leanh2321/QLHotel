<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Customer"%>
<%!
private String esc(String value) {
    if (value == null) return "";
    return value.replace("&", "&amp;").replace("<", "&lt;")
            .replace(">", "&gt;").replace("\"", "&quot;")
            .replace("'", "&#39;");
}
%>
<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp?error=Please%20Login%20as%20Admin");
    return;
}
Customer customer = (Customer) request.getAttribute("customer");
if (customer == null) {
    response.sendRedirect("ManageCustomerServlet?error=Customer%20Not%20Found");
    return;
}
String error = request.getParameter("error");
String message = "";
if ("Email Already Registered".equals(error)) message = "Email này đã được khách hàng khác sử dụng.";
else if ("Please Fill All Required Fields".equals(error)) message = "Vui lòng điền đủ họ tên, email và số điện thoại.";
else if ("Unable to Update Customer".equals(error)) message = "Không thể cập nhật khách hàng.";
%>
<!DOCTYPE html>
<html lang="vi">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Sửa thông tin khách hàng</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body { background: #f5f5f5; font-family: Arial, sans-serif; }
    .form-card { max-width: 900px; margin: 40px auto; padding: 30px; background: #fff; border-radius: 12px; box-shadow: 0 0 15px rgba(0,0,0,.15); }
    h2 { color: #D4AF37; font-weight: bold; margin-bottom: 24px; }
  </style>
</head>
<body>
<%@include file="adminnavbar.jsp"%>
<main class="container form-card">
  <h2>Sửa thông tin khách hàng</h2>
  <% if (!message.isEmpty()) { %><div class="alert alert-danger"><%=message%></div><% } %>
  <form action="UpdateCustomerServlet" method="post">
    <input type="hidden" name="customerId" value="<%=customer.getCustomerId()%>">
    <div class="row g-3">
      <div class="col-md-6"><label class="form-label">Họ tên *</label><input name="name" class="form-control" value="<%=esc(customer.getName())%>" required maxlength="100"></div>
      <div class="col-md-6"><label class="form-label">Email *</label><input name="email" type="email" class="form-control" value="<%=esc(customer.getEmail())%>" required maxlength="150"></div>
      <div class="col-md-6"><label class="form-label">Điện thoại *</label><input name="mobile" class="form-control" value="<%=esc(customer.getMobile())%>" required maxlength="20"></div>
      <div class="col-md-6"><label class="form-label">Giới tính</label>
        <select name="gender" class="form-select">
          <option value="Male" <%= "Male".equals(customer.getGender()) ? "selected" : "" %>>Nam</option>
          <option value="Female" <%= "Female".equals(customer.getGender()) ? "selected" : "" %>>Nữ</option>
          <option value="Other" <%= "Other".equals(customer.getGender()) ? "selected" : "" %>>Khác</option>
        </select>
      </div>
      <div class="col-md-6"><label class="form-label">Ngày sinh</label><input name="dob" type="date" class="form-control" value="<%=esc(customer.getDob())%>"></div>
      <div class="col-md-6"><label class="form-label">Mã bưu điện</label><input name="pincode" class="form-control" value="<%=esc(customer.getPincode())%>" maxlength="20"></div>
      <div class="col-12"><label class="form-label">Địa chỉ</label><input name="address" class="form-control" value="<%=esc(customer.getAddress())%>" maxlength="255"></div>
      <div class="col-md-6"><label class="form-label">Thành phố</label><input name="city" class="form-control" value="<%=esc(customer.getCity())%>" maxlength="100"></div>
      <div class="col-md-6"><label class="form-label">Tỉnh/Thành</label><input name="state" class="form-control" value="<%=esc(customer.getState())%>" maxlength="100"></div>
    </div>
    <div class="d-flex gap-2 mt-4">
      <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
      <a href="ManageCustomerServlet" class="btn btn-secondary">Quay lại</a>
    </div>
  </form>
</main>
<%@include file="footer.jsp"%>
</body>
</html>

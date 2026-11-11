<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;
}
String error = request.getParameter("error");
String errorMessage = null;
if ("invalid".equals(error)) errorMessage = "Vui lòng nhập đầy đủ thông tin hợp lệ.";
else if ("duplicate".equals(error)) errorMessage = "Không thể thêm phòng. Hãy kiểm tra số phòng và kết nối cơ sở dữ liệu.";
else if ("number".equals(error)) errorMessage = "Số phòng, sức chứa và giá phải là số hợp lệ.";
else if ("failed".equals(error)) errorMessage = "Không thể thêm phòng.";
%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Thêm phòng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
<style>
body { background:#f5f5f5; font-family:Segoe UI,sans-serif; }
.card { margin:40px auto; max-width:900px; border:0; border-radius:15px; box-shadow:0 0 15px rgba(0,0,0,.15); }
.card-header { background:#111; color:#D4AF37; font-size:28px; font-weight:bold; text-align:center; padding:20px; }
.btn-save { background:#D4AF37; color:#111; font-weight:bold; }
.btn-save:hover { background:#111; color:#fff; }
</style>
</head>
<body>
<%@include file="adminnavbar.jsp"%>
<div class="container">
  <div class="card">
    <div class="card-header">Thêm phòng mới</div>
    <div class="card-body p-4">
      <% if (errorMessage != null) { %>
        <div class="alert alert-danger"><%=errorMessage%></div>
      <% } %>
      <form action="AddRoomServlet" method="post">
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Số phòng</label>
            <input type="number" name="roomNumber" class="form-control" min="1" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Loại phòng</label>
            <select name="roomType" class="form-select" required>
              <option value="Single">Phòng đơn</option><option value="Double">Phòng đôi</option>
              <option value="Deluxe">Phòng Deluxe</option><option value="Suite">Phòng Suite</option>
              <option value="Family">Phòng gia đình</option><option value="Executive">Phòng Executive</option>
              <option value="Presidential">Phòng Tổng thống</option><option value="Honeymoon">Phòng trăng mật</option>
            </select>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Sức chứa (người)</label>
            <input type="number" name="capacity" class="form-control" min="1" value="2" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Giá mỗi đêm</label>
            <input type="number" name="price" class="form-control" min="0.01" step="0.01" required>
          </div>
          <div class="col-md-12 mb-3">
            <label class="form-label">Mô tả</label>
            <textarea name="description" class="form-control" rows="4" required></textarea>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Đường dẫn ảnh phòng</label>
            <input type="text" name="roomImage" class="form-control" value="images/standard.jpg" required>
            <small class="text-muted">Nhập images/deluxe.jpg, tên file như deluxe.jpg trong web/images, hoặc link ảnh bắt đầu bằng https://.</small>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Trạng thái</label>
            <select name="status" class="form-select" required>
              <option value="Available">Còn trống</option>
              <option value="Maintenance">Đang bảo trì</option>
              <option value="Booked">Đã đặt</option>
            </select>
          </div>
          <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-save btn-lg"><i class="fa-solid fa-floppy-disk"></i>Lưu phòng</button>
            <a href="ManageRoomServlet" class="btn btn-secondary btn-lg ms-3"><i class="fa-solid fa-arrow-left"></i>Hủy</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



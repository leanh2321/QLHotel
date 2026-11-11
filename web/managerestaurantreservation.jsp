<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List,model.RestaurantReservation"%>
<%!
private String escapeHtml(String value) {
    if (value == null) return "";
    return value.replace("&", "&amp;").replace("<", "&lt;")
            .replace(">", "&gt;").replace("\"", "&quot;").replace("'", "&#39;");
}
%>
<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect(request.getContextPath() + "/login.jsp?error=admin");
    return;
}
List<RestaurantReservation> reservations =
        (List<RestaurantReservation>) request.getAttribute("reservations");
%>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Quản lý đặt bàn</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { background: #f5f5f5; }
        h1 { color: #d4af37; font-weight: 700; }
        .page-card { background: #fff; border-radius: 14px; padding: 24px; box-shadow: 0 5px 18px #0002; }
        .table td, .table th { vertical-align: middle; }
        .note { min-width: 180px; max-width: 280px; white-space: pre-wrap; }
    </style>
</head>
<body>
<%@include file="adminnavbar.jsp"%>
<main class="container py-4">
    <h1 class="mb-4">Quản lý đặt bàn nhà hàng</h1>
    <% if ("1".equals(request.getParameter("updated"))) { %>
        <div class="alert alert-success">Đã cập nhật trạng thái đặt bàn.</div>
    <% } else if (request.getParameter("error") != null) { %>
        <div class="alert alert-danger">Không thể tải hoặc cập nhật dữ liệu. Kiểm tra bảng restaurant_reservation trong MySQL.</div>
    <% } %>
    <section class="page-card table-responsive">
        <table class="table table-bordered table-hover mb-0">
            <thead class="table-dark">
                <tr><th>Mã</th><th>Khách hàng</th><th>Liên hệ</th><th>Số khách</th><th>Ngày</th><th>Giờ</th><th>Ghi chú</th><th>Trạng thái</th><th>Thao tác</th></tr>
            </thead>
            <tbody>
            <% if (reservations == null || reservations.isEmpty()) { %>
                <tr><td colspan="9" class="text-center">Chưa có yêu cầu đặt bàn.</td></tr>
            <% } else { for (RestaurantReservation item : reservations) { %>
                <tr>
                    <td><%=item.getId()%></td>
                    <td><%=escapeHtml(item.getCustomerName())%></td>
                    <td><%=escapeHtml(item.getMobile())%><br><%=escapeHtml(item.getEmail())%></td>
                    <td><%=item.getGuestCount()%></td>
                    <td><%=item.getReservationDate()%></td>
                    <td><%=item.getReservationTime().toString().substring(0, 5)%></td>
                    <td class="note"><%=escapeHtml(item.getNote())%></td>
                    <td>
                        <% if ("Confirmed".equals(item.getStatus())) { %><span class="badge text-bg-success">Đã xác nhận</span>
                        <% } else if ("Cancelled".equals(item.getStatus())) { %><span class="badge text-bg-danger">Đã hủy</span>
                        <% } else { %><span class="badge text-bg-warning">Chờ xác nhận</span><% } %>
                    </td>
                    <td>
                        <% if ("Pending".equals(item.getStatus())) { %>
                        <form method="post" action="<%=request.getContextPath()%>/UpdateRestaurantReservationStatusServlet" class="d-flex gap-1">
                            <input type="hidden" name="id" value="<%=item.getId()%>">
                            <button class="btn btn-sm btn-success" name="status" value="Confirmed">Xác nhận</button>
                            <button class="btn btn-sm btn-danger" name="status" value="Cancelled">Hủy</button>
                        </form>
                        <% } else { %><span class="text-muted">Đã xử lý</span><% } %>
                    </td>
                </tr>
            <% } } %>
            </tbody>
        </table>
    </section>
</main>
</body>
</html>

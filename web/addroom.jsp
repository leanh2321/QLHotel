<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp?error=Please Login as Admin");
    return;
}
String error = request.getParameter("error");
String errorMessage = null;
if ("invalid".equals(error)) errorMessage = "Please enter valid room details.";
else if ("duplicate".equals(error)) errorMessage = "Could not add room. Check the room number and database connection.";
else if ("number".equals(error)) errorMessage = "Room number, capacity and price must be valid numbers.";
else if ("failed".equals(error)) errorMessage = "Unable to add room.";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Room</title>
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
    <div class="card-header">Add New Room</div>
    <div class="card-body p-4">
      <% if (errorMessage != null) { %>
        <div class="alert alert-danger"><%=errorMessage%></div>
      <% } %>
      <form action="AddRoomServlet" method="post">
        <div class="row">
          <div class="col-md-6 mb-3">
            <label class="form-label">Room Number</label>
            <input type="number" name="roomNumber" class="form-control" min="1" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Room Type</label>
            <select name="roomType" class="form-select" required>
              <option value="Single">Single</option><option value="Double">Double</option>
              <option value="Deluxe">Deluxe</option><option value="Suite">Suite</option>
              <option value="Family">Family</option><option value="Executive">Executive</option>
              <option value="Presidential">Presidential</option><option value="Honeymoon">Honeymoon</option>
            </select>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Capacity (persons)</label>
            <input type="number" name="capacity" class="form-control" min="1" value="2" required>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Price per night</label>
            <input type="number" name="price" class="form-control" min="0.01" step="0.01" required>
          </div>
          <div class="col-md-12 mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" rows="4" required></textarea>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Room image path</label>
            <input type="text" name="roomImage" class="form-control" value="images/standard.jpg" required>
            <small class="text-muted">Use a path relative to the web folder, for example images/deluxe.jpg.</small>
          </div>
          <div class="col-md-6 mb-3">
            <label class="form-label">Status</label>
            <select name="status" class="form-select" required>
              <option value="Available">Available</option>
              <option value="Maintenance">Maintenance</option>
              <option value="Booked">Booked</option>
            </select>
          </div>
          <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-save btn-lg"><i class="fa-solid fa-floppy-disk"></i> Save Room</button>
            <a href="ManageRoomServlet" class="btn btn-secondary btn-lg ms-3"><i class="fa-solid fa-arrow-left"></i> Cancel</a>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>



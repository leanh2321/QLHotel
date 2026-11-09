package controller;

import dao.RoomDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Room;

import java.io.IOException;

@WebServlet("/AddRoomServlet")
public class AddRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please Login as Admin");
            return;
        }
        request.getRequestDispatcher("addroom.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please Login as Admin");
            return;
        }

        try {
            int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
            int capacity = Integer.parseInt(request.getParameter("capacity"));
            double price = Double.parseDouble(request.getParameter("price"));
            String roomType = request.getParameter("roomType");
            String description = request.getParameter("description");
            String roomImage = request.getParameter("roomImage");
            String status = request.getParameter("status");

            if (roomNumber < 1 || capacity < 1 || price <= 0
                    || isBlank(roomType) || isBlank(description)
                    || isBlank(roomImage) || isBlank(status)) {
                response.sendRedirect("addroom.jsp?error=invalid");
                return;
            }

            Room room = new Room();
            room.setRoomNumber(roomNumber);
            room.setRoomType(roomType.trim());
            room.setCapacity(capacity);
            room.setPrice(price);
            room.setDescription(description.trim());
            room.setRoomImage(roomImage.trim());
            room.setStatus(status.trim());

            if (new RoomDAO().addRoom(room)) {
                response.sendRedirect("ManageRoomServlet?success=added");
            } else {
                response.sendRedirect("addroom.jsp?error=duplicate");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("addroom.jsp?error=number");
        } catch (Exception e) {
            getServletContext().log("Failed to add room", e);
            response.sendRedirect("addroom.jsp?error=failed");
        }
    }

    private boolean isBlank(String value) {
        return value == null || value.trim().isEmpty();
    }
}


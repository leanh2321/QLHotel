package controller;

import dao.RestaurantReservationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/ManageRestaurantReservationServlet")
public class ManageRestaurantReservationServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=admin");
            return;
        }
        try {
            request.setAttribute("reservations", new RestaurantReservationDAO().findAll());
            request.getRequestDispatcher("managerestaurantreservation.jsp").forward(request, response);
        } catch (Exception e) {
            getServletContext().log("Không thể tải danh sách đặt bàn", e);
            response.sendRedirect(request.getContextPath() + "/managerestaurantreservation.jsp?error=load");
        }
    }
}

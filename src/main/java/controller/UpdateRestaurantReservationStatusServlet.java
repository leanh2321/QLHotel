package controller;

import dao.RestaurantReservationDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Set;

@WebServlet("/UpdateRestaurantReservationStatusServlet")
public class UpdateRestaurantReservationStatusServlet extends HttpServlet {
    private static final Set<String> ALLOWED = Set.of("Confirmed", "Cancelled");

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String target = request.getContextPath() + "/ManageRestaurantReservationServlet";
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=admin");
            return;
        }
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String status = request.getParameter("status");
            if (!ALLOWED.contains(status)) {
                response.sendRedirect(target + "?error=status");
                return;
            }
            new RestaurantReservationDAO().updateStatus(id, status);
            response.sendRedirect(target + "?updated=1");
        } catch (Exception e) {
            getServletContext().log("Không thể cập nhật trạng thái đặt bàn", e);
            response.sendRedirect(target + "?error=update");
        }
    }
}

package controller;

import dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/CustomerDashboardServlet")
public class CustomerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Check Login
        if (session == null || session.getAttribute("customer") == null) {

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        int customerId = (Integer) session.getAttribute("customerId");

        BookingDAO bookingDAO = new BookingDAO();

        int totalBookings = bookingDAO.getTotalBookings(customerId);
        int activeBookings = bookingDAO.getActiveBookings(customerId);
        int completedBookings = bookingDAO.getCompletedBookings(customerId);
        int cancelledBookings = bookingDAO.getCancelledBookings(customerId);

        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("activeBookings", activeBookings);
        request.setAttribute("completedBookings", completedBookings);
        request.setAttribute("cancelledBookings", cancelledBookings);

        request.getRequestDispatcher("customerdashboard.jsp")
                .forward(request, response);

    }

}
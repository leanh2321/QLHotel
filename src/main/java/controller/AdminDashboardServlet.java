package controller;

import dao.AdminDashboardDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null || session.getAttribute("admin")==null){

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        AdminDashboardDAO dao = new AdminDashboardDAO();

        request.setAttribute("totalCustomers", dao.getTotalCustomers());

        request.setAttribute("totalRooms", dao.getTotalRooms());

        request.setAttribute("availableRooms", dao.getAvailableRooms());

        request.setAttribute("totalBookings", dao.getTotalBookings());

        request.setAttribute("pendingBookings", dao.getPendingBookings());

        request.setAttribute("totalRevenue", dao.getTotalRevenue());

        request.getRequestDispatcher("admindashboard.jsp")
                .forward(request,response);

    }

}
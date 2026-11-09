package controller;

import dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/BookingHistoryServlet")
public class BookingHistoryServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null || session.getAttribute("customerId")==null){

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        int customerId=(Integer)session.getAttribute("customerId");

        BookingDAO dao=new BookingDAO();

        request.setAttribute(
                "bookingList",
                dao.getCustomerBookings(customerId));

        request.getRequestDispatcher("bookinghistory.jsp")
                .forward(request,response);

    }

}
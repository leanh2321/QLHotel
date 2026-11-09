package controller;

import dao.BookingDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/CheckOutServlet")
public class CheckOutServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin")==null){

            response.sendRedirect("login.jsp");
            return;

        }

        int bookingId =
                Integer.parseInt(request.getParameter("id"));

        BookingDAO dao = new BookingDAO();

        dao.checkOut(bookingId);

        response.sendRedirect(
                "ManageBookingServlet?success=Customer Checked Out");

    }

}
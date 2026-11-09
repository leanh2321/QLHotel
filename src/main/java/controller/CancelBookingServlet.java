package controller;

import dao.BookingDAO;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/CancelBookingServlet")
public class CancelBookingServlet extends HttpServlet{

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException{

        HttpSession session=request.getSession(false);

        if(session==null || session.getAttribute("customerId")==null){

            response.sendRedirect("login.jsp");
            return;

        }

        int bookingId=Integer.parseInt(request.getParameter("bookingId"));

        BookingDAO dao=new BookingDAO();

        int customerId = (Integer)session.getAttribute("customerId");

        dao.cancelBooking(bookingId, customerId);

        response.sendRedirect("BookingHistoryServlet");

    }

}
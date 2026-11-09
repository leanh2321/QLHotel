package controller;

import dao.BookingDAO;
import model.Booking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ManageBookingServlet")
public class ManageBookingServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp?error=Please Login as Admin");
            return;

        }

        String search = request.getParameter("search");

        BookingDAO dao = new BookingDAO();

        ArrayList<Booking> bookings = dao.getAllBookings(search);

        request.setAttribute("bookings", bookings);
        request.setAttribute("search", search);

        request.getRequestDispatcher("managebooking.jsp")
               .forward(request, response);

    }

}
package controller;

import dao.BookingDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Booking;

import java.io.IOException;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("customerId") == null){

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        try{

            int customerId = (Integer)session.getAttribute("customerId");

            int roomId = Integer.parseInt(request.getParameter("roomId"));

            String checkIn = request.getParameter("checkIn");

            String checkOut = request.getParameter("checkOut");

            int guests = Integer.parseInt(request.getParameter("guests"));

            double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

            Booking booking = new Booking();

            booking.setCustomerId(customerId);
            booking.setRoomId(roomId);
            booking.setCheckIn(checkIn);
            booking.setCheckOut(checkOut);
            booking.setGuests(guests);
            booking.setTotalAmount(totalAmount);

            // New booking starts as Pending
            booking.setBookingStatus("Pending");

            BookingDAO dao = new BookingDAO();

            int bookingId = dao.bookRoom(booking);

            if(bookingId > 0){

            response.sendRedirect(
                "payment.jsp?bookingId=" + bookingId
            );

            }else{
                response.sendRedirect(
                "bookroom.jsp?error=Booking Failed"
            );

}

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect("rooms.jsp?error=Something Went Wrong");

        }

    }

}
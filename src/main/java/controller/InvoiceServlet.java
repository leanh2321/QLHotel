package controller;

import dao.BookingDAO;
import dao.CustomerDAO;
import dao.RoomDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Booking;
import model.Customer;
import model.Room;

import java.io.IOException;

@WebServlet("/InvoiceServlet")
public class InvoiceServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int bookingId =
            Integer.parseInt(request.getParameter("bookingId"));

            BookingDAO bookingDAO = new BookingDAO();

            Booking booking =
            bookingDAO.getBookingById(bookingId);

            CustomerDAO customerDAO =
            new CustomerDAO();

            Customer customer =
            customerDAO.getCustomerById(
            booking.getCustomerId());

            RoomDAO roomDAO =
            new RoomDAO();

            Room room =
            roomDAO.getRoomById(
            booking.getRoomId());

            request.setAttribute("booking", booking);

            request.setAttribute("customer", customer);

            request.setAttribute("room", room);

            request.getRequestDispatcher("invoice.jsp")
                    .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect("CustomerDashboardServlet");

        }

    }

}
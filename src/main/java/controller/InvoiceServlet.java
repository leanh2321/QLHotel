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

        if (request.getSession(false) == null
                || request.getSession(false).getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please%20Login%20as%20Admin");
            return;
        }

        String bookingIdParam = request.getParameter("bookingId");
        if (bookingIdParam == null || bookingIdParam.trim().isEmpty()) {
            response.sendRedirect("ManageBookingServlet?error=Invalid%20booking%20id");
            return;
        }

        try {

            int bookingId = Integer.parseInt(bookingIdParam);

            BookingDAO bookingDAO = new BookingDAO();

            Booking booking =
            bookingDAO.getBookingById(bookingId);

            if (booking == null) {
                response.sendRedirect("ManageBookingServlet?error=Invoice%20data%20not%20found");
                return;
            }

            CustomerDAO customerDAO =
            new CustomerDAO();

            Customer customer =
            customerDAO.getCustomerById(
            booking.getCustomerId());

            if (customer == null) {
                response.sendRedirect("ManageBookingServlet?error=Invoice%20data%20not%20found");
                return;
            }

            RoomDAO roomDAO =
            new RoomDAO();

            Room room =
            roomDAO.getRoomById(
            booking.getRoomId());

            if (room == null) {
                response.sendRedirect("ManageBookingServlet?error=Invoice%20data%20not%20found");
                return;
            }

            request.setAttribute("booking", booking);

            request.setAttribute("customer", customer);

            request.setAttribute("room", room);

            request.getRequestDispatcher("invoice.jsp")
                    .forward(request, response);

        }

        catch (NumberFormatException e) {
            response.sendRedirect("ManageBookingServlet?error=Invalid%20booking%20id");
        }
        catch(Exception e){

            e.printStackTrace();

            throw new ServletException("Unable to load invoice", e);

        }

    }

}

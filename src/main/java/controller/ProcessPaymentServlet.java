package controller;

import dao.BookingDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ProcessPaymentServlet")
public class ProcessPaymentServlet extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException{

        try{

            int bookingId = Integer.parseInt(request.getParameter("bookingId"));

            BookingDAO dao = new BookingDAO();

            boolean success = dao.confirmBooking(bookingId);

            if(success){

                response.sendRedirect(
                "InvoiceServlet?bookingId="+bookingId);

            }

            else{

                response.sendRedirect(
                "payment.jsp?bookingId="+bookingId+"&error=Payment Failed");

            }

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect("rooms.jsp");

        }

    }

}
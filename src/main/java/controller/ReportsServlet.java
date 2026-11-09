package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

@WebServlet("/ReportsServlet")
public class ReportsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp");
            return;

        }

        int totalRooms = 0;
        int availableRooms = 0;
        int bookedRooms = 0;
        int totalCustomers = 0;
        int totalBookings = 0;
        int confirmedBookings = 0;
        int cancelledBookings = 0;

        double totalRevenue = 0;

        try{

            Connection con = DBConnection.getConnection();

            Statement st = con.createStatement();

            ResultSet rs;

            rs = st.executeQuery("SELECT COUNT(*) FROM room");
            if(rs.next())
                totalRooms = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM room WHERE status='Available'");
            if(rs.next())
                availableRooms = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM room WHERE status='Booked'");
            if(rs.next())
                bookedRooms = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM customer");
            if(rs.next())
                totalCustomers = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM booking");
            if(rs.next())
                totalBookings = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM booking WHERE booking_status='Confirmed'");
            if(rs.next())
                confirmedBookings = rs.getInt(1);

            rs = st.executeQuery("SELECT COUNT(*) FROM booking WHERE booking_status='Cancelled'");
            if(rs.next())
                cancelledBookings = rs.getInt(1);

            rs = st.executeQuery(
                "SELECT IFNULL(SUM(total_amount),0) FROM booking WHERE booking_status='Confirmed'"
            );

            if(rs.next())
                totalRevenue = rs.getDouble(1);

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        double occupancy = 0;

        if(totalRooms > 0){

            occupancy =
                    ((double)bookedRooms / totalRooms) * 100;

        }

        request.setAttribute("totalRooms", totalRooms);
        request.setAttribute("availableRooms", availableRooms);
        request.setAttribute("bookedRooms", bookedRooms);
        request.setAttribute("totalCustomers", totalCustomers);
        request.setAttribute("totalBookings", totalBookings);
        request.setAttribute("confirmedBookings", confirmedBookings);
        request.setAttribute("cancelledBookings", cancelledBookings);
        request.setAttribute("totalRevenue", totalRevenue);
        request.setAttribute("occupancy", occupancy);

        request.getRequestDispatcher("reports.jsp")
               .forward(request,response);

    }

}
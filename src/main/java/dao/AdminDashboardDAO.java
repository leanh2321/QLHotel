package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import util.DBConnection;

public class AdminDashboardDAO {

    // Total Customers
    public int getTotalCustomers() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM customer");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    // Total Rooms
    public int getTotalRooms() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM room");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    // Available Rooms
    public int getAvailableRooms() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM room WHERE status='Available'");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    // Total Bookings
    public int getTotalBookings() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM booking");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    // Pending Bookings
    public int getPendingBookings() {

        int count = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT COUNT(*) FROM booking WHERE booking_status='Pending'");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                count = rs.getInt(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return count;

    }

    // Total Revenue
    public double getTotalRevenue() {

        double revenue = 0;

        try {

            Connection con = DBConnection.getConnection();

            PreparedStatement ps =
                    con.prepareStatement("SELECT SUM(total_amount) FROM booking WHERE booking_status IN ('Confirmed','Checked In','Checked Out')");

            ResultSet rs = ps.executeQuery();

            if(rs.next()){

                revenue = rs.getDouble(1);

            }

            con.close();

        }
        catch(Exception e){

            e.printStackTrace();

        }

        return revenue;

    }

}
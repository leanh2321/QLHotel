package dao;

import java.sql.*;
import java.util.ArrayList;

import model.Booking;
import util.DBConnection;

public class BookingDAO {

    // Book Room
public int bookRoom(Booking booking) {

    int bookingId = 0;

    try {

        Connection con = DBConnection.getConnection();

        String sql =
        "INSERT INTO booking(customer_id,room_id,check_in,check_out,guests,total_amount,booking_status) VALUES(?,?,?,?,?,?,?)";

        PreparedStatement ps =
        con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

        ps.setInt(1, booking.getCustomerId());
        ps.setInt(2, booking.getRoomId());
        ps.setString(3, booking.getCheckIn());
        ps.setString(4, booking.getCheckOut());
        ps.setInt(5, booking.getGuests());
        ps.setDouble(6, booking.getTotalAmount());

        // Booking is pending until payment
        ps.setString(7, "Pending");

        int rows = ps.executeUpdate();

        if(rows > 0){

            ResultSet rs = ps.getGeneratedKeys();

            if(rs.next()){

                bookingId = rs.getInt(1);

            }

        }

        con.close();

    }

    catch(Exception e){

        e.printStackTrace();

    }

    return bookingId;

}

    // Get All Bookings
    public ArrayList<Booking> getAllBookings() {

        ArrayList<Booking> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM booking ORDER BY booking_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Booking booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setRoomId(rs.getInt("room_id"));
                booking.setCheckIn(rs.getString("check_in"));
                booking.setCheckOut(rs.getString("check_out"));
                booking.setGuests(rs.getInt("guests"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setBookingStatus(rs.getString("booking_status"));

                list.add(booking);

            }

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return list;

    }

    // Get Booking By ID
    public Booking getBookingById(int bookingId) {

        Booking booking = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM booking WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, bookingId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                booking = new Booking();

                booking.setBookingId(rs.getInt("booking_id"));
                booking.setCustomerId(rs.getInt("customer_id"));
                booking.setRoomId(rs.getInt("room_id"));
                booking.setCheckIn(rs.getString("check_in"));
                booking.setCheckOut(rs.getString("check_out"));
                booking.setGuests(rs.getInt("guests"));
                booking.setTotalAmount(rs.getDouble("total_amount"));
                booking.setBookingStatus(rs.getString("booking_status"));
                booking.setBookingDate(rs.getString("booking_date"));

            }

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return booking;

    }

    // Booking History of Customer
    public ArrayList<Booking> getCustomerBookings(int customerId) {

    ArrayList<Booking> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT b.*, r.room_number, r.room_type "
                   + "FROM booking b "
                   + "JOIN room r ON b.room_id = r.room_id "
                   + "WHERE b.customer_id=? "
                   + "ORDER BY b.booking_id DESC";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            Booking booking = new Booking();

            booking.setBookingId(rs.getInt("booking_id"));
            booking.setCustomerId(rs.getInt("customer_id"));
            booking.setRoomId(rs.getInt("room_id"));
            booking.setRoomNumber(rs.getInt("room_number"));
            booking.setRoomType(rs.getString("room_type"));
            booking.setCheckIn(rs.getString("check_in"));
            booking.setCheckOut(rs.getString("check_out"));
            booking.setGuests(rs.getInt("guests"));
            booking.setTotalAmount(rs.getDouble("total_amount"));
            booking.setBookingStatus(rs.getString("booking_status"));

            list.add(booking);

        }

        con.close();

    }
    catch(Exception e) {

        e.printStackTrace();

    }

    return list;

}

    // Update Booking Status
    public boolean updateBookingStatus(int bookingId, String statusValue) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE booking SET booking_status=? WHERE booking_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, statusValue);
            ps.setInt(2, bookingId);

            status = ps.executeUpdate() > 0;

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;

    }

    // Cancel Booking (Secure)
public boolean cancelBooking(int bookingId, int customerId) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        // First get room_id
        String sql1 = "SELECT room_id FROM booking WHERE booking_id=? AND customer_id=?";

        PreparedStatement ps1 = con.prepareStatement(sql1);

        ps1.setInt(1, bookingId);
        ps1.setInt(2, customerId);

        ResultSet rs = ps1.executeQuery();

        if(rs.next()){

            int roomId = rs.getInt("room_id");

            // Cancel booking
            String sql2 = "UPDATE booking SET booking_status='Cancelled' "
                    + "WHERE booking_id=? AND customer_id=?";

            PreparedStatement ps2 = con.prepareStatement(sql2);

            ps2.setInt(1, bookingId);
            ps2.setInt(2, customerId);

            int bookingUpdated = ps2.executeUpdate();

            // Make room available again
            if(bookingUpdated > 0){

                String sql3 = "UPDATE room SET status='Available' WHERE room_id=?";

                PreparedStatement ps3 = con.prepareStatement(sql3);

                ps3.setInt(1, roomId);

                ps3.executeUpdate();

                status = true;

            }

        }

        con.close();

    }

    catch(Exception e){

        e.printStackTrace();

    }

    return status;

}
    
    // Total Bookings
public int getTotalBookings(int customerId) {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT COUNT(*) FROM booking WHERE customer_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            count = rs.getInt(1);
        }

        con.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return count;
}

// Active Bookings
public int getActiveBookings(int customerId) {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT COUNT(*) FROM booking WHERE customer_id=? AND (booking_status='Confirmed' OR booking_status='Checked In')";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            count = rs.getInt(1);
        }

        con.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return count;
}

// Completed Bookings
public int getCompletedBookings(int customerId) {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT COUNT(*) FROM booking WHERE customer_id=? AND booking_status='Checked Out'";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            count = rs.getInt(1);
        }

        con.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return count;
}

// Cancelled Bookings
public int getCancelledBookings(int customerId) {

    int count = 0;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT COUNT(*) FROM booking WHERE customer_id=? AND booking_status='Cancelled'";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            count = rs.getInt(1);
        }

        con.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return count;
}

public boolean confirmBooking(int bookingId){

    boolean status = false;

    try{

        Connection con = DBConnection.getConnection();

        con.setAutoCommit(false);

        // Get Room ID
        String sql1 = "SELECT room_id FROM booking WHERE booking_id=?";

        PreparedStatement ps1 = con.prepareStatement(sql1);

        ps1.setInt(1, bookingId);

        ResultSet rs = ps1.executeQuery();

        int roomId = 0;

        if(rs.next()){

            roomId = rs.getInt("room_id");

        }

        // Update Booking Status
        String sql2 = "UPDATE booking SET booking_status='Confirmed' WHERE booking_id=?";

        PreparedStatement ps2 = con.prepareStatement(sql2);

        ps2.setInt(1, bookingId);

        ps2.executeUpdate();

        // Update Room Status
        String sql3 = "UPDATE room SET status='Booked' WHERE room_id=?";

        PreparedStatement ps3 = con.prepareStatement(sql3);

        ps3.setInt(1, roomId);

        ps3.executeUpdate();

        con.commit();

        status = true;

        con.close();

    }

    catch(Exception e){

        e.printStackTrace();

    }

    return status;

}

// Admin - Get All Bookings with Search
public ArrayList<Booking> getAllBookings(String search) {

    ArrayList<Booking> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql;

        PreparedStatement ps;

        if(search != null && !search.trim().isEmpty()){

            sql =
            "SELECT b.*, " +
            "c.name, c.email, c.mobile, " +
            "r.room_number, r.room_type " +
            "FROM booking b " +
            "JOIN customer c ON b.customer_id=c.customer_id " +
            "JOIN room r ON b.room_id=r.room_id " +
            "WHERE c.name LIKE ? " +
            "OR c.email LIKE ? " +
            "OR CAST(r.room_number AS CHAR) LIKE ? " +
            "ORDER BY b.booking_id DESC";

            ps = con.prepareStatement(sql);

            ps.setString(1,"%"+search+"%");
            ps.setString(2,"%"+search+"%");
            ps.setString(3,"%"+search+"%");

        }
        else{

            sql =
            "SELECT b.*, " +
            "c.name, c.email, c.mobile, " +
            "r.room_number, r.room_type " +
            "FROM booking b " +
            "JOIN customer c ON b.customer_id=c.customer_id " +
            "JOIN room r ON b.room_id=r.room_id " +
            "ORDER BY b.booking_id DESC";

            ps = con.prepareStatement(sql);

        }

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Booking booking = new Booking();

            booking.setBookingId(rs.getInt("booking_id"));
            booking.setCustomerId(rs.getInt("customer_id"));
            booking.setRoomId(rs.getInt("room_id"));

            booking.setCheckIn(rs.getString("check_in"));
            booking.setCheckOut(rs.getString("check_out"));

            booking.setGuests(rs.getInt("guests"));

            booking.setTotalAmount(rs.getDouble("total_amount"));

            booking.setBookingStatus(rs.getString("booking_status"));

            booking.setBookingDate(rs.getString("booking_date"));

            booking.setCustomerName(rs.getString("name"));
            booking.setCustomerEmail(rs.getString("email"));
            booking.setCustomerMobile(rs.getString("mobile"));

            booking.setRoomNumber(rs.getInt("room_number"));
            booking.setRoomType(rs.getString("room_type"));

            list.add(booking);

        }

        con.close();

    }
    catch(Exception e){

        e.printStackTrace();

    }

    return list;

}

// Approve Booking
public boolean approveBooking(int bookingId){

    return updateBookingStatus(bookingId, "Confirmed");

}

// Reject Booking
public boolean rejectBooking(int bookingId){

    return updateBookingStatus(bookingId, "Cancelled");

}

// Check In
public boolean checkIn(int bookingId){

    return updateBookingStatus(bookingId, "Checked In");

}

// Check Out
public boolean checkOut(int bookingId){

    return updateBookingStatus(bookingId, "Checked Out");

}

}
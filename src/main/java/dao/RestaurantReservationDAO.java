package dao;

import model.RestaurantReservation;
import util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RestaurantReservationDAO {
    public boolean create(RestaurantReservation reservation) throws Exception {
        String sql = "INSERT INTO restaurant_reservation "
                + "(customer_name, mobile, email, guest_count, reservation_date, reservation_time, note) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) throw new IllegalStateException("Không kết nối được MySQL.");
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, reservation.getCustomerName());
                statement.setString(2, reservation.getMobile());
                statement.setString(3, reservation.getEmail());
                statement.setInt(4, reservation.getGuestCount());
                statement.setDate(5, reservation.getReservationDate());
                statement.setTime(6, reservation.getReservationTime());
                statement.setString(7, reservation.getNote());
                return statement.executeUpdate() == 1;
            }
        }
    }

    public List<RestaurantReservation> findAll() throws Exception {
        List<RestaurantReservation> reservations = new ArrayList<>();
        String sql = "SELECT id, customer_name, mobile, email, guest_count, reservation_date, "
                + "reservation_time, note, status FROM restaurant_reservation "
                + "ORDER BY reservation_date DESC, reservation_time DESC, id DESC";
        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) throw new IllegalStateException("Không kết nối được MySQL.");
            try (PreparedStatement statement = connection.prepareStatement(sql);
                 ResultSet result = statement.executeQuery()) {
                while (result.next()) {
                    RestaurantReservation reservation = new RestaurantReservation();
                    reservation.setId(result.getInt("id"));
                    reservation.setCustomerName(result.getString("customer_name"));
                    reservation.setMobile(result.getString("mobile"));
                    reservation.setEmail(result.getString("email"));
                    reservation.setGuestCount(result.getInt("guest_count"));
                    reservation.setReservationDate(result.getDate("reservation_date"));
                    reservation.setReservationTime(result.getTime("reservation_time"));
                    reservation.setNote(result.getString("note"));
                    reservation.setStatus(result.getString("status"));
                    reservations.add(reservation);
                }
            }
        }
        return reservations;
    }

    public boolean updateStatus(int id, String status) throws Exception {
        String sql = "UPDATE restaurant_reservation SET status = ? WHERE id = ?";
        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) throw new IllegalStateException("Không kết nối được MySQL.");
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, status);
                statement.setInt(2, id);
                return statement.executeUpdate() == 1;
            }
        }
    }
}

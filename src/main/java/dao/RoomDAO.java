package dao;

import java.sql.*;
import java.util.ArrayList;

import model.Room;
import util.DBConnection;

public class RoomDAO {

    // Add Room
    public boolean addRoom(Room room) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO room(room_number,room_type,capacity,price,description,room_image,status) VALUES(?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setInt(3, room.getCapacity());
            ps.setDouble(4, room.getPrice());
            ps.setString(5, room.getDescription());
            ps.setString(6, room.getRoomImage());
            ps.setString(7, room.getStatus());

            status = ps.executeUpdate() > 0;

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;

    }

    // Get All Rooms
    public ArrayList<Room> getAllRooms() {

        ArrayList<Room> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM room";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Room room = new Room();

                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getInt("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setPrice(rs.getDouble("price"));
                room.setDescription(rs.getString("description"));
                room.setRoomImage(rs.getString("room_image"));
                room.setStatus(rs.getString("status"));

                list.add(room);

            }

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return list;

    }
    
    public ArrayList<Room> getAllRooms(String search) {

    ArrayList<Room> list = new ArrayList<>();

    try {

        Connection con = DBConnection.getConnection();

        String sql;

        PreparedStatement ps;

        if(search != null && !search.trim().isEmpty()) {

            sql = "SELECT * FROM room WHERE room_number LIKE ? OR room_type LIKE ? ORDER BY room_number";

            ps = con.prepareStatement(sql);

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");

        } else {

            sql = "SELECT * FROM room ORDER BY room_number";

            ps = con.prepareStatement(sql);

        }

        ResultSet rs = ps.executeQuery();

        while(rs.next()) {

            Room room = new Room();

            room.setRoomId(rs.getInt("room_id"));
            room.setRoomNumber(rs.getInt("room_number"));
            room.setRoomType(rs.getString("room_type"));
            room.setCapacity(rs.getInt("capacity"));
            room.setPrice(rs.getDouble("price"));
            room.setDescription(rs.getString("description"));
            room.setRoomImage(rs.getString("room_image"));
            room.setStatus(rs.getString("status"));

            list.add(room);

        }

        con.close();

    } catch(Exception e) {

        e.printStackTrace();

    }

    return list;

}

    // Get Room By ID
    public Room getRoomById(int roomId) {

        Room room = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM room WHERE room_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, roomId);

            ResultSet rs = ps.executeQuery();

            if(rs.next()) {

                room = new Room();

                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getInt("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setPrice(rs.getDouble("price"));
                room.setDescription(rs.getString("description"));
                room.setRoomImage(rs.getString("room_image"));
                room.setStatus(rs.getString("status"));

            }

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return room;

    }

    // Update Room
    public boolean updateRoom(Room room) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "UPDATE room SET room_number=?, room_type=?, capacity=?, price=?, description=?, room_image=?, status=? WHERE room_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, room.getRoomNumber());
            ps.setString(2, room.getRoomType());
            ps.setInt(3, room.getCapacity());
            ps.setDouble(4, room.getPrice());
            ps.setString(5, room.getDescription());
            ps.setString(6, room.getRoomImage());
            ps.setString(7, room.getStatus());
            ps.setInt(8, room.getRoomId());

            status = ps.executeUpdate() > 0;

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;

    }

    // Delete Room
    public boolean deleteRoom(int roomId) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "DELETE FROM room WHERE room_id=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, roomId);

            status = ps.executeUpdate() > 0;

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return status;

    }

    // Get Available Rooms
    public ArrayList<Room> getAvailableRooms() {

        ArrayList<Room> list = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM room WHERE status='Available'";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while(rs.next()) {

                Room room = new Room();

                room.setRoomId(rs.getInt("room_id"));
                room.setRoomNumber(rs.getInt("room_number"));
                room.setRoomType(rs.getString("room_type"));
                room.setCapacity(rs.getInt("capacity"));
                room.setPrice(rs.getDouble("price"));
                room.setDescription(rs.getString("description"));
                room.setRoomImage(rs.getString("room_image"));
                room.setStatus(rs.getString("status"));

                list.add(room);

            }

            con.close();

        }
        catch(Exception e) {

            e.printStackTrace();

        }

        return list;

    }

}
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Admin;
import util.DBConnection;

public class AdminDAO {

    // Admin Login
    public Admin loginAdmin(String email) {

        Admin admin = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM admin WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                admin = new Admin();

                admin.setAdminId(rs.getInt("admin_id"));
                admin.setName(rs.getString("name"));
                admin.setEmail(rs.getString("email"));
                admin.setPassword(rs.getString("password"));

            }

            con.close();

        }
        catch (Exception e) {

            e.printStackTrace();

        }

        return admin;

    }

}
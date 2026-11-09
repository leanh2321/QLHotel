package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import model.Customer;
import java.util.ArrayList;
import util.DBConnection;

public class CustomerDAO {

    // Register Customer
    public boolean registerCustomer(Customer customer) {

        boolean status = false;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "INSERT INTO customer(name,gender,dob,mobile,email,address,city,state,pincode,password) VALUES(?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, customer.getName());
            ps.setString(2, customer.getGender());
            ps.setString(3, customer.getDob());
            ps.setString(4, customer.getMobile());
            ps.setString(5, customer.getEmail());
            ps.setString(6, customer.getAddress());
            ps.setString(7, customer.getCity());
            ps.setString(8, customer.getState());
            ps.setString(9, customer.getPincode());
            ps.setString(10, customer.getPassword());

            status = ps.executeUpdate() > 0;

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return status;
    }

    // Login Customer
    public Customer loginCustomer(String email) {

        Customer customer = null;

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM customer WHERE email=?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                customer = new Customer();

                customer.setCustomerId(rs.getInt("customer_id"));
                customer.setName(rs.getString("name"));
                customer.setGender(rs.getString("gender"));
                customer.setDob(rs.getString("dob"));
                customer.setMobile(rs.getString("mobile"));
                customer.setEmail(rs.getString("email"));
                customer.setAddress(rs.getString("address"));
                customer.setCity(rs.getString("city"));
                customer.setState(rs.getString("state"));
                customer.setPincode(rs.getString("pincode"));
                customer.setPassword(rs.getString("password"));

            }

            con.close();

        } catch (Exception e) {

            e.printStackTrace();

        }

        return customer;

    }
    
    public boolean emailExists(String email) {

    boolean exists = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "SELECT email FROM customer WHERE email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, email);

        ResultSet rs = ps.executeQuery();

        if(rs.next()) {

            exists = true;

        }

        con.close();

    }
    catch (Exception e) {

    e.printStackTrace();

    System.out.println("DAO Error : " + e.getMessage());

}

    return exists;

}
    
public Customer getCustomerById(int customerId){

    Customer customer = null;

    try{

        Connection con = DBConnection.getConnection();

        String sql = "SELECT * FROM customer WHERE customer_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, customerId);

        ResultSet rs = ps.executeQuery();

        if(rs.next()){

            customer = new Customer();

            customer.setCustomerId(rs.getInt("customer_id"));
            customer.setName(rs.getString("name"));
            customer.setGender(rs.getString("gender"));
            customer.setDob(rs.getString("dob"));
            customer.setMobile(rs.getString("mobile"));
            customer.setEmail(rs.getString("email"));
            customer.setAddress(rs.getString("address"));
            customer.setCity(rs.getString("city"));
            customer.setState(rs.getString("state"));
            customer.setPincode(rs.getString("pincode"));
            customer.setPassword(rs.getString("password"));

        }

        con.close();

    }
    catch(Exception e){

        e.printStackTrace();

    }

    return customer;

}

public boolean updateCustomer(Customer customer) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE customer SET name=?, gender=?, dob=?, mobile=?, address=?, city=?, state=?, pincode=? WHERE customer_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, customer.getName());
        ps.setString(2, customer.getGender());
        ps.setString(3, customer.getDob());
        ps.setString(4, customer.getMobile());
        ps.setString(5, customer.getAddress());
        ps.setString(6, customer.getCity());
        ps.setString(7, customer.getState());
        ps.setString(8, customer.getPincode());
        ps.setInt(9, customer.getCustomerId());

        status = ps.executeUpdate() > 0;

        con.close();

    }
    catch(Exception e) {

        e.printStackTrace();

    }

    return status;

}

public boolean changePassword(int customerId, String password){

    boolean status = false;

    try{

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE customer SET password=? WHERE customer_id=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, password);
        ps.setInt(2, customerId);

        status = ps.executeUpdate() > 0;

        con.close();

    }
    catch(Exception e){

        e.printStackTrace();

    }

    return status;

}

public ArrayList<Customer> getAllCustomers(String search){

    ArrayList<Customer> list = new ArrayList<>();

    try{

        Connection con = DBConnection.getConnection();

        String sql;

        PreparedStatement ps;

        if(search != null && !search.trim().isEmpty()){

            sql = "SELECT * FROM customer "
                + "WHERE name LIKE ? "
                + "OR email LIKE ? "
                + "OR mobile LIKE ? "
                + "ORDER BY customer_id DESC";

            ps = con.prepareStatement(sql);

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            ps.setString(3, "%" + search + "%");

        }else{

            sql = "SELECT * FROM customer ORDER BY customer_id DESC";

            ps = con.prepareStatement(sql);

        }

        ResultSet rs = ps.executeQuery();

        while(rs.next()){

            Customer customer = new Customer();

            customer.setCustomerId(rs.getInt("customer_id"));
            customer.setName(rs.getString("name"));
            customer.setGender(rs.getString("gender"));
            customer.setDob(rs.getString("dob"));
            customer.setMobile(rs.getString("mobile"));
            customer.setEmail(rs.getString("email"));
            customer.setAddress(rs.getString("address"));
            customer.setCity(rs.getString("city"));
            customer.setState(rs.getString("state"));
            customer.setPincode(rs.getString("pincode"));
            customer.setPassword(rs.getString("password"));

            list.add(customer);

        }

        con.close();

    }
    catch(Exception e){

        e.printStackTrace();

    }

    return list;

}

public boolean deleteCustomer(int customerId){

    boolean status = false;

    try{

        Connection con = DBConnection.getConnection();

        String sql =
                "DELETE FROM customer WHERE customer_id=?";

        PreparedStatement ps =
                con.prepareStatement(sql);

        ps.setInt(1, customerId);

        status = ps.executeUpdate() > 0;

        con.close();

    }
    catch(Exception e){

        e.printStackTrace();

    }

    return status;

}

public boolean updatePassword(String email, String password) {

    boolean status = false;

    try {

        Connection con = DBConnection.getConnection();

        String sql = "UPDATE customer SET password=? WHERE email=?";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, password);
        ps.setString(2, email);

        status = ps.executeUpdate() > 0;

        con.close();

    } catch (Exception e) {

        e.printStackTrace();

    }

    return status;

}

}
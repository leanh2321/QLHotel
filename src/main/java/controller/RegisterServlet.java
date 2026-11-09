package controller;

import dao.CustomerDAO;
import model.Customer;
import util.EncryptionUtil;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String state = request.getParameter("state");
            String pincode = request.getParameter("pincode");
            String password = request.getParameter("password");

            // Basic Validation
            if (name == null || name.trim().isEmpty() ||
                email == null || email.trim().isEmpty() ||
                password == null || password.trim().isEmpty()) {

                response.sendRedirect("register.jsp?error=Please Fill All Required Fields");
                return;
            }

            CustomerDAO dao = new CustomerDAO();

            // Check Duplicate Email
            if (dao.emailExists(email)) {

                response.sendRedirect("register.jsp?error=Email Already Registered");
                return;
            }

            // Encrypt Password
            String encryptedPassword = EncryptionUtil.encrypt(password);

            Customer customer = new Customer();

            customer.setName(name);
            customer.setGender(gender);
            customer.setDob(dob);
            customer.setMobile(mobile);
            customer.setEmail(email);
            customer.setAddress(address);
            customer.setCity(city);
            customer.setState(state);
            customer.setPincode(pincode);
            customer.setPassword(encryptedPassword);

            boolean status = dao.registerCustomer(customer);

            if (status) {

                response.sendRedirect("login.jsp?success=1");

            } else {

                response.sendRedirect("register.jsp?error=Registration Failed");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("register.jsp?error=Something Went Wrong");

        }

    }

}
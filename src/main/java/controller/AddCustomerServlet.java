package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;
import util.EncryptionUtil;

import java.io.IOException;

@WebServlet("/AddCustomerServlet")
public class AddCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please%20Login%20as%20Admin");
            return;
        }

        String name = value(request, "name");
        String email = value(request, "email");
        String mobile = value(request, "mobile");
        String password = value(request, "password");
        String dob = value(request, "dob");
        if (name.isEmpty() || email.isEmpty() || mobile.isEmpty() || password.length() < 6 || dob.isEmpty()) {
            response.sendRedirect("ManageCustomerServlet?error=Please%20Fill%20All%20Required%20Fields");
            return;
        }

        CustomerDAO dao = new CustomerDAO();
        if (dao.emailExists(email)) {
            response.sendRedirect("ManageCustomerServlet?error=Email%20Already%20Registered");
            return;
        }

        Customer customer = new Customer();
        customer.setName(name);
        customer.setEmail(email);
        customer.setMobile(mobile);
        customer.setPassword(EncryptionUtil.encrypt(password));
        customer.setGender(value(request, "gender"));
        customer.setDob(dob);
        customer.setAddress(value(request, "address"));
        customer.setCity(value(request, "city"));
        customer.setState(value(request, "state"));
        customer.setPincode(value(request, "pincode"));

        if (dao.registerCustomer(customer)) {
            response.sendRedirect("ManageCustomerServlet?success=Customer%20Added%20Successfully");
        } else {
            response.sendRedirect("ManageCustomerServlet?error=Unable%20to%20Add%20Customer");
        }
    }

    private String value(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }
}

package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Customer;

import java.io.IOException;

@WebServlet("/UpdateCustomerServlet")
public class UpdateCustomerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please%20Login%20as%20Admin");
            return;
        }

        String id = value(request, "customerId");
        try {
            int customerId = Integer.parseInt(id);
            String name = value(request, "name");
            String email = value(request, "email");
            String mobile = value(request, "mobile");
            if (name.isEmpty() || email.isEmpty() || mobile.isEmpty()) {
                response.sendRedirect("EditCustomerServlet?id=" + customerId
                        + "&error=Please%20Fill%20All%20Required%20Fields");
                return;
            }

            CustomerDAO dao = new CustomerDAO();
            if (dao.emailExistsForOtherCustomer(email, customerId)) {
                response.sendRedirect("EditCustomerServlet?id=" + customerId
                        + "&error=Email%20Already%20Registered");
                return;
            }

            Customer customer = new Customer();
            customer.setCustomerId(customerId);
            customer.setName(name);
            customer.setEmail(email);
            customer.setMobile(mobile);
            customer.setGender(value(request, "gender"));
            customer.setDob(value(request, "dob"));
            customer.setAddress(value(request, "address"));
            customer.setCity(value(request, "city"));
            customer.setState(value(request, "state"));
            customer.setPincode(value(request, "pincode"));

            if (dao.updateCustomer(customer)) {
                response.sendRedirect("ManageCustomerServlet?success=Customer%20Updated%20Successfully");
            } else {
                response.sendRedirect("EditCustomerServlet?id=" + customerId
                        + "&error=Unable%20to%20Update%20Customer");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("ManageCustomerServlet?error=Customer%20Not%20Found");
        }
    }

    private String value(HttpServletRequest request, String name) {
        String value = request.getParameter(name);
        return value == null ? "" : value.trim();
    }
}

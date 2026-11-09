package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import model.Customer;
import util.EncryptionUtil;

import java.io.IOException;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("customerId") == null) {

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        int customerId = (Integer) session.getAttribute("customerId");

        String oldPassword = request.getParameter("oldPassword");
        String newPassword = request.getParameter("newPassword");
        String confirmPassword = request.getParameter("confirmPassword");

        CustomerDAO dao = new CustomerDAO();

        Customer customer = dao.getCustomerById(customerId);

        if (customer == null) {

            response.sendRedirect("changepassword.jsp?error=Customer Not Found");
            return;

        }

        String dbPassword = EncryptionUtil.decrypt(customer.getPassword());

        if (!oldPassword.equals(dbPassword)) {

            response.sendRedirect("changepassword.jsp?error=Current Password is Incorrect");
            return;

        }

        if (!newPassword.equals(confirmPassword)) {

            response.sendRedirect("changepassword.jsp?error=New Password and Confirm Password do not match");
            return;

        }

        String encryptedPassword = EncryptionUtil.encrypt(newPassword);

        boolean status = dao.changePassword(customerId, encryptedPassword);

        if (status) {

            response.sendRedirect("changepassword.jsp?success=Password Changed Successfully");

        } else {

            response.sendRedirect("changepassword.jsp?error=Unable to Change Password");

        }

    }

}
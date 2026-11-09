package controller;

import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import util.EncryptionUtil;

@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            CustomerDAO dao = new CustomerDAO();

            // Encrypt the new password
            String encryptedPassword = EncryptionUtil.encrypt(password);

            boolean status = dao.updatePassword(email, encryptedPassword);

            if (status) {

                response.sendRedirect(
                        "login.jsp?success=Password updated successfully. Please login.");

            } else {

                response.sendRedirect(
                        "forgotpassword.jsp?error=Email not found.");

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "forgotpassword.jsp?error=Something went wrong.");

        }

    }

}
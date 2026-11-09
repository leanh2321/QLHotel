package controller;

import dao.AdminDAO;
import dao.CustomerDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Admin;
import model.Customer;
import util.EncryptionUtil;

import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {
            String role = request.getParameter("role");
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            // ================= CUSTOMER LOGIN =================
            if (role.equals("customer")) {

                CustomerDAO dao = new CustomerDAO();

                Customer customer = dao.loginCustomer(email);

                if (customer == null) {

                    response.sendRedirect("login.jsp?error=Invalid Email");
                    return;

                }

                String dbPassword = customer.getPassword();

                if (password.equals(dbPassword)) {

                    HttpSession session = request.getSession();

                    session.setAttribute("customer", customer);
                    session.setAttribute("customerId", customer.getCustomerId());
                    session.setAttribute("customerName", customer.getName());
                    session.setAttribute("email", customer.getEmail());

                    response.sendRedirect("CustomerDashboardServlet");

                } else {

                    response.sendRedirect("login.jsp?error=Invalid Password");

                }

            }

            // ================= ADMIN LOGIN =================
            else if (role.equals("admin")) {

                AdminDAO dao = new AdminDAO();

                Admin admin = dao.loginAdmin(email);

                if (admin == null) {

                    response.sendRedirect("login.jsp?error=Invalid Email");
                    return;

                }

                String dbPassword = admin.getPassword();

                if (password.equals(dbPassword)) {

                    HttpSession session = request.getSession();

                    session.setAttribute("admin", admin);
                    session.setAttribute("adminId", admin.getAdminId());
                    session.setAttribute("adminName", admin.getName());
                    session.setAttribute("adminEmail", admin.getEmail());

                    response.sendRedirect("AdminDashboardServlet");

                } else {

                    response.sendRedirect("login.jsp?error=Invalid Password");

                }

            }

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("login.jsp?error=Login Failed");

        }

    }

}
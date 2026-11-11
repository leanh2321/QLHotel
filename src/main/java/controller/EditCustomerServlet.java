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

@WebServlet("/EditCustomerServlet")
public class EditCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("login.jsp?error=Please%20Login%20as%20Admin");
            return;
        }

        try {
            int customerId = Integer.parseInt(request.getParameter("id"));
            Customer customer = new CustomerDAO().getCustomerById(customerId);
            if (customer == null) {
                response.sendRedirect("ManageCustomerServlet?error=Customer%20Not%20Found");
                return;
            }

            request.setAttribute("customer", customer);
            request.getRequestDispatcher("editcustomer.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendRedirect("ManageCustomerServlet?error=Customer%20Not%20Found");
        }
    }
}

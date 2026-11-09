package controller;

import dao.CustomerDAO;
import model.Customer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ManageCustomerServlet")
public class ManageCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp?error=Please Login as Admin");
            return;

        }

        String search = request.getParameter("search");

        CustomerDAO dao = new CustomerDAO();

        ArrayList<Customer> customers =
                dao.getAllCustomers(search);

        request.setAttribute("customers", customers);
        request.setAttribute("search", search);

        request.getRequestDispatcher("managecustomer.jsp")
               .forward(request, response);

    }

}
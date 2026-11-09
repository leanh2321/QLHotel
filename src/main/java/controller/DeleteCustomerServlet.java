package controller;

import dao.CustomerDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteCustomerServlet")
public class DeleteCustomerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp");
            return;

        }

        int customerId =
                Integer.parseInt(request.getParameter("id"));

        CustomerDAO dao = new CustomerDAO();

        dao.deleteCustomer(customerId);

        response.sendRedirect(
                "ManageCustomerServlet?success=Customer Deleted");

    }

}
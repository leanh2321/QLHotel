package controller;

import dao.CustomerDAO;
import model.Customer;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/EditProfileServlet")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session==null || session.getAttribute("customerId")==null){

            response.sendRedirect("login.jsp?error=Please Login First");
            return;

        }

        int customerId=(Integer)session.getAttribute("customerId");

        CustomerDAO dao=new CustomerDAO();

        Customer customer=dao.getCustomerById(customerId);

        request.setAttribute("customer", customer);

        request.getRequestDispatcher("editprofile.jsp").forward(request,response);

    }

}
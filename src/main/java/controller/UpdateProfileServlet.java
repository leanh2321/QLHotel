package controller;

import dao.CustomerDAO;
import model.Customer;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UpdateProfileServlet")
public class UpdateProfileServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if(session == null || session.getAttribute("customerId") == null){

                response.sendRedirect("login.jsp?error=Please Login First");
                return;

            }

            Customer customer = new Customer();

            customer.setCustomerId(Integer.parseInt(request.getParameter("customerId")));
            customer.setName(request.getParameter("name"));
            customer.setGender(request.getParameter("gender"));
            customer.setDob(request.getParameter("dob"));
            customer.setMobile(request.getParameter("mobile"));
            customer.setAddress(request.getParameter("address"));
            customer.setCity(request.getParameter("city"));
            customer.setState(request.getParameter("state"));
            customer.setPincode(request.getParameter("pincode"));

            // Keep logged-in email
            customer.setEmail((String) session.getAttribute("email"));

            CustomerDAO dao = new CustomerDAO();

            boolean status = dao.updateCustomer(customer);

            if(status){

                // Update session name if user changed it
                session.setAttribute("customerName", customer.getName());

                response.sendRedirect("ProfileServlet?success=Profile Updated Successfully");

            }else{

                response.sendRedirect("EditProfileServlet?error=Profile Update Failed");

            }

        }
        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect("EditProfileServlet?error=Something Went Wrong");

        }

    }

}
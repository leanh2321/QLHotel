package controller;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SaveContactServlet")
public class SaveContactServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String name = trim(request.getParameter("name"));
        String mobile = trim(request.getParameter("mobile"));
        String email = trim(request.getParameter("email"));
        String message = trim(request.getParameter("message"));

        if (name.isEmpty() || mobile.isEmpty() || email.isEmpty() || message.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/contact.jsp?error=missing");
            return;
        }

        String sql = "INSERT INTO contact_message (name, mobile, email, message) VALUES (?, ?, ?, ?)";
        try (Connection connection = DBConnection.getConnection()) {
            if (connection == null) {
                throw new IllegalStateException("Không kết nối được cơ sở dữ liệu.");
            }
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, name);
                statement.setString(2, mobile);
                statement.setString(3, email);
                statement.setString(4, message);
                statement.executeUpdate();
            }
            response.sendRedirect(request.getContextPath() + "/contact.jsp?sent=1");
        } catch (Exception e) {
            getServletContext().log("Không thể lưu lời nhắn liên hệ", e);
            response.sendRedirect(request.getContextPath() + "/contact.jsp?error=save");
        }
    }

    private String trim(String value) {
        return value == null ? "" : value.trim();
    }
}

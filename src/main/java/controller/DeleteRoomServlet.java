package controller;

import dao.RoomDAO;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/DeleteRoomServlet")
public class DeleteRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp");
            return;

        }

        int roomId =
                Integer.parseInt(request.getParameter("id"));

        RoomDAO dao = new RoomDAO();

        dao.deleteRoom(roomId);

        response.sendRedirect(
                "ManageRoomServlet?success=Room Deleted Successfully");

    }

}
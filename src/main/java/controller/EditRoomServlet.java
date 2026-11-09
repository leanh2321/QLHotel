package controller;

import dao.RoomDAO;
import model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/EditRoomServlet")
public class EditRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp");
            return;

        }

        int roomId = Integer.parseInt(request.getParameter("id"));

        RoomDAO dao = new RoomDAO();

        Room room = dao.getRoomById(roomId);

        request.setAttribute("room", room);

        request.getRequestDispatcher("editroom.jsp")
               .forward(request, response);

    }

}
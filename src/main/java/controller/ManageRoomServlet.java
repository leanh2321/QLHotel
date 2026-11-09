package controller;

import dao.RoomDAO;
import model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet("/ManageRoomServlet")
public class ManageRoomServlet extends HttpServlet {

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

        RoomDAO dao = new RoomDAO();

        ArrayList<Room> rooms;

        if(search != null && !search.trim().isEmpty()){

            rooms = dao.getAllRooms(search);

        }else{

            rooms = dao.getAllRooms();

        }

        request.setAttribute("rooms", rooms);

        request.setAttribute("search", search);

        request.getRequestDispatcher("manageroom.jsp")
               .forward(request, response);

    }

}
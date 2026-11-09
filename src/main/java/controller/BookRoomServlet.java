package controller;

import dao.RoomDAO;
import model.Room;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/BookRoomServlet")
public class BookRoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        try {

            int roomId = Integer.parseInt(request.getParameter("roomId"));

            RoomDAO dao = new RoomDAO();

            Room room = dao.getRoomById(roomId);

            request.setAttribute("room", room);

            request.getRequestDispatcher("bookroom.jsp")
                    .forward(request, response);

        }

        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect("RoomServlet");

        }

    }

}
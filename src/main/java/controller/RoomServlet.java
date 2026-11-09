package controller;

import dao.RoomDAO;
import model.Room;

import java.io.IOException;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RoomServlet")
public class RoomServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        RoomDAO dao = new RoomDAO();

        ArrayList<Room> rooms = dao.getAllRooms();

        request.setAttribute("rooms", rooms);

        request.getRequestDispatcher("rooms.jsp").forward(request, response);

    }

}
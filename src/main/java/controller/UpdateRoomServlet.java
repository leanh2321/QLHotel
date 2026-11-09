package controller;

import dao.RoomDAO;
import model.Room;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/UpdateRoomServlet")
public class UpdateRoomServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){

            response.sendRedirect("login.jsp");
            return;

        }

        try{

            Room room = new Room();

            room.setRoomId(
                Integer.parseInt(request.getParameter("roomId"))
            );

            room.setRoomNumber(
                Integer.parseInt(request.getParameter("roomNumber"))
            );

            room.setRoomType(
                request.getParameter("roomType")
            );

            room.setCapacity(
                Integer.parseInt(request.getParameter("capacity"))
            );

            room.setPrice(
                Double.parseDouble(request.getParameter("price"))
            );

            room.setDescription(
                request.getParameter("description")
            );

            room.setRoomImage(
                request.getParameter("roomImage")
            );

            room.setStatus(
                request.getParameter("status")
            );

            RoomDAO dao = new RoomDAO();

            boolean status = dao.updateRoom(room);

            if(status){

                response.sendRedirect(
                        "ManageRoomServlet?success=Room Updated Successfully");

            }
            else{

                response.sendRedirect(
                        "ManageRoomServlet?error=Unable to Update Room");

            }

        }
        catch(Exception e){

            e.printStackTrace();

            response.sendRedirect(
                    "ManageRoomServlet?error=Something Went Wrong");

        }

    }

}
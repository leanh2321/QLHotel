package controller;

import dao.RestaurantReservationDAO;
import model.RestaurantReservation;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalTime;

@WebServlet("/SubmitRestaurantReservationServlet")
public class SubmitRestaurantReservationServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String base = request.getContextPath() + "/restaurant.jsp";
        try {
            String name = value(request, "customerName");
            String mobile = value(request, "mobile");
            String email = value(request, "email");
            String note = value(request, "note");
            int guests = Integer.parseInt(request.getParameter("guestCount"));
            LocalDate date = LocalDate.parse(request.getParameter("reservationDate"));
            LocalTime time = LocalTime.parse(request.getParameter("reservationTime"));
            if (name.isEmpty() || mobile.isEmpty() || email.isEmpty() || guests < 1
                    || date.isBefore(LocalDate.now())) {
                response.sendRedirect(base + "?reservation=invalid#datban");
                return;
            }

            RestaurantReservation reservation = new RestaurantReservation();
            reservation.setCustomerName(name);
            reservation.setMobile(mobile);
            reservation.setEmail(email);
            reservation.setGuestCount(guests);
            reservation.setReservationDate(Date.valueOf(date));
            reservation.setReservationTime(Time.valueOf(time));
            reservation.setNote(note);

            if (new RestaurantReservationDAO().create(reservation)) {
                response.sendRedirect(base + "?reservation=success#datban");
            } else {
                response.sendRedirect(base + "?reservation=error#datban");
            }
        } catch (Exception e) {
            getServletContext().log("Không thể tạo yêu cầu đặt bàn", e);
            response.sendRedirect(base + "?reservation=error#datban");
        }
    }

    private String value(HttpServletRequest request, String key) {
        String value = request.getParameter(key);
        return value == null ? "" : value.trim();
    }
}

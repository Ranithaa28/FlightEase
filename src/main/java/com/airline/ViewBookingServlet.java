package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.util.*;

public class ViewBookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        List<Map<String, String>> bookings = new ArrayList<>();

        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(
                "SELECT b.id AS booking_id, b.name AS passenger_name, " +
                "f.airline, f.flight_number, f.source, f.destination, f.departure_time, f.duration, f.price, f.description " +
                "FROM bookings b JOIN flights f ON b.flight_id = f.id"
            );

            while (rs.next()) {
                Map<String, String> booking = new HashMap<>();
                booking.put("id", rs.getString("booking_id"));
                booking.put("name", rs.getString("passenger_name"));
                booking.put("airline", rs.getString("airline"));
                booking.put("flight_number", rs.getString("flight_number"));
                booking.put("source", rs.getString("source"));
                booking.put("destination", rs.getString("destination"));
                booking.put("departure_time", rs.getString("departure_time"));
                booking.put("duration", rs.getString("duration"));
                booking.put("price", rs.getString("price"));
                booking.put("description", rs.getString("description"));
                bookings.add(booking);
            }

            req.setAttribute("bookings", bookings);
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        RequestDispatcher rd = req.getRequestDispatcher("view.jsp");
        rd.forward(req, res);
    }
}

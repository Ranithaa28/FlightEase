package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BookTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String flightIdStr = request.getParameter("flight_id");
        int flightId = 0;
        if (flightIdStr != null && !flightIdStr.isEmpty()) {
            flightId = Integer.parseInt(flightIdStr);
        }

        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO bookings (name, flight_id) VALUES (?, ?)");
            ps.setString(1, name);
            ps.setInt(2, flightId);
            ps.executeUpdate();
            
            // Fetch flight details for email
            PreparedStatement flightPs = conn.prepareStatement("SELECT * FROM flights WHERE id = ?");
            flightPs.setInt(1, flightId);
            ResultSet rs = flightPs.executeQuery();
            if (rs.next()) {
                String airline = rs.getString("airline");
                String flightNumber = rs.getString("flight_number");
                String source = rs.getString("source");
                String destination = rs.getString("destination");
                String departureTime = rs.getString("departure_time");
                String price = String.valueOf(rs.getDouble("price"));
                
                HttpSession session = request.getSession(false);
                String userEmail = (session != null) ? (String) session.getAttribute("email") : null;
                
                if (userEmail != null) {
                    EmailService.sendBookingConfirmation(userEmail, name, airline, flightNumber, source, destination, departureTime, price);
                }
            }
            rs.close();
            flightPs.close();

            conn.close();

            // ✅ Redirect to View Bookings Page
            response.sendRedirect("view.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

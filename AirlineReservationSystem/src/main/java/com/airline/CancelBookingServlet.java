package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String bookingId = req.getParameter("id");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/airline_db", "root", "root123");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM bookings WHERE id = ?");
            ps.setString(1, bookingId);
            ps.executeUpdate();
            ps.setInt(1, Integer.parseInt(bookingId));  // Since ID is likely integer


            res.sendRedirect("view.jsp");
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

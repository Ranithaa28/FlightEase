package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BookTicketServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String source = request.getParameter("source");
        String destination = request.getParameter("destination");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/airline_db", "root", "root123");

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO bookings (name, source, destination) VALUES (?, ?, ?)");
            ps.setString(1, name);
            ps.setString(2, source);
            ps.setString(3, destination);
            ps.executeUpdate();

            conn.close();

            // ✅ Redirect to View Bookings Page
            response.sendRedirect("view.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

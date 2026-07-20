package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());

            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO users (email, password) VALUES (?, ?)");
            ps.setString(1, email);
            ps.setString(2, password);
            ps.executeUpdate();

            conn.close();

            // ✅ Redirect to login page after successful registration:
            response.sendRedirect("index.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
            if (e.getMessage() != null && e.getMessage().toLowerCase().contains("unique")) {
                response.sendRedirect("register.jsp?error=email_exists");
            } else {
                response.getWriter().println("Database Error: " + e.getMessage());
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

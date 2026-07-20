package com.airline;

import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("email", email);
                res.sendRedirect("dashboard.jsp");
            } else {
                res.sendRedirect("index.jsp");
            }
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

package com.airline;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchFlightServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String from = request.getParameter("from");
        String to = request.getParameter("to");
        
        // If parameters are missing, just forward back to search page
        if (from == null || to == null || from.trim().isEmpty() || to.trim().isEmpty()) {
            request.getRequestDispatcher("search.jsp").forward(request, response);
            return;
        }

        List<Flight> flights = new ArrayList<>();

        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());

            PreparedStatement ps = conn.prepareStatement(
                "SELECT * FROM flights WHERE source = ? AND destination = ?");
            ps.setString(1, from);
            ps.setString(2, to);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Flight f = new Flight(
                    rs.getInt("id"),
                    rs.getString("airline"),
                    rs.getString("flight_number"),
                    rs.getString("source"),
                    rs.getString("destination"),
                    rs.getString("departure_time"),
                    rs.getString("duration"),
                    rs.getDouble("price"),
                    rs.getString("description")
                );
                flights.add(f);
            }

            conn.close();
            
            request.setAttribute("flights", flights);
            request.getRequestDispatcher("search.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}

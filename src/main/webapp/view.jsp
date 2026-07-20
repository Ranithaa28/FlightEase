<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">Your Bookings</div>
        <%
            try {
                Class.forName(com.airline.Config.getDriverClass());
                Connection conn = DriverManager.getConnection(com.airline.Config.getConnectionUrl(), com.airline.Config.getDbUser(), com.airline.Config.getDbPassword());

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(
                    "SELECT b.id AS booking_id, b.name AS passenger_name, " +
                    "f.airline, f.flight_number, f.source, f.destination, f.departure_time, f.duration, f.price, f.description " +
                    "FROM bookings b JOIN flights f ON b.flight_id = f.id"
                );
        %>
        <div class="table-container">
            <table>
            <tr>
                <th>Booking ID</th>
                <th>Passenger</th>
                <th>Flight No</th>
                <th>Departure</th>
                <th>Duration</th>
                <th>Description</th>
                <th>Price</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td>#<%= rs.getInt("booking_id") %></td>
                <td><%= rs.getString("passenger_name") %></td>
                <td><%= rs.getString("airline") %> (<%= rs.getString("flight_number") %>)</td>
                <td><%= rs.getString("departure_time") %></td>
                <td><%= rs.getString("duration") %></td>
                <td style="font-size: 12px; color: #555; max-width: 200px;"><%= rs.getString("description") %></td>
                <td>$<%= rs.getString("price") %></td>
                <td>
                   <form action="cancel.jsp" method="get" style="display:inline;">
    <input type="hidden" name="id" value="<%= rs.getInt("booking_id") %>">
    <button type="submit" class="btn btn-danger">Cancel</button>
</form>

                </td>
            </tr>
            <%
                }
                conn.close();
            %>
            </table>
        </div>
        <%
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
        %>
        <div class="nav-links">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

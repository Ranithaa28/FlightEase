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
                Class.forName("com.mysql.cj.jdbc.Driver");
                String dbHost = com.airline.Config.getDbHost();
                String jdbcUrl = "jdbc:mysql://" + dbHost + ":3306/airline_db?useSSL=false&allowPublicKeyRetrieval=true";
                Connection conn = DriverManager.getConnection(jdbcUrl, "root", "root123");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");
        %>
        <div class="table-container">
            <table>
            <tr>
                <th>ID</th>
                <th>Passenger Name</th>
                <th>Source</th>
                <th>Destination</th>
                <th>Action</th>
            </tr>
            <%
                while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("name") %></td>
                <td><%= rs.getString("source") %></td>
                <td><%= rs.getString("destination") %></td>
                <td>
                   <form action="cancel.jsp" method="get" style="display:inline;">
    <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
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

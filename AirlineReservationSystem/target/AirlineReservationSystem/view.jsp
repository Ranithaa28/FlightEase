<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <div class="header">Your Bookings</div>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/airline_db", "root", "root123");

                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM bookings");
        %>
        <table border="1" cellpadding="10">
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
    <button type="submit" class="btn">Cancel</button>
</form>

                </td>
            </tr>
            <%
                }
                conn.close();
            %>
        </table>
        <%
            } catch (Exception e) {
                out.print("Error: " + e.getMessage());
            }
        %>
        <div class="nav-links">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String confirm = request.getParameter("confirm");

    if (confirm != null && confirm.equals("yes")) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/airline_db", "root", "root123");
            PreparedStatement ps = conn.prepareStatement("DELETE FROM bookings WHERE id = ?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
            conn.close();
%>
            <script>
                alert("Booking cancelled successfully!");
                window.location.href = "view.jsp";
            </script>
<%
        } catch (Exception e) {
            out.print("Error: " + e.getMessage());
        }
    } else {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Confirm Cancellation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="container">
        <h2>Cancel Booking ID: <%= id %></h2>
        <p>Are you sure you want to cancel this booking?</p>
        <form action="cancel.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="hidden" name="confirm" value="yes">
            <button type="submit" class="btn">Yes, Cancel</button>
        </form>
        <div class="nav-links">
            <a href="view.jsp">No, Go Back</a>
        </div>
    </div>
</body>
</html>
<%
    }
%>

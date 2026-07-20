<%@ page import="java.sql.*" %>
<%
    String id = request.getParameter("id");
    String confirm = request.getParameter("confirm");

    if (confirm != null && confirm.equals("yes") && id != null && !id.isEmpty()) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbHost = com.airline.Config.getDbHost();
            String jdbcUrl = "jdbc:mysql://" + dbHost + ":3306/airline_db?useSSL=false&allowPublicKeyRetrieval=true";
            Connection conn = DriverManager.getConnection(jdbcUrl, "root", "root123");
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
            return;
        } catch (Exception e) {
            out.print("<script>alert('Error: " + e.getMessage() + "'); window.location.href='cancel.jsp';</script>");
            return;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Cancel Ticket - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <% if (id != null && !id.isEmpty() && confirm == null) { %>
            <h2>Cancel Booking ID: <%= id %></h2>
            <p>Are you sure you want to cancel this booking?</p>
            <form action="cancel.jsp" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <input type="hidden" name="confirm" value="yes">
                <button type="submit" class="btn btn-danger">Yes, Cancel <i class="fa-solid fa-trash"></i></button>
            </form>
            <div class="nav-links">
                <a href="view.jsp"><i class="fa-solid fa-arrow-left"></i> No, Go Back</a>
            </div>
        <% } else { %>
            <div class="header-container">
                <div class="header">Cancel Ticket</div>
                <p class="sub-description" style="margin-top: -15px; margin-bottom: 25px;">Plans changed? No worries. Enter your Ticket ID to cancel your booking.</p>
            </div>
            <form action="cancel.jsp" method="get">
                <div class="input-box">
                    <i class="fa-solid fa-hashtag"></i>
                    <input type="text" name="id" placeholder="Enter Booking ID" required>
                </div>
                <button type="submit" class="btn btn-danger">Continue <i class="fa-solid fa-arrow-right"></i></button>
            </form>
            <div class="nav-links">
                <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
            </div>
        <% } %>
    </div>
</body>
</html>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container" style="max-width: 700px;">
        <div class="header">Discover Your Journey</div>
        
        <form action="search.jsp" method="get">
            <div style="display: flex; gap: 15px;">
                <div class="input-box">
                    <i class="fa-solid fa-plane-departure"></i>
                    <input type="text" name="from" placeholder="From (e.g. NYC)" required value="<%= request.getParameter("from") != null ? request.getParameter("from") : "" %>">
                </div>
                <div class="input-box">
                    <i class="fa-solid fa-plane-arrival"></i>
                    <input type="text" name="to" placeholder="To (e.g. LAX)" required value="<%= request.getParameter("to") != null ? request.getParameter("to") : "" %>">
                </div>
            </div>
            <div class="input-box">
                <i class="fa-solid fa-calendar-days"></i>
                <input type="date" name="date" required value="<%= request.getParameter("date") != null ? request.getParameter("date") : "" %>">
            </div>
            <button type="submit" class="btn btn-accent">Search Flights <i class="fa-solid fa-magnifying-glass"></i></button>
        </form>

        <%
            String from = request.getParameter("from");
            String to = request.getParameter("to");
            if (from != null && to != null && !from.isEmpty() && !to.isEmpty()) {
        %>
            <div class="header" style="font-size: 24px; margin-top: 40px; margin-bottom: 20px;">
                Flights from <strong><%= from %></strong> to <strong><%= to %></strong>
            </div>
            <div class="table-container">
                <table>
                    <tr>
                        <th>Airline</th>
                        <th>Departure</th>
                        <th>Duration</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <tr>
                        <td><strong>Tulip Air</strong></td>
                        <td>08:00 AM</td>
                        <td>3h 15m</td>
                        <td>$199</td>
                        <td><a href="book.jsp?from=<%= from %>&to=<%= to %>" class="btn btn-accent" style="padding: 8px 12px; margin: 0; font-size: 13px;">Book</a></td>
                    </tr>
                    <tr>
                        <td><strong>Sky Bloom</strong></td>
                        <td>12:30 PM</td>
                        <td>3h 30m</td>
                        <td>$149</td>
                        <td><a href="book.jsp?from=<%= from %>&to=<%= to %>" class="btn btn-accent" style="padding: 8px 12px; margin: 0; font-size: 13px;">Book</a></td>
                    </tr>
                    <tr>
                        <td><strong>Aero Petal</strong></td>
                        <td>06:45 PM</td>
                        <td>4h 00m</td>
                        <td>$129</td>
                        <td><a href="book.jsp?from=<%= from %>&to=<%= to %>" class="btn btn-accent" style="padding: 8px 12px; margin: 0; font-size: 13px;">Book</a></td>
                    </tr>
                </table>
            </div>
        <% } %>

        <div class="nav-links">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

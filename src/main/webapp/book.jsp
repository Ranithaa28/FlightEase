<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
   
    <div class="container">
         <div class="header-container">
            <div class="header">Book Your Ticket</div>
            <p class="sub-description" style="margin-top: -15px; margin-bottom: 25px;">Please enter your details below to confirm your flight booking.</p>
         </div>
         
         <%
            String flightId = request.getParameter("flight_id");
            String airline = request.getParameter("airline");
            String source = request.getParameter("source");
            String destination = request.getParameter("destination");
            String price = request.getParameter("price");
            String departure = request.getParameter("departure");
         %>
         
         <% if (flightId != null) { %>
         <div style="background-color: #f8f9fa; padding: 15px; border-radius: 8px; margin-bottom: 20px; text-align: left; border-left: 4px solid #3498db;">
             <strong style="color: #333; font-size: 16px;">Selected Flight:</strong><br>
             <span style="color: #555; font-size: 14px;">
                 <strong><%= airline %></strong> (<%= source %> <i class="fa-solid fa-arrow-right"></i> <%= destination %>)<br>
                 Departure: <%= departure %><br>
                 Price: $<%= price %>
             </span>
         </div>
         <% } %>
         
        <form action="book" method="post">
            <input type="hidden" name="flight_id" value="<%= flightId != null ? flightId : "" %>">
            <div class="input-box">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="name" placeholder="Passenger Name" required>
            </div>
            <button type="submit" class="btn" style="width: 100%;">Confirm Booking <i class="fa-solid fa-check"></i></button>
        </form>
        <div class="nav-links">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

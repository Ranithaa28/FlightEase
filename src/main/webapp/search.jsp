<%@ page session="true" import="java.util.List, com.airline.Flight" %>
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container" style="max-width: 700px;">
        <div class="header-container">
            <div class="header">Discover Your Journey</div>
            <p class="tagline">Unleash Your Wanderlust. Discover Deals to Dream Destinations.</p>
        </div>
        
        <form action="search" method="get">
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
            List<Flight> flights = (List<Flight>) request.getAttribute("flights");
            if (from != null && to != null && !from.isEmpty() && !to.isEmpty()) {
        %>
            <div class="header" style="font-size: 24px; margin-top: 40px; margin-bottom: 20px;">
                Flights from <strong><%= from %></strong> to <strong><%= to %></strong>
            </div>

            <div class="map-container" style="margin-bottom: 30px;">
                <iframe 
                    width="100%" 
                    height="350" 
                    frameborder="0" 
                    style="border:0; border-radius: 12px; box-shadow: 0 4px 15px rgba(0,0,0,0.1);"
                    src="https://maps.google.com/maps?saddr=<%= java.net.URLEncoder.encode(from, "UTF-8") %>&daddr=<%= java.net.URLEncoder.encode(to, "UTF-8") %>&output=embed"
                    allowfullscreen>
                </iframe>
            </div>

            <% if (flights != null && !flights.isEmpty()) { %>
            <div class="table-container">
                <table>
                    <tr>
                        <th>Airline</th>
                        <th>Flight No</th>
                        <th>Departure</th>
                        <th>Duration</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Action</th>
                    </tr>
                    <% for (Flight f : flights) { %>
                    <tr>
                        <td><strong><%= f.getAirline() %></strong></td>
                        <td><%= f.getFlightNumber() %></td>
                        <td><%= f.getDepartureTime() %></td>
                        <td><%= f.getDuration() %></td>
                        <td style="font-size: 12px; color: #555; max-width: 200px;"><%= f.getDescription() %></td>
                        <td>$<%= f.getPrice() %></td>
                        <td><a href="book.jsp?flight_id=<%= f.getId() %>&airline=<%= java.net.URLEncoder.encode(f.getAirline(), "UTF-8") %>&source=<%= f.getSource() %>&destination=<%= f.getDestination() %>&price=<%= f.getPrice() %>&departure=<%= java.net.URLEncoder.encode(f.getDepartureTime(), "UTF-8") %>" class="btn btn-accent" style="padding: 8px 12px; margin: 0; font-size: 13px;">Book</a></td>
                    </tr>
                    <% } %>
                </table>
            </div>
            <% } else { %>
                <p style="text-align: center; font-size: 18px; color: #666; margin-top: 20px;">No flights found for this route.</p>
            <% } %>
        <% } else { %>
            <div class="popular-routes-container">
                <h3 style="text-align: left; margin-bottom: 15px; margin-top: 30px;"><i class="fa-solid fa-fire"></i> Popular Routes</h3>
                <div class="popular-routes">
                    <div class="route-card" onclick="document.querySelector('input[name=\'from\']').value='NYC'; document.querySelector('input[name=\'to\']').value='LAX';">
                        <div class="route-icon"><i class="fa-solid fa-plane"></i></div>
                        <div class="route-details">
                            <span class="route-name">NYC to LAX</span>
                            <span class="route-price">From $149</span>
                        </div>
                    </div>
                    <div class="route-card" onclick="document.querySelector('input[name=\'from\']').value='LHR'; document.querySelector('input[name=\'to\']').value='CDG';">
                        <div class="route-icon"><i class="fa-solid fa-plane"></i></div>
                        <div class="route-details">
                            <span class="route-name">LHR to CDG</span>
                            <span class="route-price">From $99</span>
                        </div>
                    </div>
                     <div class="route-card" onclick="document.querySelector('input[name=\'from\']').value='SFO'; document.querySelector('input[name=\'to\']').value='JFK';">
                        <div class="route-icon"><i class="fa-solid fa-plane"></i></div>
                        <div class="route-details">
                            <span class="route-name">SFO to JFK</span>
                            <span class="route-price">From $199</span>
                        </div>
                    </div>
                </div>
            </div>
        <% } %>

        <div class="nav-links">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

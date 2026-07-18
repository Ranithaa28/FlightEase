<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>FlightEase Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="dashboard-box">
            <div class="header">
                FlightEase Dashboard
            </div>

            <div class="welcome-msg">
                Welcome,
                <strong><%= (session.getAttribute("email") != null) ? session.getAttribute("email") : "Guest" %></strong>!
            </div>

            <div class="stats-container">
                <div class="stat-item">
                    <span class="stat-value">12</span>
                    <span class="stat-label">Flights</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">3</span>
                    <span class="stat-label">Upcoming</span>
                </div>
                <div class="stat-item">
                    <span class="stat-value">8k</span>
                    <span class="stat-label">Miles</span>
                </div>
            </div>

            <div class="nav-links">
                <a href="search.jsp"><i class="fa-solid fa-magnifying-glass"></i> Search Flights</a>
                <a href="book.jsp"><i class="fa-solid fa-ticket-airline"></i> Book Ticket</a>
                <a href="view.jsp"><i class="fa-solid fa-list-check"></i> View Bookings</a>
                <a href="profile.jsp"><i class="fa-solid fa-user"></i> My Profile</a>
                <a href="cancel.jsp"><i class="fa-solid fa-ban"></i> Cancel Ticket</a>
                <a href="index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a>
            </div>

            <div class="footer-note">
                ✈️ Safe travels! Manage your bookings with ease.
            </div>
        </div>
    </div>
</body>
</html>

<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
        .dashboard-box {
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0, 0, 0, 0.2);
            text-align: center;
            max-width: 400px;
            margin: auto;
        }

        .dashboard-box h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .dashboard-box .nav-links a {
            display: block;
            margin: 10px 0;
            background-color: #009688;
            color: white;
            padding: 12px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .dashboard-box .nav-links a:hover {
            background-color: #00796b;
        }

        .welcome-msg {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }

        .footer-note {
            margin-top: 20px;
            font-size: 14px;
            color: #888;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-box">
            <div class="header" style="background-color: #00796b; color: #fff; padding: 10px; border-radius: 8px;">
                <h2>Airline Dashboard</h2>
            </div>

            <div class="welcome-msg">
                Welcome,
                <strong><%= (session.getAttribute("email") != null) ? session.getAttribute("email") : "Guest" %></strong>!
            </div>

            <div class="nav-links">
                <a href="book.jsp">Book Ticket</a>
                <a href="view.jsp">View Bookings</a>
                <a href="cancel.jsp">Cancel Ticket</a>
                <a href="index.jsp">Logout</a>
            </div>

            <div class="footer-note">
                ✈️ Safe travels! Manage your bookings with ease.
            </div>
        </div>
    </div>
</body>
</html>

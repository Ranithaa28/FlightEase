<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Profile - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="container">
        <div class="header">User Profile</div>
        
        <div style="text-align: center; margin-bottom: 25px;">
            <div style="width: 100px; height: 100px; background: var(--secondary); border-radius: 50%; display: inline-flex; align-items: center; justify-content: center; font-size: 40px; color: white; box-shadow: 0 5px 15px rgba(255,181,167, 0.5);">
                <i class="fa-solid fa-user"></i>
            </div>
        </div>

        <div class="profile-info">
            <div class="profile-row">
                <span class="profile-label">Email / Username</span>
                <span class="profile-value">
                    <%= (session.getAttribute("email") != null) ? session.getAttribute("email") : "guest@flightease.com" %>
                </span>
            </div>
            <div class="profile-row">
                <span class="profile-label">Account Status</span>
                <span class="profile-value" style="color: var(--accent); font-weight: 700;">
                    <i class="fa-solid fa-circle-check"></i> Active
                </span>
            </div>
            <div class="profile-row">
                <span class="profile-label">Frequent Flyer Tier</span>
                <span class="profile-value">Gold Member</span>
            </div>
        </div>

        <button class="btn" style="margin-bottom: 20px;">Edit Profile <i class="fa-solid fa-pen"></i></button>

        <div class="nav-links single-col">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Login & Register - Airline Reservation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    

    <div class="main-content">
        <div class="header">Airline Reservation System</div>
        <br>
        <!-- Login Form -->
        <div class="login-box">
            <h2>Login Form</h2>
            <form action="login" method="post" autocomplete="off">
                <div class="input-box">
                    <!-- <span class="icon">👤</span> -->
                    <input type="text" name="email" placeholder="Email or Phone" required autocomplete="off">
                </div>
                <div class="input-box">
                    <!-- <span class="icon">🔒</span> -->
                    <input type="password" name="password" placeholder="Password" required autocomplete="off">
                </div>
                <div class="forgot">
                    <a href="#">Forgot password?</a>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
            <p>Not a member? <a href="register.jsp">Signup now</a></p>
        </div>

        <!-- Popular Destinations Images -->
        <div class="image-box">
            <h2>Explore Popular Destinations</h2>
            <div class="image-gallery">
                <img src="images/flight1.jpg" alt="Flight" />
                <img src="images/flight2.jpg" alt="Flight" />
                <img src="images/destination1.jpg" alt="Destination" />
                <img src="images/destination2.jpg" alt="Destination" />
            </div>
        </div>
    </div>
</body>
</html>

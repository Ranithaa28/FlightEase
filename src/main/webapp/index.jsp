<!DOCTYPE html>
<html>
<head>
    <title>Login & Register - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    

    <div class="main-content">
        <div class="header">FlightEase</div>
        <!-- Login Form -->
        <div class="login-box">
            <h2>Login Form</h2>
            <form action="login" method="post" autocomplete="off">
                <div class="input-box">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" name="email" placeholder="Email or Phone" required autocomplete="new-password" value="">
                </div>
                <div class="input-box">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required autocomplete="off">
                </div>
                <div class="forgot">
                    <a href="#">Forgot password?</a>
                </div>
                <button type="submit" class="btn">Login <i class="fa-solid fa-arrow-right-to-bracket"></i></button>
            </form>
            <p>Not a member? <a href="register.jsp">Signup now</a></p>
        </div>

        <!-- Popular Destinations Images -->
        <div class="image-box">
            <h2>Explore Popular Destinations</h2>
            <div class="image-gallery">
                <div class="gallery-item"><img src="images/flight1.jpg" alt="Flight" /></div>
                <div class="gallery-item"><img src="images/flight2.jpeg" alt="Flight" /></div>
                <div class="gallery-item"><img src="images/destination1.jpg" alt="Destination" /></div>
                <div class="gallery-item"><img src="images/destination2.jpg" alt="Destination" /></div>
            </div>
        </div>
    </div>
</body>
</html>

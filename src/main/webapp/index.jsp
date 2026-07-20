<!DOCTYPE html>
<html>
<head>
    <title>Login & Register - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    

    <div class="main-content" style="flex-direction: column; align-items: center; max-width: 600px; margin: 0 auto;">
        <div class="header-container" style="width: 100%;">
            <div class="header">FlightEase</div>
            <p class="tagline">Elevate Your Journey. Seamless Booking, Limitless Horizons.</p>
        </div>
        <!-- Login Form -->
        <div class="login-box" style="margin: 0 auto; width: 100%;">
            <h2>Login Form</h2>
            <p class="sub-description">Welcome back! Please enter your details to access your account.</p>
            <form action="login" method="post" autocomplete="off">
                <!-- Trick to disable browser autofill -->
                <input style="display:none" type="text" name="fakeusernameremembered"/>
                <input style="display:none" type="password" name="fakepasswordremembered"/>
                
                <div class="input-box">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" name="email" placeholder="Email or Phone" required autocomplete="new-password">
                </div>
                <div class="input-box">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" name="password" placeholder="Password" required autocomplete="new-password">
                </div>
                <div class="forgot">
                    <a href="#">Forgot password?</a>
                </div>
                <button type="submit" class="btn">Login <i class="fa-solid fa-arrow-right-to-bracket"></i></button>
            </form>
            <p>Not a member? <a href="register.jsp">Signup now</a></p>
        </div>
    </div>
</body>
</html>

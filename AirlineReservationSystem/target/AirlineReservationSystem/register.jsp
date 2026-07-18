<!DOCTYPE html>
<html>
<head>
    <title>Register - Airline Reservation</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h2>Signup Form</h2>
            <form action="register" method="post">
                <div class="input-box">
                    <!-- <span class="icon">📧</span> -->
                    <input type="text" name="email" placeholder="Email" required>
                </div>
                <div class="input-box">
                    <!-- <span class="icon">🔒</span> -->
                    <input type="password" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn">Signup</button>
            </form>
            <p>Already a member? <a href="index.jsp">Login here</a></p>
        </div>
    </div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Register - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <div class="login-box">
        <h2>Signup Form</h2>
        <% if ("email_exists".equals(request.getParameter("error"))) { %>
            <p style="color: #e74c3c; font-weight: bold; text-align: center; margin-bottom: 15px;"><i class="fa-solid fa-triangle-exclamation"></i> Email is already registered.</p>
        <% } %>
        <form action="register" method="post">
            <div class="input-box">
                <i class="fa-solid fa-envelope"></i>
                <input type="text" name="email" placeholder="Email" required autocomplete="new-password" value="">
            </div>
            <div class="input-box">
                <i class="fa-solid fa-lock"></i>
                <input type="password" name="password" placeholder="Password" required>
            </div>
            <button type="submit" class="btn">Signup <i class="fa-solid fa-user-plus"></i></button>
        </form>
        <p>Already a member? <a href="index.jsp">Login here</a></p>
    </div>
</body>
</html>

<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket - FlightEase</title>
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
   
    <div class="container">
         <div class="header">Book Your Ticket</div>
        <form action="book" method="post">
            <div class="input-box">
                <i class="fa-solid fa-user"></i>
                <input type="text" name="name" placeholder="Passenger Name" required>
            </div>
            <div class="input-box">
                <i class="fa-solid fa-plane-departure"></i>
                <input type="text" name="source" placeholder="Source" required>
            </div>
            <div class="input-box">
                <i class="fa-solid fa-plane-arrival"></i>
                <input type="text" name="destination" placeholder="Destination" required>
            </div>
            <button type="submit" class="btn">Book Now <i class="fa-solid fa-paper-plane"></i></button>
        </form>
        <div class="nav-links">
            <a href="dashboard.jsp"><i class="fa-solid fa-arrow-left"></i> Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

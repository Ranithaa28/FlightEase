<!DOCTYPE html>
<html>
<head>
    <title>Book Ticket</title>
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
   
    <div class="container">
         <div class="header">Book Your Ticket</div>
         <br>
        <form action="book" method="post">
            <input type="text" name="name" placeholder="Passenger Name" required>
            <input type="text" name="source" placeholder="Source" required>
            <input type="text" name="destination" placeholder="Destination" required>
            <button type="submit">Book Now</button>
        </form>
        <div class="nav-links">
            <a href="dashboard.jsp">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>

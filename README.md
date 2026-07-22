# ✈️ FlightEase (Simple Airline Reservation System)

Welcome to **FlightEase**! This is a simple, easy-to-use web application built with Java that allows users to search for flights, book tickets, and manage their reservations.

## ✨ What can it do?
- **User Accounts:** You can register a new account and log in.
- **Search Flights:** Find available flights based on your destination.
- **Book Tickets:** Reserve a seat on your chosen flight.
- **Manage Bookings:** View or cancel your existing tickets.

## 🛠️ What is it built with?
- **Backend:** Java (Servlets & JSP)
- **Database:** MySQL
- **Frontend:** HTML, CSS, JavaScript
- **Server:** Apache Tomcat (built-in via Maven)

---

## 🚀 How to Run the Project (Step-by-Step)

Don't worry if you're new to this! Just follow these basic steps to get the app running on your computer.

### Step 1: Set up the Database in MySQL Workbench
1. Open **MySQL Workbench** and create a new schema (database) named `airline_db`.
2. Open a new **SQL Query Tab**.
3. Copy the SQL code that creates the `users`, `flights`, and `bookings` tables (along with the sample flight data) and paste it into the query window.
4. Click the yellow lightning bolt icon (⚡) to run the code. Your database is now ready!

### Step 2: Update the Database Password
1. In your code editor, open the file located at: `src/main/java/com/airline/Config.java`.
2. Look for the `getDbPassword()` method.
3. Change the password to match your MySQL Workbench password (for example, `"root123"`).

### Step 3: Start the Application
1. Open your **Terminal** or **Command Prompt**.
2. Navigate to the project folder where this code is saved.
3. Run this command to start the web server:
   ```bash
   mvn tomcat7:run
   ```
4. Wait a few seconds until the terminal says the server has started.

### Step 4: Open in Browser
Open your favorite web browser (Chrome, Edge, Safari) and go to:
👉 **`http://localhost:8080/`**

You can log in using the default admin account to test it out:
- **Email:** `admin@example.com`
- **Password:** `admin`

Happy coding! 🎉

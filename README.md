# FlightEase - Airline Reservation System

FlightEase is a Java-based web application designed to facilitate airline ticket reservations, flight searches, and booking management.

## Core Features
*   **Authentication:** Secure user registration and login functionality.
*   **Flight Operations:** Search for available flights based on routes and schedules.
*   **Booking Management:** Seamlessly book, view, and cancel flight tickets.
*   **Responsive UI:** A modern web interface designed for ease of use.

## Tech Stack
*   **Backend:** Java Servlets, JSP (JavaServer Pages)
*   **Database:** MySQL
*   **Frontend:** HTML, CSS, JavaScript
*   **Build Tool / Server:** Maven (Tomcat 7 Plugin)

---

## Prerequisites
Before running the application, ensure your environment has the following installed:
*   **Java Development Kit (JDK)** 8 or higher
*   **Apache Maven**
*   **MySQL Server** (Running on default port `3306`)
*   **MySQL Workbench** (or any preferred SQL client)

## Setup Instructions

### 1. Database Initialization
1. Open MySQL Workbench and create a new schema named `airline_db`.
2. Run the provided database initialization SQL script to generate the necessary tables (`users`, `flights`, `bookings`) and insert the sample flight data.
3. Ensure the script executes successfully without errors, as the `bookings` table relies on a foreign key relationship with the `flights` table.

### 2. Configure Database Connection
Update the database credentials in the application to match your local MySQL server setup:
1. Open `src/main/java/com/airline/Config.java`.
2. Modify `getDbPassword()` to return your local MySQL password.
3. If your MySQL server is running on a port other than `3306`, update the `getConnectionUrl()` accordingly.

### 3. Build and Run
The project uses the Tomcat 7 Maven plugin, so no external Tomcat installation is required.
1. Open a terminal in the project root directory.
2. Compile and start the server using:
   ```bash
   mvn tomcat7:run
   ```
3. The server will start and host the application locally.

### 4. Access the Application
Navigate to the following URL in your web browser:
**`http://localhost:8080/`**

---

## Important Notes & Default Credentials
*   **Default Admin Account:** 
    *   Email: `admin@example.com`
    *   Password: `admin`
*   **Database Integrity:** The database uses `ON DELETE CASCADE` for bookings linked to flights. Removing a flight will automatically clear all associated user bookings.

---

## 🛠️ Troubleshooting

**Error: "Address already in use" OR "Failed to delete target folder"**
If you try to run the application or build it and get an error saying the port is in use, or Maven cannot clean the `target` directory, it means another instance of the server is still running in the background. 

You can forcefully stop the existing Java process by running one of the following commands in your terminal:

*   **Windows (Command Prompt):**
    ```cmd
    taskkill /F /IM java.exe
    ```
*   **Windows (PowerShell):**
    ```powershell
    Stop-Process -Name java -Force
    ```
*   **Mac / Linux:**
    ```bash
    pkill java
    ```
After running the command, try your Maven command again!

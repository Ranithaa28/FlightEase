
# Simple Airline Reservation System

A Java-based web application for an Airline Reservation System.

## Features

- **User Authentication:** Registration and Login functionality.
- **Flight Search:** Users can search for available flights between destinations.
- **Booking Management:** Book tickets, view current bookings, and cancel tickets.
- **Modern UI:** Responsive design using the Tulip Theme.

## Technologies Used

- **Backend:** Java Servlets, JSP (JavaServer Pages)
- **Database:** MySQL
- **Frontend:** HTML, CSS, JavaScript
- **Build Tool:** Maven
- **Orchestration:** Docker & Docker Compose

## Setup and Installation

### Using Docker (Recommended)

1. Ensure you have Docker and Docker Compose installed.
2. Run the following command in the project root:
   ```bash
   docker-compose up -d
   ```
3. The application will be available at `http://localhost:8080/AirlineReservationSystem`

### Manual Setup (Maven & Tomcat)

1. Update the database connection settings in the source code to point to your local MySQL instance.
2. Create the necessary database tables by executing `init.sql`.
3. Build the project using Maven:
   ```bash
   mvn clean install
   ```
4. Deploy the generated `.war` file to your Tomcat or preferred application server.

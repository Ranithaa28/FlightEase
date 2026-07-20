-- Database is auto-created by H2 JDBC URL

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS flights (
    id INT AUTO_INCREMENT PRIMARY KEY,
    airline VARCHAR(255) NOT NULL,
    flight_number VARCHAR(50) NOT NULL,
    source VARCHAR(255) NOT NULL,
    destination VARCHAR(255) NOT NULL,
    departure_time VARCHAR(50) NOT NULL,
    duration VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    flight_id INT NOT NULL,
    FOREIGN KEY (flight_id) REFERENCES flights(id) ON DELETE CASCADE
);

-- Insert a test user
INSERT INTO users (email, password) VALUES ('admin@example.com', 'admin');

-- Insert Sample Flights
INSERT INTO flights (airline, flight_number, source, destination, departure_time, duration, price, description) VALUES
('Delta Airlines', 'DL101', 'NYC', 'LAX', '08:00 AM', '6h 15m', 299.99, 'Direct flight, economy class, free Wi-Fi'),
('United Airlines', 'UA205', 'NYC', 'LAX', '11:30 AM', '6h 30m', 279.50, 'Direct flight, complimentary snacks'),
('American Airlines', 'AA302', 'NYC', 'LAX', '04:45 PM', '6h 00m', 315.00, 'Direct flight, premium economy available'),
('British Airways', 'BA01', 'LHR', 'CDG', '09:00 AM', '1h 15m', 89.99, 'Short haul, breakfast included'),
('Air France', 'AF112', 'LHR', 'CDG', '02:30 PM', '1h 20m', 75.50, 'Short haul, standard seating'),
('Emirates', 'EK500', 'SFO', 'DXB', '10:00 AM', '15h 45m', 850.00, 'Long haul, Airbus A380, world-class entertainment'),
('JetBlue', 'B678', 'SFO', 'JFK', '01:15 PM', '6h 10m', 290.00, 'Direct flight, extra legroom'),
('Tulip Air', 'TA101', 'NYC', 'LAX', '07:00 AM', '5h 50m', 199.99, 'Budget friendly, no frills'),
('Sky Bloom', 'SB201', 'LHR', 'CDG', '06:00 PM', '1h 30m', 60.00, 'Evening flight, budget airline'),
('Singapore Airlines', 'SQ12', 'NRT', 'LAX', '05:00 PM', '10h 00m', 720.00, 'Award-winning service, direct flight'),
('Qantas', 'QF11', 'SYD', 'LAX', '09:30 AM', '13h 45m', 950.00, 'Direct flight, meals included'),
('Qatar Airways', 'QR832', 'DOH', 'BKK', '08:10 PM', '6h 30m', 480.00, 'Connecting flight, 5-star airline'),
('Lufthansa', 'LH400', 'FRA', 'JFK', '11:00 AM', '8h 25m', 650.00, 'Transatlantic flight, standard economy');

CREATE DATABASE IF NOT EXISTS airline_db;
USE airline_db;

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS bookings (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    source VARCHAR(255) NOT NULL,
    destination VARCHAR(255) NOT NULL
);

-- Insert a test user
INSERT INTO users (email, password) VALUES ('admin@example.com', 'admin') ON DUPLICATE KEY UPDATE email=email;

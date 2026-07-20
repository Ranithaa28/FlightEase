package com.airline;

import java.util.Properties;
import javax.mail.*;
import javax.mail.internet.*;

public class EmailService {

    // IMPORTANT: To send real emails, update these credentials with your actual SMTP server details.
    // E.g., for Gmail, use smtp.gmail.com and an App Password.
    private static final String SMTP_HOST = "mock"; // e.g. "smtp.gmail.com"
    private static final String SMTP_PORT = "587";
    private static final String USERNAME = "your_email@example.com";
    private static final String PASSWORD = "your_app_password";

    public static void sendBookingConfirmation(String toEmail, String passengerName, String airline, String flightNumber, String source, String destination, String departureTime, String price) {
        
        System.out.println("======================================================");
        System.out.println("Preparing to send booking confirmation email to: " + toEmail);
        
        String subject = "Flight Booking Confirmation - FlightEase";
        String body = "Dear " + passengerName + ",\n\n"
                    + "Your flight booking has been confirmed!\n\n"
                    + "Flight Details:\n"
                    + "Airline: " + airline + "\n"
                    + "Flight Number: " + flightNumber + "\n"
                    + "From: " + source + " To: " + destination + "\n"
                    + "Departure Time: " + departureTime + "\n"
                    + "Total Price: $" + price + "\n\n"
                    + "Thank you for choosing FlightEase!\n";

        if ("mock".equalsIgnoreCase(SMTP_HOST)) {
            System.out.println("\n[MOCK EMAIL SENT]");
            System.out.println("To: " + toEmail);
            System.out.println("Subject: " + subject);
            System.out.println("Body:\n" + body);
            System.out.println("======================================================");
            return;
        }

        Properties prop = new Properties();
        prop.put("mail.smtp.host", SMTP_HOST);
        prop.put("mail.smtp.port", SMTP_PORT);
        prop.put("mail.smtp.auth", "true");
        prop.put("mail.smtp.starttls.enable", "true"); //TLS

        Session session = Session.getInstance(prop,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(USERNAME, PASSWORD);
                    }
                });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(USERNAME));
            message.setRecipients(
                    Message.RecipientType.TO,
                    InternetAddress.parse(toEmail)
            );
            message.setSubject(subject);
            message.setText(body);

            Transport.send(message);

            System.out.println("Email successfully sent to " + toEmail);
            System.out.println("======================================================");

        } catch (MessagingException e) {
            System.err.println("Failed to send email: " + e.getMessage());
            e.printStackTrace();
        }
    }
}

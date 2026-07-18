package com.airline;

public class Config {
    public static String getDbHost() {
        String host = System.getenv("DB_HOST");
        return (host != null && !host.trim().isEmpty()) ? host : "localhost";
    }
}

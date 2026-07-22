package com.airline;

public class Config {
    public static String getConnectionUrl() {
        return "jdbc:mysql://localhost:3306/airline_db";
    }

    public static String getDbUser() {
        return "root";
    }

    public static String getDbPassword() {
        return "root123";
    }
    
    public static String getDriverClass() {
        return "com.mysql.cj.jdbc.Driver";
    }
}

package com.airline;

public class Config {
    public static String getConnectionUrl() {
        return "jdbc:h2:mem:airline_db;DB_CLOSE_DELAY=-1;MODE=MySQL";
    }

    public static String getDbUser() {
        return "sa";
    }

    public static String getDbPassword() {
        return "";
    }
    
    public static String getDriverClass() {
        return "org.h2.Driver";
    }
}

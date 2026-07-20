package com.airline;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

public class DatabaseInitListener implements ServletContextListener {

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        System.out.println("Initializing Database via H2...");
        try {
            Class.forName(Config.getDriverClass());
            Connection conn = DriverManager.getConnection(Config.getConnectionUrl(), Config.getDbUser(), Config.getDbPassword());
            Statement stmt = conn.createStatement();
            
            // Read init.sql from the classpath
            InputStream is = Thread.currentThread().getContextClassLoader().getResourceAsStream("init.sql");
            if (is == null) {
                System.out.println("init.sql not found!");
                return;
            }
            
            BufferedReader reader = new BufferedReader(new InputStreamReader(is));
            StringBuilder sql = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sql.append(line).append("\n");
            }
            
            // Execute the script
            stmt.execute(sql.toString());
            System.out.println("Database Initialization completed successfully.");
            
            reader.close();
            stmt.close();
            conn.close();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        // Cleanup if necessary
    }
}

FROM tomcat:9.0-jdk17

# Remove default Tomcat applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the built WAR file to the webapps directory as ROOT.war to serve at /
COPY target/AirlineReservationSystem.war /usr/local/tomcat/webapps/ROOT.war

# Expose Tomcat port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

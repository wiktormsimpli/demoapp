# Use Tomcat as the base image
FROM tomcat:latest

# Set environment variables for Java and Maven
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk
ENV MAVEN_HOME /usr/share/maven

# Install OpenJDK 8
RUN apt-get update && \
    apt-get install -y openjdk-8-jdk maven&& \
    apt-get clean;

# Copy the compiled WAR file into the webapps directory of Tomcat
COPY target/your-application.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]

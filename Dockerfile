FROM openjdk:17-slim

# Install netcat and other dependencies
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy the JAR file
COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar app.jar

# Create a health check script
COPY wait-for-mysql.sh /wait-for-mysql.sh
RUN chmod +x /wait-for-mysql.sh

# Use the script to wait for MySQL
CMD ["/wait-for-mysql.sh"]

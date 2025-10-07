FROM openjdk:17-slim

# Install netcat and other dependencies
RUN apt-get update && \
    apt-get install -y netcat-openbsd curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create app directory
WORKDIR /app

# Copy the JAR file
COPY target/spring-petclinic-2.1.0.BUILD-SNAPSHOT.jar app.jar

# Use a simpler approach - no external script needed
CMD ["sh", "-c", "echo 'Waiting for MySQL to be ready...'; while ! nc -z mysql 3306; do sleep 3; done; echo 'MySQL is up! Starting application...'; java -jar app.jar"]

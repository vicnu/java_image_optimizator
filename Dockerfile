# Use Maven base image to build the project
FROM maven:3.8.1-jdk-11 AS build

# Set the working directory
WORKDIR /app

# Copy the source code
COPY pom.xml /app/pom.xml
COPY src /app/src
COPY imgs /app/imgs

# Build the Java application using Maven
RUN mvn clean package

# Use a smaller JRE base image for running the application
FROM openjdk:11-jre-slim

# Set the working directory
WORKDIR /app

# Copy the built application from the Maven build stage
COPY --from=build /app/target /app/target
COPY entrypoint.sh /app/entrypoint.sh

# Make the entrypoint script executable
RUN chmod +x /app/entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/app/entrypoint.sh"]

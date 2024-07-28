# Use OpenJDK 11 as the base image
#FROM openjdk:11
FROM maven:latest

# Expose port 8080
#EXPOSE 8080

# Set the working directory to /app
WORKDIR /app

# Copy the Maven POM file to the container
COPY pom.xml .

# Copy the source code to the container
COPY src ./src



COPY target ./target

ADD target/dependency/* dependency/*
#ADD target/myjarfile.jar myjarfile.jar
#ADD target/myjarfile-tests.jar myjarfile-tests.jar

# Specify the entry point for the application
#CMD ["java", "-jar", "target/myjarfile-tests.jar"]

CMD ["mvn", "test"]
# Replace 'your-artifact-id' with the actual artifact ID generated by Maven
#FROM openjdk:11
#EXPOSE 8080
#ADD target/bank-api.jar bank-api.jar
#ENTRYPOINT ["java", "-jar", "/bank-api.jar"]



# Docker Build Stage
FROM openjdk:11 AS build

# Set the working directory
WORKDIR /opt/app

# Copy the entire project to the container
COPY ./ /opt/app

# Build the project with Maven
RUN mvn clean install -DskipTests


# Docker Build Stage
FROM openjdk:11

# Copy the JAR file from the build stage to the current directory
COPY --from=build /opt/app/target/*.jar bank-api.jar

# Expose the default port
EXPOSE 8081

EXPOSE $PORT

# Set the entry point for the container
ENTRYPOINT ["java", "-jar", "-Dserver.port=${PORT}","bank-api.jar"]

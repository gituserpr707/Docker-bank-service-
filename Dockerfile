FROM openjdk:11
EXPOSE 8080
ADD target/bank-api.jar bank-api.jar
ENTRYPOINT ["java", "-jar", "/bank-api.jar"]
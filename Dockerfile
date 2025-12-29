FROM eclipse-temurin:21-jdk
WORKDIR /app
ADD https://storage.googleapis.com/siva-gcs/sp /app/sp.jar
EXPOSE 8080
CMD ["java", "-jar", "sp.jar"]

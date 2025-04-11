FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

FROM openjdk:17-slim
COPY --from=build /app/target/demo-*.jar /app/demo.jar
ENTRYPOINT ["java", "-jar", "/app/demo.jar"]

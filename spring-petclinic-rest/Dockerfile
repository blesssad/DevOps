FROM eclipse-temurin:17-jdk-alpine AS build

RUN apk add --no-cache maven && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY . .

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

USER appuser

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

EXPOSE 9966

ENTRYPOINT ["java", "-jar", "/app/app.jar"]
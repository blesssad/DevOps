FROM eclipse-temurin:17-jdk-alpine AS build

RUN apk add --no-cache maven && \
    addgroup -S appgroup && adduser -S appuser -G appgroup && \
    rm -rf /var/cache/apk/*

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests && \
    rm -rf /root/.m2/repository

FROM eclipse-temurin:17-jre-alpine

RUN addgroup -S appgroup && adduser -S appuser -G appgroup

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar

RUN mkdir -p /app/logs && chown -R appuser:appgroup /app/logs

USER appuser

EXPOSE 9966

ENTRYPOINT ["java", "-jar", "/app/app.jar"]

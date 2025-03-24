# Используем образ JRE для финального образа
FROM eclipse-temurin:17-jre-alpine AS runtime

# Рабочий каталог
WORKDIR /app

# Создаём пользователя и группу
RUN addgroup -S appgroup && adduser -S appuser -G appgroup
USER appuser

# Копируем собранный JAR-файл из предыдущего этапа
COPY --from=my-build /app/target/*.jar app.jar

# Открываем порт для приложения
EXPOSE 9966

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
# Используем базовый образ
FROM eclipse-temurin:17-jdk-alpine AS system

# Установка зависимостей
RUN apk add --no-cache maven && \
    addgroup -S appgroup && \
    adduser -S appuser -G appgroup

# Указываем правильный рабочий каталог
WORKDIR /app

# Копируем исходники из папки /src
COPY ../src/ .  # Путь меняем на правильный относительно нового расположения

# Удаляем кеш для оптимизации
RUN rm -rf /var/cache/apk/*

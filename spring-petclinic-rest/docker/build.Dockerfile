# Используем системный образ как базовый
FROM my-system AS build

# Рабочий каталог приложения
WORKDIR /app

# Копируем все файлы, включая pom.xml для Maven
COPY . .

# Собираем проект
RUN mvn clean package -DskipTests
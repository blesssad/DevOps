# Команды для запуска

1. docker build -t my-system -f docker/system.Dockerfile .
2. docker build -t my-build --build-arg BASE_IMAGE=my-system -f docker/build.Dockerfile .
3. docker-compose up --build
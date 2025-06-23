#!/bin/sh

# Скрипт для полного запуска системы с учетом подгрузки дампа базы данных

set -e


# 1. Ожидаем готовности базы данных
echo "Ожидаем готовности базы данных..."
# Загружаем переменные окружения из .env файла для доступа к имени пользователя и БД
if [ -f .env ]; then
  export $(cat .env | sed 's/#.*//g' | xargs)
fi

# 2. Запускаем все сервисы в фоновом режиме
echo "Запускаем все сервисы через docker-compose..."
docker-compose up -d

until docker exec strapiDB pg_isready -U "$DATABASE_USERNAME" -d "$DATABASE_NAME" -q; do
  >&2 echo "Postgres недоступен - ожидание..."
  sleep 1
done

>&2 echo "Postgres готов."

# 3. Загружаем дамп базы данных
echo "Загружаем дамп базы данных..."
docker cp db_dump.sql strapiDB:/tmp/db_dump.sql
docker exec strapiDB psql -U "$DATABASE_USERNAME" -d "$DATABASE_NAME" -f /tmp/db_dump.sql

echo "Система успешно запущена!"


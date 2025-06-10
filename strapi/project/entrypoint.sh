#!/bin/sh

set -e
cd "/app/project"

if [ ! -d "node_modules" ]; then
  echo "node_modules не найдена, устанавливаю зависимости..."
  npm install
fi

echo "Апгрейд Strapi..."
npm upgrade

if [ "$NODE_ENV" = "production" ]; then
  echo "Запуск Strapi в production..."
  npm run start
else
  echo "Запуск Strapi в development..."
  npm run develop
fi
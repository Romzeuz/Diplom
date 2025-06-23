FROM node:18-slim

# Установка системных зависимостей, необходимых для sharp и других пакетов Strapi
RUN apt-get update && apt-get install -y --no-install-recommends build-essential gcc autoconf automake

WORKDIR /app/project

# Копируем package.json и package-lock.json для установки зависимостей
COPY strapi/project/package*.json ./

# Устанавливаем зависимости, принудительно собирая нативные модули из исходников
RUN npm install

# Копируем остальные файлы проекта
COPY strapi/project/ .

# Собираем админ-панель Strapi для продакшена
RUN npm run build

# Запускаем приложение
CMD ["npm", "run", "start"]
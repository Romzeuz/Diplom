FROM node:22-alpine3.20
ARG NODE_ENV=development
ENV DATABASE_CLIENT=postgres
ENV DATABASE_HOST=strapiDB
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=postgres
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=postgres
ENV NODE_ENV=${NODE_ENV}
ARG DATABASE_CLIENT=${DATABASE_CLIENT}
ARG DATABASE_HOST=${DATABASE_HOST}
ARG DATABASE_PORT=${DATABASE_PORT}
ARG DATABASE_NAME=${DATABASE_NAME}
ARG DATABASE_USERNAME=${DATABASE_USERNAME}
ARG DATABASE_PASSWORD=${DATABASE_PASSWORD}

WORKDIR /app
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git

RUN npm install -g node-gyp

RUN DOCKER=true npx create-strapi@latest --use-npm --install --skip-cloud --no-example \
    --ts --no-git-init --dbclient ${DATABASE_CLIENT} \
    --dbhost ${DATABASE_HOST} \
    --dbport ${DATABASE_PORT} \
    --dbname ${DATABASE_NAME} \
    --dbpassword ${DATABASE_PASSWORD} \
    --dbusername ${DATABASE_USERNAME} project

WORKDIR /app/project

RUN ["npm", "run", "build"]

EXPOSE 1337
VOLUME ["/app/project"]

CMD ["npm", "run", "develop"]
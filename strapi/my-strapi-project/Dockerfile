FROM node:23-alpine3.20
# Installing libvips-dev for sharp Compatibility
RUN apk update && apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev git
ARG NODE_ENV=development
ENV DATABASE_CLIENT=postgres
ENV DATABASE_HOST=strapiDB
ENV DATABASE_PORT=5432
ENV DATABASE_NAME=postgres
ENV DATABASE_USERNAME=postgres
ENV DATABASE_PASSWORD=postgres
ENV NODE_ENV=${NODE_ENV}

WORKDIR /opt
RUN ["npx create-strapi@latest --use-npm --install --skip-cloud --no-example", \
"--ts --no-git-init --dbclient ${DATABASE_CLIENT}", \
"--dbhost ${DATABASE_HOST}", \
"--dbusername ${DATABASE_USERNAME}", \
"--dbssl false"]
ENV PATH=/opt/node_modules/.bin:$PATH

WORKDIR /opt/app
COPY . .
RUN chown -R node:node /opt/app
USER node
#RUN ["npm", "run", "build"]
EXPOSE 1337
CMD ["npm", "run", "develop"]

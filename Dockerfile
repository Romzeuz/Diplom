FROM node:22-alpine3.20

WORKDIR /app/project
COPY --chmod=0755 strapi/project/entrypoint.sh /app/project
CMD /bin/sh entrypoint.sh
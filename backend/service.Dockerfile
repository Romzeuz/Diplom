ARG BASE_IMAGE=python-base
ARG SERVICE_NAME=adapter
FROM python-base AS base

# Set the working directory
WORKDIR /app
COPY . .
CMD ["python", "$SERVICE_NAME.py"]


ARG BASE_IMAGE="python_base"
ARG SERVICE_NAME="adapter"
FROM ${BASE_IMAGE} as base

# Set the working directory
WORKDIR /app
COPY . .
CMD ["python", "${SERVICE_NAME}.py"]
ARG BASE_IMAGE="python_base"
FROM ${BASE_IMAGE} as base

WORKDIR /app
COPY . .

CMD ["fastapi", "dev", "gateway.py"]
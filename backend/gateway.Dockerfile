ARG BASE_IMAGE=python-base
FROM python-base AS base

WORKDIR /app
COPY . .

CMD ["fastapi", "run", "router.py"]
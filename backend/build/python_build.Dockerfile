# Dockerfile for building a Python application
# using Python 3.13 on Alpine Linux
# Contains all needed modules for project
FROM python:3.13-alpine

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
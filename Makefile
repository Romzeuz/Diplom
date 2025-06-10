build-python:
	docker build -f backend/build/python_build.Dockerfile -t python-base backend

run:
	docker compose up --build -d

stop:
	docker compose down

all: build tag push

build:
	docker build -t kalamangga/spark-base:latest --rm .
tag:
	docker tag kalamangga/spark-base:latest kalamangga/spark-base:3.4.1
push:
	docker push kalamangga/spark-base:latest
	docker push kalamangga/spark-base:3.4.1

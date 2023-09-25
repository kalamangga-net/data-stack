all: build tag push

build:
	docker build -t kalamangga/hadoop-spark:latest --rm .
tag:
	docker tag kalamangga/hadoop-spark:latest kalamangga/hadoop-spark:3.3.3
push:
	docker push kalamangga/hadoop-spark:latest
	docker push kalamangga/hadoop-spark:3.3.3

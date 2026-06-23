all: build tag push

build:
	docker build -t kalamangga/hadoop-hive:latest --rm .
tag:
	docker tag kalamangga/hadoop-hive:latest kalamangga/hadoop-hive:4.0.1
push:
	docker push kalamangga/hadoop-hive:latest
	docker push kalamangga/hadoop-hive:4.0.1

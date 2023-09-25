all: build tag push

build:
	docker build -t kalamangga/hadoop-hive:latest --rm .
tag:
	docker tag kalamangga/hadoop-hive:latest kalamangga/hadoop-hive:3.1.3
push:
	docker push kalamangga/hadoop-hive:latest
	docker push kalamangga/hadoop-hive:3.1.3

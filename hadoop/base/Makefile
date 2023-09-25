all: build tag push

build:
	docker build -t kalamangga/hadoop-base:latest --rm .
tag:
	docker tag kalamangga/hadoop-base:latest kalamangga/hadoop-base:3.3.6
push:
	docker push kalamangga/hadoop-base:latest
	docker push kalamangga/hadoop-base:3.3.6
